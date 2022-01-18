import XCTest
import AnimalService
@testable import AnimalModule

final class AnimalModuleTests: XCTestCase {
    func testCreation() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
      let animal = Animal(
        id: "kuciang",
        origin: "Indonesia",
        name: "Kucing Garong",
        image: Animal.Image(url: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg")
      )
      let viewModel = AnimalDetailViewModel(animal: animal)
      XCTAssertEqual(viewModel.animal.origin, "Indonesia")
      XCTAssertEqual(viewModel.animal.name, "Kucing Garong")
    }
}
