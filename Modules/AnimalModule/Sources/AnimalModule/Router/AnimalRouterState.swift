import Foundation
import Combine

public class AnimalRouterState: ObservableObject {
  @Published public var openAnimalListContainerView = false
  @Published public var openAnimalDetailViewItem: String? = nil
  
  public init() {}
}
