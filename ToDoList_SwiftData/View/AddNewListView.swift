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
    
    @State var text: String = ""
    @FocusState var focused: Bool
    
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
                    // TODO: textfield trim > group name
                    
                    
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

private extension AddNewListView {
    func getGroupName() {
        
    }
    
    // group name 중복검사
    func examGroupName() {
        
    }
}

#Preview {
    AddNewListView()
}
