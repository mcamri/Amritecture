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
  
  func loadAnimal(completion: ((Bool) -> Void)? = nil) {
    Task {
      let result = await animalService.getAnimalList()
      DispatchQueue.main.async {
        switch result {
        case .success(let animals):
          self.state = animals.count > 0 ? .loaded(animals) : .empty("Animal list is empty!")
          completion?(true)
        case .failure:
          self.state = .error("Error fetching animals!")
          completion?(false)
        }
      }
    }
  }
}
