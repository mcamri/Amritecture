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
  
  func loadAnimal() async {
    let result = await animalService.getAnimalList()
    switch result {
    case .success(let animals):
      await updateState(animals.count > 0 ? .loaded(animals) : .empty("Animal list is empty!"))
    case .failure:
      await updateState(.error("Error fetching animals!"))
    }
  }
  
  @MainActor func updateState(_ state: State) async {
    self.state = state
  }
}
