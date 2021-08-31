//
//  ContentView.swift
//  Shared
//
//  Created by Вячеслав Погорельский on 28.08.2021.
//

import SwiftUI

struct SecondModel: Hashable, Identifiable {
    var id: UUID = UUID()
    
    let title: String
    let detail: String
    let image: String
}

struct ContentView: View {
    
    @State var selectedTab: Int = 1
    
    let models: [SecondModel] = [
        .init(title: "First", detail: "First detail", image: "square"),
        .init(title: "Second", detail: "Second detail", image: "circle"),
        .init(title: "Third", detail: "Third detail", image: "triangle")
    ]
    
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

struct FirstView: View {
    
    @Binding var selection: Int
    
    var body: some View {
        Button("Go to second") {
            selection = 1
        }
    }
}

struct SecondView: View {
    
    @State var models: [SecondModel]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(models) { model in
                    NavigationLink(
                        destination: VStack{
                            Text(model.title)
                            Spacer().frame(height: 20)
                            Image(systemName: model.image)
                            Spacer().frame(height: 20)
                            Text(model.detail)
                        },
                        label: {
                            Text(model.title)
                        })
                }
            }.navigationTitle("Second")
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
