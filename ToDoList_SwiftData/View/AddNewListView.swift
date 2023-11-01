//
//  AddNewListView.swift
//  ToDoList_SwiftData
//
//  Created by EMILY on 01/11/2023.
//

import SwiftUI

struct AddNewListView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var listName: String = ""
    @FocusState var focused: Bool
    
    var body: some View {
        VStack {
            TextField("Untitled List", text: $listName)
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
