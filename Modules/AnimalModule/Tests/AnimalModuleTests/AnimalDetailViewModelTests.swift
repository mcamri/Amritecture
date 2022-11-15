import XCTest
import AnimalService
@testable import AnimalModule

final class AnimalModuleTests: XCTestCase {
    func testCreation() throws {
      let animal = Animal(
        id: "kuciang",
        origin: "Indonesia",
        name: "Kucing Garong",
        image: Animal.Image(url: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg")
      )
      let viewModel = AnimalDetailViewModel()
      viewModel.animal = animal
      XCTAssertEqual(viewModel.animalOrigin, "Indonesia")
      XCTAssertEqual(viewModel.animalName, "Kucing Garong")
    }
}
