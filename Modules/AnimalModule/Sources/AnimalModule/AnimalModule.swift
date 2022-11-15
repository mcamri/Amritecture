
import SwiftUI
import AnimalService

public struct AnimalModule {

  var animalService: AnimalService
  
  public init(animalService: AnimalService) {
    self.animalService = animalService
  }
  
  public func view() -> some View {
    return buildModule()
  }

  private func buildModule() -> some View {
    let animalDetailView = AnimalDetailBuilder.build()

    let animalListView = AnimalListViewBuilder.build(animalService: animalService, animalDetailView: animalDetailView)

    let welcomeAnimalView = WelcomeAnimalBuilder.build(animalListView: animalListView)

    return welcomeAnimalView
  }
}
