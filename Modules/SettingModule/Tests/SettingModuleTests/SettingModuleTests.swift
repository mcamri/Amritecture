import XCTest
@testable import SettingModule
@testable import LoginService

final class SettingModuleTests: XCTestCase {
    func testLogout() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
      let loginService = DefaultLoginService()
      let viewModel = SettingViewModel(loginService: loginService)
      loginService.login(username: "", password: "", result: { _ in })
      
      XCTAssertEqual(loginService.isAuthenticated.value, true)
      
      viewModel.logout()
      
      XCTAssertEqual(loginService.isAuthenticated.value, false)
    }
}
