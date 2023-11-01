//
//  TaskHStack.swift
//  ToDoList_SwiftData
//
//  Created by EMILY on 11/2/23.
//

import SwiftUI

struct TaskHStack: View {
    var body: some View {
        HStack {
            Image(systemName: "circle")
                .foregroundStyle(.red)
            
            Text("study SwiftData")
            
            Spacer()
            
            Image(systemName: "star")
                .foregroundStyle(.yellow)
        }
    }
}

#Preview {
    TaskHStack()
}
