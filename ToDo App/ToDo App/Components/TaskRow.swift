//
//  TaskRow.swift
//  ToDo App
//
//  Created by Alikhan Zhumabayev on 28.04.2022.
//

import SwiftUI

struct TaskRow: View {
    var task: String
    var done: Bool
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: done ? "checkmark.circle" : "circle")
                .foregroundColor(Color("Elements"))
            
            Text(task)
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: "Learn SwiftUI and Be Great", done: true)
    }
}
