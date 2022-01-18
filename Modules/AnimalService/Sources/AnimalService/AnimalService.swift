import Foundation
import LoginService

public protocol AnimalService {
  func getAnimalList() async -> Result<[Animal], Error>
}

public class CatAnimalService: AnimalService {
  enum Constant {
    static let urlString = "https://api.thecatapi.com/v1/breeds"
  }
  
  private var loginService: LoginService
  
  public enum MyError: Error {
    case failedToGetAnimal
  }
  
  public func getAnimalList() async -> Result<[Animal], Error> {
    guard let url = URL(string: Constant.urlString),
          let token = loginService.token else { return .failure(MyError.failedToGetAnimal) }
    
    do {
      var urlRequest = URLRequest(url: url)
      urlRequest.addValue(token, forHTTPHeaderField: "x-api-key")
      let (data, _) = try await URLSession.shared.data(for: urlRequest)
      let animals = try JSONDecoder().decode([Animal].self, from: data)
      return .success(animals)
    } catch {
      print(error.localizedDescription)
      debugPrint(error)
      return .failure(error)
    }
  }
  
  public init(loginService: LoginService) {
    self.loginService = loginService
  }
}
