//
//  LoginView.swift
//  Amritecture
//
//  Created by amri.mc on 17/1/22.
//

import SwiftUI
import LoginService

struct LoginView: View {

  @ObservedObject var viewModel: LoginViewModel
  
  init(viewModel: LoginViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    VStack {
      TextField("Username", text: $viewModel.username)
        .disableAutocorrection(true)
        .padding()
        .frame(width: 300, height: 50, alignment: .leading)
      SecureField("Password", text: $viewModel.password)
        .padding()
        .frame(width: 300, height: 50, alignment: .leading)
      Spacer()
      Button("Login") {
        viewModel.login()
      }
    }
    .frame(maxWidth: .infinity, maxHeight: 150)
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView(viewModel: LoginViewModel(loginService: DefaultLoginService()))
  }
}
