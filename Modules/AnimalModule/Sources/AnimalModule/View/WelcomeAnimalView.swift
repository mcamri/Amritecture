//
//  WelcomeAnimalView.swift
//  Amritecture
//
//  Created by amri.mc on 14/1/22.
//

import SwiftUI

struct WelcomeAnimalView: View {
  
  @EnvironmentObject var routerState: AnimalRouterState
  
  var body: some View {
    NavigationView {
      VStack {
        Text("Welcome to animal kingdom!")
          .padding()
        NavigationLink("Animal List", isActive: $routerState.openAnimalListContainerView) {
          AnimalListViewBuilder.build()
        }.padding()
      }.navigationTitle("Animal Kingdom")
    }
    .navigationViewStyle(.stack)
  }
}

struct FirstTabView_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeAnimalView()
  }
}
