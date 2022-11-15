//
//  WelcomeAnimalView.swift
//  Amritecture
//
//  Created by amri.mc on 14/1/22.
//

import SwiftUI

struct WelcomeAnimalView: View {
  
  @EnvironmentObject var routerState: AnimalRouterState

  let animalListView: AnimalListView

  private func startAnimalList() -> some View {
    return animalListView
  }

  var body: some View {
    NavigationView {
      VStack {
        Text("Welcome to animal kingdom!")
          .padding()
        NavigationLink("Animal List", isActive: $routerState.openAnimalListContainerView) {
          startAnimalList()
        }.padding()
      }.navigationTitle("Animal Kingdom")
    }
    .navigationViewStyle(.stack)
  }
}
