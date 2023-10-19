//
//  SheduleServerService.swift
//  FordsRewards
//
//  Created by Milo Woodman on 10/18/23.
//

import Foundation
import Firebase

class ScheduleService {
    static private var eventCache: [EventInfo] = []
    
    static func reloadCache() {
        let db = Firestore.firestore()
        
        db.collection("eventInfo").getDocuments { snapshot, err in
            if let e = err {
                print(e.localizedDescription)
                return
            }
            
            if let ss = snapshot {
                eventCache.removeAll()
                for i in ss.documents {
                    eventCache.append(EventInfo(data: i.data()))
                }
            } else {
                print("no snapshot received")
            }
        }
    }
    
    static func sortCache() {
        eventCache.sort { lhs, rhs in
            return lhs.eventDate < rhs.eventDate
        }
        
        print(eventCache)
    }
    
    static func eventsOnDate(_ date: Date) -> [EventInfo] {
        var events: [EventInfo] = []
        let (m, d, y) = CalendarHelper.toMDY(date)
        
        for i in eventCache {
            let (g_m, g_d, g_y) = CalendarHelper.toMDY(date)
            
            if (g_m == m && g_d == d && g_y == y) {
                events.append(i)
            }
        }
        
        return events
    }
}
