import Combine

public protocol LoginService {
  //output
  var isAuthenticated: CurrentValueSubject<Bool, Never> { get }
  var token: String? { get }
  
  //input
  func login(username: String, password: String, result: (Bool) -> Void)
  func logout()
}

public class DefaultLoginService: LoginService {
  
  public var token: String?
  public var isAuthenticated = CurrentValueSubject<Bool, Never>(false)
  
  public func login(username: String, password: String, result: (Bool) -> Void) {
    isAuthenticated.send(true)
    token = "DEMO-API-KEY"
    result(true)
  }
  
  public func logout() {
    isAuthenticated.send(false)
    token = nil
  }
  
  public private(set) var text = "Hello, World!"
  
  public init() {
  }
}
