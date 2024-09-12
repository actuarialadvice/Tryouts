//
//  Item.swift
//  Tryouts
//
//  Created by Danette Cap on 9/11/24.
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
