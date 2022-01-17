//
//  AnimalListView.swift
//  Amritecture
//
//  Created by amri.mc on 14/1/22.
//

import SwiftUI
import AnimalService

struct AnimalListView: View {
  
  @ObservedObject var viewModel: AnimalListViewViewModel
  
  @EnvironmentObject var routerState: AnimalRouterState
  
  //TODO: to replace with environment variable. Currently it is not working with NavigationLink
  @State var openAnimalDetailViewItem: String?
  
  var body: some View {
    VStack {
      switch viewModel.state {
      case .loaded(let animals):
        List(animals, id: \.animalId) { item in
            NavigationLink(
              tag: item.animalId,
              selection: $openAnimalDetailViewItem,
              destination: {
                AnimalDetailBuilder.build(animal: item, openAnimalDetailViewItem: $openAnimalDetailViewItem)
              },
              label: {
                HStack {
                  Text(item.iconUnicode)
                    .frame(width: 50, height: 50, alignment: .center)
                  Text(item.name)
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
  
  static var previews: some View {
    AnimalListView(viewModel: AnimalListViewViewModel(animalService: OneAnimalService()))
  }
}
