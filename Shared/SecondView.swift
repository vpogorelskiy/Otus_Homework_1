//
//  SecondView.swift
//  OTUS_Homework_1
//
//  Created by Vyacheslav Pogorelskiy on 31/08/2021.
//

import SwiftUI

struct SecondView: View {
    @ObservedObject var model: ViewModel
    
    @State var selection: String?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(model.items) { item in
                    NavigationLink(
                        destination: ModelDetailView(model: item),
                        tag: item.id,
                        selection: Binding( get: {model.selectedItemId}, set: {model.selectedItemId = $0} ), // Использование 'model.$selection' вместо Binding(...) приводит к ошибке: "Cannot convert value of type 'Published<UUID?>.Publisher' to expected argument type 'Binding<UUID?>'"
                        label: {
                            HStack {
                                Image(systemName: item.image)
                                Text(item.title)
                            }
                        })
                }
            }.navigationTitle("List")
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(model: ViewModel.defaultInstance())
    }
}

struct ModelDetailView: View {
    @State var model: ViewModelItem
    
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
