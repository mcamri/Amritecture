//
//  File.swift
//  
//
//  Created by amri.mc on 18/1/22.
//

import Foundation
import AnimalService
import Combine

class AnimalDetailViewModel: ObservableObject {
  @Published var animal: Animal?
  @Published var animalURLString: String?
  @Published var animalName: String?
  @Published var animalOrigin: String?

  private var animalCancellable: AnyCancellable?

  init() {
    animalCancellable = $animal.sink(receiveValue: { [weak self] animal in
      self?.animalURLString = animal?.image?.url
      self?.animalName = animal?.name
      self?.animalOrigin = animal?.origin
    })
  }
}

