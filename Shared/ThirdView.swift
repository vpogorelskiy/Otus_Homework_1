//
//  OtherViews.swift
//  OTUS_Homework_1
//
//  Created by Vyacheslav Pogorelskiy on 31/08/2021.
//

import SwiftUI

struct ThirdView: View {
    
    @State var sheetPresented = false
    @State var fullScreenPresented = false
    
    var body: some View {
        VStack {
            Button("Open sheet") {
                sheetPresented.toggle()
            }.sheet(isPresented: $sheetPresented, content: {
                Text("I am a sheet")
                Spacer().frame(height: 50)
                Text("Swipe me down to dismiss")
            })
            Spacer().frame(height: 50)
            Button("Open fullscreen") {
                fullScreenPresented.toggle()
            }.fullScreenCover(isPresented: $fullScreenPresented,
                              content: {
                                UIViewWrapper(text: "This is UILabel")
                                Spacer().frame(height: 50)
                                Button("Tap to dismiss") {
                                    fullScreenPresented.toggle()
                                }
                              })
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}

struct UIViewWrapper: View, UIViewRepresentable {
    @State var text: String
    
    func makeUIView(context: Context) -> UILabel {
        UILabel()
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
        uiView.textAlignment = .center
    }
}
