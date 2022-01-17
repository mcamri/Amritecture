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
    AnimalDetailView(item: animal, openAnimalDetailViewItem: openAnimalDetailViewItem)
  }
}
