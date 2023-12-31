//
//  TodoListView.swift
//  ToDoList_SwiftData
//
//  Created by EMILY on 02/11/2023.
//

import SwiftUI
import SwiftData

struct TodoListView: View {
    
    @State private var showAlert: Bool = false
    @State private var newGroupName: String = ""
    
    @Query private var groups: [Group]
    @Bindable var group: Group
    
    @State private var showCreate: Bool = false
    @State private var showEdit: Bool = false
    @State private var taskToEdit: Task?
    
    var body: some View {
        VStack {
            List {
                Section {
                    ForEach(group.tasks.filter { !$0.isDone }.sorted(by: { $0.timestamp < $1.timestamp }) ) { task in
                        TaskHStack(task: task)
                            .listRowSeparator(.hidden)
                            .swipeActionModifier(group: group, task: task, taskToEdit: $taskToEdit, showEdit: $showEdit)
                    }
                }
                
                Section(group.tasks.filter { $0.isDone }.count == 0 ? "" : "tasks done!") {
                    ForEach(group.tasks.filter { $0.isDone }.sorted(by: { $0.timestamp < $1.timestamp }) ) { task in
                        TaskHStack(task: task)
                            .listRowSeparator(.hidden)
                            .swipeActionModifier(group: group, task: task, taskToEdit: $taskToEdit, showEdit: $showEdit)
                    }
                }
            }
            .listStyle(.plain)
            .listRowSpacing(5)
            .padding(.top, 5)
            
            // Important list에서는 task 추가 불가
            if group.name != "Important" {
                Button {
                    showCreate.toggle()
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
                        showAlert.toggle()
                    } label: {
                        Text("Rename")
                    }
                    .alert("Enter a new name for the list.", isPresented: $showAlert) {
                        TextField(group.name, text: $newGroupName)
                        Button("Confirm") {
                            if !newGroupName.trim().isEmpty {
                                group.name = newGroupName.trim()
                            }
                        }
                        Button("Cancel", role: .cancel) {}
                    }
                }
            }
        }
        .sheet(isPresented: $showCreate) {
            NavigationStack {
                TaskEditView(group: group, taskToEdit: $taskToEdit, isCreating: true)
            }
            .presentationDetents([.height(50)])
        }
        .sheet(isPresented: $showEdit) {
            NavigationStack {
                TaskEditView(group: group, taskToEdit: $taskToEdit, isCreating: false)
            }
            .presentationDetents([.height(50)])
        }
    }
}
