//
//  Models.swift
//  OTUS_Homework_1
//
//  Created by Vyacheslav Pogorelskiy on 31/08/2021.
//

import Foundation

struct ViewModelItem: Identifiable, Hashable  {
    let id: UUID = UUID()
    let title: String
    let detail: String
    let image: String
    
    static let defaultValues: [ViewModelItem] = [
        .init(title: "First", detail: "First detail", image: "square"),
        .init(title: "Second", detail: "Second detail", image: "circle"),
        .init(title: "Third", detail: "Third detail", image: "triangle")
    ]
}

class ViewModel: ObservableObject {
    let items: [ViewModelItem]
    
    @Published var selectedTab: Int = 0
    @Published var selectedItemId: UUID?
    
    init(models: [ViewModelItem]) {
        items = models
        selectedItemId = models.first?.id
    }
}

extension ViewModel {
    static func defaultInstance() -> ViewModel { return ViewModel(models: ViewModelItem.defaultValues )  }
}
