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
    
    @State var group: Group
    
    var body: some View {
        VStack {
            List {
                ForEach(group.tasks) { task in
                    TaskHStack(task: task)
                        .listRowSeparator(.hidden)
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
