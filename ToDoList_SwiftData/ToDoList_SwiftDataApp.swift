//
//  ToDoList_SwiftDataApp.swift
//  ToDoList_SwiftData
//
//  Created by EMILY on 11/1/23.
//

import SwiftUI
import SwiftData

@main
struct ToDoList_SwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .tint(.yellow)
                .modelContainer(for: [Group.self, Task.self])
        }
    }
}
