//
//  AnimalListView.swift
//  Amritecture
//
//  Created by amri.mc on 14/1/22.
//

import SwiftUI
import AnimalService

public class AnimalDetails: ObservableObject {
  @Published public var openAnimalDetailViewItem: String? = nil
  public init() {}
}

struct AnimalListView: View {
  @ObservedObject var viewModel: AnimalListViewModel
  @EnvironmentObject var routerState: AnimalRouterState
  @State var openAnimalDetailViewItem: String?
  @StateObject var animalDetails: AnimalDetails = AnimalDetails()

  let animalDetailView: AnimalDetailView

  private func startAnimalDetail(animal: Animal) -> some View {
    animalDetailView.viewModel.animal = animal
    return animalDetailView
  }

  var body: some View {
    VStack {
      switch viewModel.state {
      case .loaded(let animals):
        List(animals, id: \.id) { animal in
            NavigationLink(
              tag: animal.id,
              selection: $animalDetails.openAnimalDetailViewItem,
              destination: {
                startAnimalDetail(animal: animal)
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
            Task {
              await viewModel.loadAnimal()
            }
          }
      }
    }
  }
}
