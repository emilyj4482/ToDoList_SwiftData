//
//  ContentView.swift
//  ToDoList_SwiftData
//
//  Created by EMILY on 11/1/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    HStack {
                        Image(systemName: "star.fill")
                        Text("Important")
                        Spacer()
                        Text("10")
                            .font(.system(size: 10))
                            .foregroundStyle(.gray)
                    }
                }
                .listStyle(.plain)
                
                Text("You have 0 custom list.")
                    .font(.system(size: 13))
                    .foregroundStyle(.pink)
                
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "plus")
                        Text("New List")
                    }
                }
            }
            .navigationTitle("ToDoList")
        }
    }
}

#Preview {
    MainView()
}
