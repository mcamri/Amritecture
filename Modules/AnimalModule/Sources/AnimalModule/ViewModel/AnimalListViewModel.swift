//
//  AnimalListViewModel.swift
//  Amritecture
//
//  Created by amri.mc on 15/1/22.
//

import Foundation
import AnimalService

class AnimalListViewModel: ObservableObject {
  
  @Published var state: State = .loading
  
  enum State {
      case loading
      case loaded([Animal])
      case empty(String)
      case error(String)
  }
  
  private var animalService: AnimalService
  
  init(animalService: AnimalService) {
    self.animalService = animalService
  }
  
  //TODO: to replace this closure base to async await
  func loadAnimal() {
    animalService.getAnimalList { [weak self] animals in
      guard let strongSelf = self else { return }
      if let animals = animals {
        if animals.count > 0 {
          strongSelf.state = .loaded(animals)
        } else {
          strongSelf.state = .empty("Animal list is empty!")
        }
      } else {
        strongSelf.state = .error("Error fetching animals!")
      }
    }
  }
}
