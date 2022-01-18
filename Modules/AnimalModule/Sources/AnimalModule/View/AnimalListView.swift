//
//  AnimalListView.swift
//  Amritecture
//
//  Created by amri.mc on 14/1/22.
//

import SwiftUI
import AnimalService

struct AnimalListView: View {
  
  @ObservedObject var viewModel: AnimalListViewModel
  
  @EnvironmentObject var routerState: AnimalRouterState
  
  //TODO: to replace with environment variable. Currently it is not working with NavigationLink
  @State var openAnimalDetailViewItem: String?
  
  var body: some View {
    VStack {
      switch viewModel.state {
      case .loaded(let animals):
        List(animals, id: \.id) { animal in
            NavigationLink(
              tag: animal.id,
              selection: $openAnimalDetailViewItem,
              destination: {
                AnimalDetailBuilder.build(animal: animal, openAnimalDetailViewItem: $openAnimalDetailViewItem)
              },
              label: {
                VStack {
                  Text("Name: \(animal.name)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                  Text("Origin: \(animal.origin)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
              })
        }
      case .empty(let message):
        Text(message)
      case .error(let message):
        Text(message)
      case .loading:
        ProgressView()
          .onAppear {
              viewModel.loadAnimal()
          }
      }
    }
  }
}

struct FirstTabDetailView_Previews: PreviewProvider {
  class OneAnimalService: AnimalService {
    func getAnimalList() async -> Result<[Animal], Error> {
      .success([Animal(
        id: "kuciang",
        origin: "Indonesia",
        name: "Kucing Garong",
        image: Animal.Image(url: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg")
      )])
    }
  }
  
  static var previews: some View {
    AnimalListView(viewModel: AnimalListViewModel(animalService: OneAnimalService()))
  }
}
