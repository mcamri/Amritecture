//
//  LoginModule.swift
//  Amritecture
//
//  Created by amri.mc on 17/1/22.
//

import Foundation
import LoginService
import SwiftUI

public class LoginModule {
  
  let loginService: LoginService
  
  public func view() -> some View {
    return LoginBuilder.build(loginService: loginService)
  }
  
  public init(loginService: LoginService) {
    self.loginService = loginService
  }
}
