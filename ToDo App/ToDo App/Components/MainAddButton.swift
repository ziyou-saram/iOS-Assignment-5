//
//  MainAddButton.swift
//  ToDo App
//
//  Created by Alikhan Zhumabayev on 28.04.2022.
//

import SwiftUI

struct MainAddButton: View {
    var body: some View {
        ZStack {
            HStack {
                Text("Add Task")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("Elements"))
                
//                Circle()
//                    .frame(width: 50)
//                    .foregroundColor(Color("Elements"))
                
                Image(systemName: "pencil.circle")
                    .resizable(resizingMode: .stretch)
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color("Elements"))
            }
            
//            Text("Add")
//                .font(.title)
//                .fontWeight(.heavy)
//                .foregroundColor(.white)
                
                
        }
        .frame(height: 50)
    }
}

struct MainAddButton_Previews: PreviewProvider {
    static var previews: some View {
        MainAddButton()
    }
}
