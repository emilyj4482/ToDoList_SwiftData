//
//  AddNewListView.swift
//  ToDoList_SwiftData
//
//  Created by EMILY on 01/11/2023.
//

import SwiftUI
import SwiftData

struct AddNewListView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @Query private var groups: [Group]
    @State private var group = Group()
    
    @State var text: String = ""
    @FocusState var focused: Bool
    
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack {
            TextField("Untitled List", text: $text)
                .focused($focused)
                .font(.system(.largeTitle, weight: .bold))
                .padding(.leading, 16)
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button  {
                    // "Important" list name 금지 >> 입력 시 alert 호출
                    if getGroupName(text) == "Important" {
                        showAlert = true
                    } else {
                        group.name = examGroupName(getGroupName(text))
                        context.insert(group)
                        dismiss()
                    }
                } label: {
                    Text("Done")
                }
                .alert("You cannot name a list \"Important\"", isPresented: $showAlert) {}
            }
        }
        .onAppear {
            self.focused = true
        }
    }
}

private extension AddNewListView {
    func getGroupName(_ groupName: String) -> String {
        if groupName.trim().isEmpty {
            return "Untitled list"
        }
        return groupName.trim()
    }
    
    // group name 중복검사
    func examGroupName(_ text: String) -> String {
        let list = groups.map { group in
            group.name
        }
        
        var count = 1
        var groupName = text
        while list.contains(groupName) {
            groupName = "\(text) (\(count))"
            count += 1
        }
        return groupName
    }
}
