//
//  Models.swift
//  OTUS_Homework_1
//
//  Created by Vyacheslav Pogorelskiy on 31/08/2021.
//

import Foundation

class ViewModel: ObservableObject, Identifiable  {
    let title: String
    let detail: String
    let image: String
    @Published var isSelected: Bool = false
    
    init(title: String, detail: String, image: String) {
        self.title = title
        self.detail = detail
        self.image = image
    }
    
    static let defaultValues: [ViewModel] = [
        .init(title: "First", detail: "First detail", image: "square"),
        .init(title: "Second", detail: "Second detail", image: "circle"),
        .init(title: "Third", detail: "Third detail", image: "triangle")
    ]
}

class ViewModelContainer: ObservableObject {
    let models: [ViewModel]
    
    @Published var selectedScreen: Int = 0
//    @Published var selectedId: UUID?
    
    init(models: [ViewModel]) {
        self.models = models
    }
}

extension ViewModelContainer {
    static func defaultInstance() -> ViewModelContainer { return ViewModelContainer(models: ViewModel.defaultValues )  }
}
