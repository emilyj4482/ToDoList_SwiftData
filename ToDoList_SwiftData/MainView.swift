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
            }
            .navigationTitle("ToDoList")
        }
    }
}

#Preview {
    MainView()
}
