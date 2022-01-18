//
//  File.swift
//  
//
//  Created by amri.mc on 18/1/22.
//

import Foundation
import AnimalService

class AnimalDetailViewModel: ObservableObject {
  @Published var animal: Animal
  
  init(animal: Animal) {
    self.animal = animal
  }
}

