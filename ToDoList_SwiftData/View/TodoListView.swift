//
//  TodoListView.swift
//  ToDoList_SwiftData
//
//  Created by EMILY on 02/11/2023.
//

import SwiftUI

struct TodoListView: View {
    var body: some View {
        VStack {
            
            List {
                HStack {
                    Image(systemName: "circle")
                        .foregroundStyle(.red)
                    
                    Text("to study")
                    
                    Spacer()
                    
                    Image(systemName: "star")
                        .foregroundStyle(.yellow)
                }
                // .padding([.top, .bottom], 5)
            }
            .listStyle(.plain)
            
            /*
            Button {
                
            } label: {
                HStack {
                    Image(systemName: "plus")
                    Text("Add a Task")
                }
            }
            .frame(minWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)
            .padding(.bottom, 5)
             */
            
        }
        .navigationTitle("Important")
    }
}

#Preview {
    TodoListView()
}
