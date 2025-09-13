//
//  Student.swift
//  Bookworm
//
//  Created by Syaoki Biek on 13/09/25.
//

import Foundation
import SwiftData

// First step by define the model using macro @Model from SwiftData
// @Model macro has automatically add Observable for the class
@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
