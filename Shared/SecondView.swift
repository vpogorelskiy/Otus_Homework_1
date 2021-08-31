//
//  SecondView.swift
//  OTUS_Homework_1
//
//  Created by Vyacheslav Pogorelskiy on 31/08/2021.
//

import SwiftUI

struct SecondView: View {
    @ObservedObject var model: ViewModelContainer
    
    var body: some View {
        NavigationView {
            List {
                ForEach(model.models) { item in
//                    NavigationLink(
//                        destination: ModelDetailView(model: item),
//                        isActive: Binding(get: { item.isSelected
//                        },
//                        set: { item.isSelected = $0 }),
//                        label: {
//                            HStack{
//                                Image(systemName: item.image)
//                                Text(item.title)
//                            }
//                        })
                    
                    
                    NavigationLink(
                        destination: ModelDetailView(model: item)) {
                            HStack{
                                Image(systemName: item.image)
                                Text(item.title)
                            }
                        }
                }
            }.navigationTitle("Second")
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(model: ViewModelContainer.defaultInstance())
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
