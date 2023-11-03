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
    
    @State private var group = Group()
    
    @FocusState var focused: Bool
    
    var body: some View {
        VStack {
            TextField("Untitled List", text: $group.name)
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
                    context.insert(group)
                    dismiss()
                } label: {
                    Text("Done")
                }
            }
        }
        .onAppear {
            self.focused = true
        }
    }
}

#Preview {
    AddNewListView()
}
