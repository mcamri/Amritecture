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
        Text(viewModel.animal.iconUnicode)
          .font(.system(size: 200))
          .padding()
        Text(viewModel.animal.name)
          .font(.system(size: 30))
          .padding()
      }
      .padding()
      
      
      HStack {
        Spacer()
        Button("Go back to list") {
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
  
  static var previews: some View {
    AnimalDetailBuilder.build(
      animal: Animal(iconUnicode: "A", name: "Alphabet A"),
      openAnimalDetailViewItem: $openAnimalDetailViewItem
    )
  }
}
