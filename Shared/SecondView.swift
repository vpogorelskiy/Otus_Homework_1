//
//  SecondView.swift
//  OTUS_Homework_1
//
//  Created by Vyacheslav Pogorelskiy on 31/08/2021.
//

import SwiftUI

struct SecondView: View {
    @State var models: [ViewModel]
    
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
