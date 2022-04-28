//
//  AddTaskView.swift
//  ToDo App
//
//  Created by Alikhan Zhumabayev on 28.04.2022.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var realmManager: RealmManager
    @State private var title: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Add one more Task")
                .font(.title3)
                .bold()
                .foregroundColor(Color("Title"))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Tap and Add the Task", text: $title)
                .textFieldStyle(.roundedBorder)
            
            Button {
                if title != "" {
                    realmManager.addTask(taskTitle: title)
                }
                dismiss()
            } label: {
                Text("Add Task")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color("Elements"))
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal)
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}
