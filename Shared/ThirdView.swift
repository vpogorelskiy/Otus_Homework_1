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
                Text("Swipe me down to dismiss")
                Spacer().frame(height: 50)
                Button("Or tap here") {
                    sheetPresented.toggle()
                }
            })
            Spacer().frame(height: 50)
            Button("Open fullscreen") {
                fullScreenPresented.toggle()
            }.fullScreenCover(isPresented: $fullScreenPresented,
                              content: {
                                    Button("Tap to dismiss") {
                                        fullScreenPresented.toggle()
                                    }
                                    UIViewWrapper(text: "This is UILabel")
                              })
        }
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

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
