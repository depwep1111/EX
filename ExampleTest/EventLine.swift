//
//  EventLine.swift
//  ExampleTest
//
//  Created by tran trung thanh on 7/5/17.
//  Copyright © 2017 tran trung thanh. All rights reserved.
//

import Foundation
class EventLine
{
    var group: String // nhom uu tien
    var events: [Event]//
    init(groupName: String, includeEvents: [Event])
    {
        group = groupName
        events = includeEvents
    }
    class func eventLines() -> [EventLine]
    {
        return [self.group1(), self.group2()]
    }
    private class func group1() -> EventLine { // nhom uu tien 1
        
        var events = [Event]()
        
        events.append(Event(titled: "An sang"))
        events.append(Event(titled: "Di hoc"))
        return EventLine(groupName: "Group 1", includeEvents: events)
    }
    private class func group2() -> EventLine { // nhom uu tien 2
        
        var events = [Event]()
        
        events.append(Event(titled: "Di choi"))
        events.append(Event(titled: "Tham ong ba"))
        events.append(Event(titled: "Lam bai tap"))
        return EventLine(groupName: "Group 2", includeEvents: events)
    }
}
