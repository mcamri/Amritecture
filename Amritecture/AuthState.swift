//
//  AuthState.swift
//  Amritecture
//
//  Created by amri.mc on 17/1/22.
//


import Combine
import LoginService
import LoginModule

class AuthState: ObservableObject {
  @Published var isAuthenticated = false
  
  var loginService: LoginService
  var loginModule: LoginModule
  
  var storage = Set<AnyCancellable>()
  
  init(loginService: LoginService, loginModule: LoginModule) {
    self.loginService = loginService
    self.loginModule = loginModule
    
    loginService.isAuthenticated.sink(receiveValue: { isAuthenticated in
      self.isAuthenticated = isAuthenticated
    }).store(in: &storage)
  }
  
}
