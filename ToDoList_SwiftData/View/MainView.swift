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
    @State private var showActionSheet: Bool = false
    
    // 잘못된 group 삭제 방지를 위해 실제 삭제 될 group을 담기 위한 빈 값
    @State private var itemToDelete: Group? = nil
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(groups) { group in
                        NavigationLink {
                            TodoListView(group: group)
                        } label: {
                            HStack {
                                Image(systemName: group.name == "Important" ? "star.fill" : "checklist.checked")
                                Text(group.name)
                                Spacer()
                                Text("\(group.tasks.count)")
                                    .font(.system(size: 10))
                                    .foregroundStyle(.gray)
                            }
                        }
                        .listRowSeparator(.hidden)
                        // swipe to delete
                        .swipeActions(allowsFullSwipe: false) {
                            // important group은 삭제 불가
                            if group.name != "Important" {
                                Button {
                                    itemToDelete = group
                                    showActionSheet = true
                                } label: {
                                    Image(systemName: "trash")
                                }
                                .tint(.red)
                            }
                        }
                        .confirmationDialog("Are you sure deleting the list?", isPresented: $showActionSheet, titleVisibility: .visible) {
                            Button("Delete", role: .destructive) {
                                if let item = itemToDelete {
                                    context.delete(item)
                                }
                            }
                            Button("Cancel", role: .cancel) {}
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
