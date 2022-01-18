//
//  AnimalDetailBuilder.swift
//  Amritecture
//
//  Created by amri.mc on 16/1/22.
//

import Foundation
import SwiftUI
import AnimalService

class AnimalDetailBuilder {

  static func build(animal: Animal, openAnimalDetailViewItem: Binding<String?>) -> some View {
    let viewModel = AnimalDetailViewModel(animal: animal)
    return AnimalDetailView(viewModel: viewModel, openAnimalDetailViewItem: openAnimalDetailViewItem)
  }
}
