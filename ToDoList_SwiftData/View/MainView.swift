//
//  MainView.swift
//  ToDoList_SwiftData
//
//  Created by EMILY on 01/11/2023.
//

import SwiftUI
import SwiftData

struct MainView: View {
    
    @Environment(\.modelContext) var context
    @Query private var groups: [Group]
    
    @State private var showAddView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(groups) { group in
                        NavigationLink {
                            TodoListView(group: group)
                        } label: {
                            HStack {
                                Image(systemName: "star.fill")
                                Text(group.name)
                                Spacer()
                                Text("\(group.tasks.count)")
                                    .font(.system(size: 10))
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .listRowSpacing(5)
                .padding(.top, 5)
                
                Text(
                    groups.count < 3 ? "You have \(groups.count - 1) custom list."
                    : "You have \(groups.count - 1) custom lists."
                )
                    .font(.system(size: 13))
                    .foregroundStyle(.tint)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .padding(.bottom, 5)
                
                Button {
                    showAddView.toggle()
                } label: {
                    HStack {
                        Image(systemName: "plus")
                        Text("New List")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
                .padding(.bottom, 5)
            }
            .navigationTitle("ToDoList")
            .sheet(isPresented: $showAddView) {
                NavigationStack {
                    AddNewListView()
                }
            }
        }
    }
}

#Preview {
    MainView()
}
