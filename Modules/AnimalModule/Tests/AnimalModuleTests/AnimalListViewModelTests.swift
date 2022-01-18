//
//  AnimalListViewModelTests.swift
//  AmritectureTests
//
//  Created by amri.mc on 17/1/22.
//

import XCTest
@testable import AnimalModule
@testable import AnimalService


class AnimalListViewModelTests: XCTestCase {
  
  func testValidResult() throws {
    let viewModel = AnimalListViewModel(animalService: OneAnimalService())
    viewModel.loadAnimal()
    if case let .loaded(animal) = viewModel.state {
      XCTAssertGreaterThan(animal.count, 0)
    } else {
      XCTAssert(false)
    }
  }
  
  func testEmptyResult() throws {
    let viewModel = AnimalListViewModel(animalService: EmptyAnimalService())
    viewModel.loadAnimal()
    if case let .empty(emptyString) = viewModel.state {
      XCTAssertEqual(emptyString, "Animal list is empty!")
    } else {
      XCTAssert(false)
    }
  }
  
  func testErrorResult() throws {
    let viewModel = AnimalListViewModel(animalService: ErrorAnimalService())
    viewModel.loadAnimal()
    if case let .error(errorString) = viewModel.state {
      XCTAssertEqual(errorString, "Error fetching animals!")
    } else {
      XCTAssert(false)
    }
  }
  
}

class EmptyAnimalService: AnimalService {
  func getAnimalList(result: ([Animal]?) -> Void) {
    result([])
  }
  func deleteAnimal(animal: Animal) {}
}

class ErrorAnimalService: AnimalService {
  func getAnimalList(result: ([Animal]?) -> Void) {
    result(nil)
  }
  
  func deleteAnimal(animal: Animal) {}
}

class OneAnimalService: AnimalService {
    private var animals = [
    Animal(iconUnicode: "🦢", name: "Swan")
  ]
  
  func getAnimalList(result: ([Animal]?) -> Void) {
    result(animals)
  }
  
  func deleteAnimal(animal: Animal) {
    animals = animals.filter({ $0.animalId != animal.animalId })
  }
}
