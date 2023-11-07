//
//  TodoListView.swift
//  ToDoList_SwiftData
//
//  Created by EMILY on 02/11/2023.
//

import SwiftUI
import SwiftData

struct TodoListView: View {
    
    @State var showModal: Bool = false
    
    @Bindable var group: Group
    
    var body: some View {
        VStack {
            List {
                ForEach(group.tasks.sorted(by: { $0.timestamp < $1.timestamp })) { task in
                    TaskHStack(task: task)
                        .listRowSeparator(.hidden)
                        .swipeActions(allowsFullSwipe: false) {
                            // delete button
                            Button {
                                group.tasks.removeAll { $0.id == task.id }
                            } label: {
                                Image(systemName: "trash")
                            }
                            .tint(.red)
                            
                            // edit button
                            Button {
                                
                            } label: {
                                Image(systemName: "pencil")
                            }
                            .tint(.cyan)
                        }
                }
            }
            .listStyle(.plain)
            .listRowSpacing(5)
            .padding(.top, 5)
            
            // Important list에서는 task 추가 불가
            if group.name != "Important" {
                Button {
                    showModal.toggle()
                } label: {
                    HStack {
                        Image(systemName: "plus")
                        Text("Add a Task")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
                .padding(.bottom, 5)
            }
        }
        .navigationTitle(group.name)
        .toolbar {
            // Important list는 rename 불가
            if group.name != "Important" {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Text("Rename")
                    }
                }
            }
        }
        .sheet(isPresented: $showModal) {
            NavigationStack {
                TaskEditView(group: group)
            }
            .presentationDetents([.height(50)])
        }
    }
}

/*
#Preview {
    TodoListView(group: Group(name: "Important", tasks: []))
}
*/
