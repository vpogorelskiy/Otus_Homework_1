//
//  OtherViews.swift
//  OTUS_Homework_1
//
//  Created by Vyacheslav Pogorelskiy on 31/08/2021.
//

import SwiftUI

struct FirstView: View {
    
    @Binding var selection: Int
    
    var body: some View {
        Button("Go to the second") {
            selection = 1
        }
    }
}

struct ThirdView: View {
    var body: some View {
        NavigationLink(
            destination: Text("Modal Presented"),
            isActive: /*@START_MENU_TOKEN@*/.constant(true)/*@END_MENU_TOKEN@*/,
            label: {
                Text("Open modal")
            })
    }
}
