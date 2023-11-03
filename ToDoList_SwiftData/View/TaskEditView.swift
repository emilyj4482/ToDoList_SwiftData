//
//  TaskEditView.swift
//  ToDoList_SwiftData
//
//  Created by EMILY on 11/2/23.
//

import SwiftUI
import SwiftData

struct TaskEditView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @FocusState var focused: Bool
    @State var taskTitle: String = ""
    
    var body: some View {
        HStack {
            Image(systemName: "circle")
                .foregroundStyle(.red)
            
            TextField("Enter a task.", text: $taskTitle)
                .focused($focused)
                .onSubmit {
                    dismiss()
                }
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                Text("Done")
            }
        }
        .padding(16)
        .onAppear {
            focused = true
        }
    }
}

#Preview {
    TaskEditView()
}
