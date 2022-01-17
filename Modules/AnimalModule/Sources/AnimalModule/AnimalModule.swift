
import SwiftUI
import AnimalService

public struct AnimalModule {

  var animalService: AnimalService
  
  public init(animalService: AnimalService) {
    self.animalService = animalService
    
    setupBuilder()
  }
  
  public func view() -> some View {
    return WelcomeAnimalBuilder.build()
  }
  
  private func setupBuilder() {
    AnimalListViewBuilder.animalService = animalService
  }
  
}
