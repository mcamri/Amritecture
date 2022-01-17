public protocol AnimalService {
  func getAnimalList(result: ([Animal]?) -> Void)
  func deleteAnimal(animal: Animal)
}

public class FewAnimalService: AnimalService {
    private var animals = [
    Animal(iconUnicode: "🦢", name: "Swan"),
    Animal(iconUnicode: "🐟", name: "Fish"),
    Animal(iconUnicode: "🐸", name: "Frog"),
    Animal(iconUnicode: "🐐", name: "Goat"),
    Animal(iconUnicode: "🐪", name: "Camel"),
    Animal(iconUnicode: "🦒", name: "Giraffe"),
    Animal(iconUnicode: "🐢", name: "Turtle")
  ]
  
  public func getAnimalList(result: ([Animal]?) -> Void) {
    result(animals)
  }
  
  public func deleteAnimal(animal: Animal) {
    animals = animals.filter({ $0.animalId != animal.animalId })
  }
  
  public init() {}
}
