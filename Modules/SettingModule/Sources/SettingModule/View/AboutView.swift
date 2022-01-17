//
//  AboutView.swift
//  Amritecture
//
//  Created by amri.mc on 15/1/22.
//

import SwiftUI

struct AboutView: View {
  
  @EnvironmentObject var routerState: SettingRouterState
  
  var body: some View {
    VStack {
      Text("This is apps to demonstrate architecture")
      Button("Dismiss!", action: {
        routerState.openAboutView = false
      })
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.gray)
  }
}

struct AboutView_Previews: PreviewProvider {
  static var previews: some View {
    AboutView()
      .environmentObject(SettingRouterState())
  }
}
