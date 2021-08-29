//
//  ContentView.swift
//  Shared
//
//  Created by Вячеслав Погорельский on 28.08.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab: Int = 0
    
    var body: some View {
        Text("Hello, world!")
            .padding()
        TabView(selection: $selectedTab) {
            FirstView(selection: $selectedTab).tabItem {
                TabItem(imageName: "square", text: "First")
            }
            
            SecondView().tabItem {
                TabItem(imageName: "star", text: "Second")
            }
            
            ThirdView().tabItem {
                TabItem(imageName: "triangle", text: "Third")
            }
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

struct FirstView: View {
    
    @Binding var selection: Int
    
    var body: some View {
        Button("Go to second") {
            selection = 1
        }
    }
}

struct SecondView: View {
    var body: some View {
        NavigationView {
            List {
                Text("One")
                Text("Two")
                Text("Three")
            }
        }
    }
}

struct ThirdView: View {
    var body: some View {
        Button("Open modal") {
            // TODO: Implement
        }
    }
}
