//
//  User.swift
//  SwiftDataProject
//
//  Created by Syaoki Biek on 14/09/25.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String
    var city: String
    var joinDate: Date
    
    // using macro of Relationship make us can control the variable of Job and give it some rules as example is cascade where it will automatically delete the Job Data in SwiftData if we deleting the owner
    @Relationship(deleteRule: .cascade) var jobs = [Job]()
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
