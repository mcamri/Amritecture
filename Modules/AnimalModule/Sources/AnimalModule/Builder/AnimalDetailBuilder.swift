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

  static func build() -> AnimalDetailView {
    let viewModel = AnimalDetailViewModel()
    return AnimalDetailView(viewModel: viewModel)
  }
}
