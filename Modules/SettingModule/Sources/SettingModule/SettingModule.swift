
import SwiftUI
import LoginService

public struct SettingModule {

  var loginService: LoginService
  
  public init(loginService: LoginService) {
    self.loginService = loginService
    
    setupBuilder()
  }
  
  public func view() -> some View {
    return SettingBuilder.build()
  }
  
  private func setupBuilder() {
    SettingBuilder.loginService = loginService
  }
  
}
