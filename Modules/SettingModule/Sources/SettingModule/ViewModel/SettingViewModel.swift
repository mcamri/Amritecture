//
//  File.swift
//  
//
//  Created by amri.mc on 17/1/22.
//

import Foundation
import LoginService

class SettingViewModel: ObservableObject {
  
  private var loginService: LoginService
  
  init(loginService: LoginService) {
    self.loginService = loginService
  }
  
  func logout() {
    loginService.logout()
  }
  
}
