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
                        destination: ModelDetailView(model: model)) {
                            HStack{
                                Image(systemName: model.image)
                                Text(model.title)
                            }
                        }
                }
            }.navigationTitle("Second")
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(models: ViewModel.defaultValues)
    }
}


struct ModelDetailView: View {
    @State var model: ViewModel
    
    var body: some View {
        VStack{
            Text(model.title)
            Spacer().frame(height: 20)
            Image(systemName: model.image)
            Spacer().frame(height: 20)
            Text(model.detail)
        }
    }
}
