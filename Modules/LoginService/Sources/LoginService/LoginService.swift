import Combine

public protocol LoginService {
  //output
  var isAuthenticated: CurrentValueSubject<Bool, Never> { get }
  
  //input
  func login(username: String, password: String, result: (Bool) -> Void)
  func logout()
}

public struct DefaultLoginService: LoginService {
  
  public var isAuthenticated = CurrentValueSubject<Bool, Never>(false)
  
  public func login(username: String, password: String, result: (Bool) -> Void) {
    isAuthenticated.send(true)
    result(true)
  }
  
  public func logout() {
    isAuthenticated.send(false)
  }
  
  public private(set) var text = "Hello, World!"
  
  public init() {
  }
}
