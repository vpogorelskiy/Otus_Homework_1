//
//  ContentView.swift
//  Shared
//
//  Created by Вячеслав Погорельский on 28.08.2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        TabView(selection: $model.selectedScreen) {
            Button("Go to the second tab") {
                model.selectedScreen = 1
                model.selection = model.item.first?.id
            }.tabItem {
                TabItem(imageName: "square", text: "First")
            }.tag(0)
            SecondView(model: model).tabItem {
                TabItem(imageName: "star", text: "Second")
            }.tag(1)
            
            ThirdView().tabItem {
                TabItem(imageName: "triangle", text: "Third")
            }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel.defaultInstance())
    }
}

struct TabItem: View {
    @State var imageName: String
    @State var text: String
    var body: some View {
        VStack {
            Image(systemName: imageName)
            Text(text)
        }
    }
}

