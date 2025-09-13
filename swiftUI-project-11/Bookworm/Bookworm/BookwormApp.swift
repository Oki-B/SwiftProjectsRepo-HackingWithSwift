//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Syaoki Biek on 10/09/25.
//

import SwiftData
import SwiftUI
// second step is by injecting the container through the App File to be able accessed by all of the content of the apps

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            IntroToSwiftData()
        }
        .modelContainer(for: Student.self) // here we inject it
    }
}
