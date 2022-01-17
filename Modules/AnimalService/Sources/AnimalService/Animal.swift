//
//  Animal.swift
//  Amritecture
//
//  Created by amri.mc on 16/1/22.
//

import Foundation

public struct Animal {
  public let animalId: String = String("\(Int.random(in: 1..<Int.max))")
  public var iconUnicode: String
  public var name: String
  
  public init(iconUnicode: String, name: String) {
    self.iconUnicode = iconUnicode
    self.name = name
  }
}
