//
//  EmojiView.swift
//  Amritecture
//
//  Created by amri.mc on 14/1/22.
//

import SwiftUI
import AnimalService

struct AnimalDetailView: View {
  
  @ObservedObject var viewModel: AnimalDetailViewModel
  
  @EnvironmentObject var routerState: AnimalRouterState
  @Binding var openAnimalDetailViewItem: String?
  
  var body: some View {
    VStack {
      VStack {
        
        if let urlString = viewModel.animal.image?.url {
          AsyncImage(
            url: URL(string: urlString),
            content: { image in
              image.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 300)
            },
            placeholder: {
              ProgressView()
            }
          )
        }
        Text("Name: \(viewModel.animal.name)")
        Text("Origin: \(viewModel.animal.origin)")
      }
      .padding()
      
      
      HStack {
        Spacer()
        Button("Cat list") {
          openAnimalDetailViewItem = nil
        }
        Spacer()
        Button("Home") {
          routerState.openAnimalListContainerView = false
        }
        Spacer()
      }
      .padding()
      
      Spacer()
    }
  }
}

struct EmojiView_Previews: PreviewProvider {
  @State static var openAnimalDetailViewItem: String?
  
  static let animal = Animal(
    id: "kuciang",
    origin: "Indonesia",
    name: "Kucing Garong",
    image: Animal.Image(url: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg")
  )
  
  static var previews: some View {
    AnimalDetailBuilder.build(
      animal: animal,
      openAnimalDetailViewItem: $openAnimalDetailViewItem
    )
  }
}
