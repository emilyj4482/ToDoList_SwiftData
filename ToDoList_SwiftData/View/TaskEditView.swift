//
//  TaskEditView.swift
//  ToDoList_SwiftData
//
//  Created by EMILY on 02/11/2023.
//

import SwiftUI
import SwiftData

struct TaskEditView: View {
    
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    // task가 속한 group을 전달 받을 변수
    @Bindable var group: Group
    
    // textfield
    @FocusState var focused: Bool
    @State var taskTitle: String = ""
    
    // update 할 task를 전달 받을 변수
    @Binding var taskToEdit: Task?
    
    // task create mode인지 edit mode인지 구분
    var isCreating: Bool = true
    
    var body: some View {
        HStack {
            Image(systemName: !isCreating && taskToEdit?.isDone == true ? "checkmark.circle" : "circle")
                .foregroundStyle(!isCreating && taskToEdit?.isDone == true ? .green : .red)
            
            TextField("Enter a task.", text: $taskTitle)
                .focused($focused)
                .onSubmit {
                    dismiss()
                }
            
            Spacer()
            
            Button {
                if isCreating && !taskTitle.trim().isEmpty {
                    // create
                    let task = Task(title: taskTitle.trim(), groups: [group])
                    context.insert(task)
                    dismiss()
                } else if !isCreating && !taskTitle.trim().isEmpty {
                    // edit
                    taskToEdit?.title = taskTitle.trim()
                    dismiss()
                }
            } label: {
                Text("Done")
            }
        }
        .padding(16)
        .onAppear {
            focused = true
            // edit mode일 경우 기존 task title이 textfield에 입력된 상태
            if !isCreating {
                taskTitle = taskToEdit?.title ?? ""
            }
        }
    }
}

/*
#Preview {
    TaskEditView()
}
*/
