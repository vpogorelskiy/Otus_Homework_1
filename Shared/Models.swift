//
//  Models.swift
//  OTUS_Homework_1
//
//  Created by Vyacheslav Pogorelskiy on 31/08/2021.
//

import Foundation

struct ViewModel: Hashable, Identifiable {
    var id: UUID = UUID()
    
    let title: String
    let detail: String
    let image: String
    
    static let defaultValues: [ViewModel] = [
        .init(title: "First", detail: "First detail", image: "square"),
        .init(title: "Second", detail: "Second detail", image: "circle"),
        .init(title: "Third", detail: "Third detail", image: "triangle")
    ]
}

class ViewModelContainer: ObservableObject {
    let models: [ViewModel]
    
    @Published var selectedScreen: Int = 0
    @Published var selectedId: UUID?
    
    init(models: [ViewModel]) {
        self.models = models
    }
}

extension ViewModelContainer {
    static func defaultInstance() -> ViewModelContainer { return ViewModelContainer(models: ViewModel.defaultValues )  }
}
