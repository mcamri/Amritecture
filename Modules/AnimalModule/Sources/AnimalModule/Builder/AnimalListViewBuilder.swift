//
//  AnimalListViewBuilder.swift
//  Amritecture
//
//  Created by amri.mc on 16/1/22.
//

import Foundation
import SwiftUI
import AnimalService

class AnimalListViewBuilder {
  
  static var animalService: AnimalService!
  
  static func build() -> some View {
    let viewModel = AnimalListViewViewModel(animalService: animalService)
    let view = AnimalListView(viewModel: viewModel)
    return view
  }
}
