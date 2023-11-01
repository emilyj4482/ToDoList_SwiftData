//
//  TodoListView.swift
//  ToDoList_SwiftData
//
//  Created by EMILY on 02/11/2023.
//

import SwiftUI

struct TodoListView: View {
    
    @State var showModal: Bool = false
    
    var body: some View {
        VStack {
            List {
                TaskHStack()
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .listRowSpacing(5)
            .padding(.top, 5)
            
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
        .navigationTitle("Important")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    Text("Rename")
                }
            }
        }
        .sheet(isPresented: $showModal) {
            NavigationStack {
                TaskEditView()
            }
            .presentationDetents([.height(50)])
        }
    }
}

#Preview {
    TodoListView()
}
