//
//  Item.swift
//  HoneyMoney
//
//  Created by ZHIWEN HUANG on 7/11/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

@Model
final class Expense {
    var id: UUID
    var title: String
    var amount: Double
    var category: String
    var timestamp: Date
    var icon: String
    
    init(title: String, amount: Double, category: String, timestamp: Date = Date(), icon: String = "dollarsign.circle") {
        self.id = UUID()
        self.title = title
        self.amount = amount
        self.category = category
        self.timestamp = timestamp
        self.icon = icon
    }
}

@Model
final class Category {
    var id: UUID
    var name: String
    var icon: String
    var color: String
    
    init(name: String, icon: String, color: String) {
        self.id = UUID()
        self.name = name
        self.icon = icon
        self.color = color
    }
}