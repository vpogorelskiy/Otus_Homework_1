//
//  OtherViews.swift
//  OTUS_Homework_1
//
//  Created by Vyacheslav Pogorelskiy on 31/08/2021.
//

import SwiftUI

struct FirstView: View {
    
    @ObservedObject var model: ViewModel
    
    var body: some View {
        Button("Go to the second") {
            model.selectedScreen = 1
            model.selection = model.item.first?.id
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
