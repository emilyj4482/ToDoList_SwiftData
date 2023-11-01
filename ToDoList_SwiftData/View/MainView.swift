//
//  ContentView.swift
//  ToDoList_SwiftData
//
//  Created by EMILY on 11/1/23.
//

import SwiftUI

struct MainView: View {
    
    @State private var showAddView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    NavigationLink {
                        TodoListView()
                    } label: {
                        HStack {
                            Image(systemName: "star.fill")
                            Text("Important")
                            Spacer()
                            Text("10")
                                .font(.system(size: 10))
                                .foregroundStyle(.gray)
                        }
                    }
                }
                .listStyle(.plain)
                .listRowSpacing(5)
                .padding(.top, 5)
                
                Text("You have 0 custom list.")
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
