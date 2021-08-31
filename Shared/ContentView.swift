//
//  ContentView.swift
//  Shared
//
//  Created by Вячеслав Погорельский on 28.08.2021.
//

import SwiftUI

struct ViewModel: Hashable, Identifiable {
    var id: UUID = UUID()
    
    let title: String
    let detail: String
    let image: String
    
    static let defaultValues: [ViewModel] = [
        .init(title: "First", detail: "First detail", image: "square"),
        .init(title: "Second", detail: "Second detail", image: "circle"),
        .init(title: "Third", detail: "Third detail", image: "triangle")
    ]
}

struct ContentView: View {
    
    @State var selectedTab: Int = 1
    
    let models: [ViewModel] = ViewModel.defaultValues
    
    var body: some View {
        Text("Hello, world!")
            .padding()
        TabView(selection: $selectedTab) {
            FirstView(selection: $selectedTab).tabItem {
                TabItem(imageName: "square", text: "First")
            }.tag(0)
            SecondView(models: models).tabItem {
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

