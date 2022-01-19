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
  
  func testValidResult() async throws {
    let viewModel = AnimalListViewModel(animalService: OneAnimalService())
    await viewModel.loadAnimal()
    if case let .loaded(animal) = viewModel.state {
      XCTAssertGreaterThan(animal.count, 0)
    } else {
      XCTAssert(false)
    }
  }
  
  func testEmptyResult() async throws {
    let viewModel = AnimalListViewModel(animalService: EmptyAnimalService())
    await viewModel.loadAnimal()
    if case let .empty(emptyString) = viewModel.state {
      XCTAssertEqual(emptyString, "Animal list is empty!")
    } else {
      XCTAssert(false)
    }
  }
  
  func testErrorResult() async throws {
    let viewModel = AnimalListViewModel(animalService: ErrorAnimalService())
    await viewModel.loadAnimal()
    if case let .error(errorString) = viewModel.state {
      XCTAssertEqual(errorString, "Error fetching animals!")
    } else {
      XCTAssert(false)
    }
  }
  
}

class EmptyAnimalService: AnimalService {
  func getAnimalList() async -> Result<[Animal], Error> {
    .success([])
  }
}

class ErrorAnimalService: AnimalService {
  enum MyError: Error {
    case failedToGetCat
  }
  func getAnimalList() async -> Result<[Animal], Error> {
    .failure(MyError.failedToGetCat)
  }
}

class OneAnimalService: AnimalService {
  private let animal = Animal(
    id: "kuciang",
    origin: "Indonesia",
    name: "Kucing Garong",
    image: Animal.Image(url: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg")
  )
  
  func getAnimalList() async -> Result<[Animal], Error> {
    .success([animal])
  }
}
