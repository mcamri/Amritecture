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
  
  var storage = Set<AnyCancellable>()
  
  init(loginService: LoginService) {
    self.loginService = loginService
    
    loginService.isAuthenticated.sink(receiveValue: { isAuthenticated in
      self.isAuthenticated = isAuthenticated
    }).store(in: &storage)
  }
  
}
