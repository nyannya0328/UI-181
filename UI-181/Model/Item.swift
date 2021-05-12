//
//  Item.swift
//  UI-181
//
//  Created by にゃんにゃん丸 on 2021/05/11.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID().uuidString
    var name : String
    var image : String
    var offset : CGFloat
}

var items = [
    
    Item(name: "UnKnow", image: "p1", offset: 0),
    Item(name: "Sky Tree", image: "p2", offset: 0),
    Item(name: "I don't know this place", image: "p3", offset: 0),
    Item(name: "Incredible", image: "p4", offset: 0),
    Item(name: "Bridge", image: "p5", offset: 0),
    Item(name: "Amazing", image: "p6", offset: 0),
    Item(name: "Awsome", image: "p7", offset: 0),
    Item(name: "Super", image: "p8", offset: 0),
    Item(name: "City Firework", image: "p9", offset: 0),
]
