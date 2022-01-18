import XCTest
import AnimalService
@testable import AnimalModule

final class AnimalModuleTests: XCTestCase {
    func testCreation() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
      let viewModel = AnimalDetailViewModel(animal: Animal(iconUnicode: "A", name: "A alphabet"))
      XCTAssertEqual(viewModel.animal.iconUnicode, "A")
      XCTAssertEqual(viewModel.animal.name, "A alphabet")
    }
}
