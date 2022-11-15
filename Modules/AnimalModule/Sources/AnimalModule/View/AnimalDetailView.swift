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
  
  var body: some View {
    VStack {
      VStack {
        if let urlString = viewModel.animalURLString {
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
        Text("Name: \(viewModel.animalName ?? "Unknown Name")")
        Text("Origin: \(viewModel.animalOrigin ?? "Unknown Origin")")
      }
      .padding()
      
      
      HStack {
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
