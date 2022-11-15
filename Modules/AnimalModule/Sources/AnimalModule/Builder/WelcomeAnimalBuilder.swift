//
//  WelcomeAnimalBuilder.swift
//  Amritecture
//
//  Created by amri.mc on 17/1/22.
//

import SwiftUI

class WelcomeAnimalBuilder {
  static func build(animalListView: AnimalListView) -> WelcomeAnimalView {
    return WelcomeAnimalView(animalListView: animalListView)
  }
}
