
import SwiftUI
import LoginService

public struct SettingModule {

  var loginService: LoginService
  
  public init(loginService: LoginService) {
    self.loginService = loginService
  }
  
  public func view() -> some View {
    return buildModule()
  }

  private func buildModule() -> some View {
    let aboutView = AboutBuilder.build()

    let settingModule = SettingBuilder.build(loginService: loginService, aboutView: aboutView)

    return settingModule
  }
  
}
