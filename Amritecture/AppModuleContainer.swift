//
//  AppModule.swift
//  Amritecture
//
//  Created by amri.mc on 17/1/22.
//

import Foundation
import LoginService
import LoginModule
import AnimalModule
import AnimalService
import SettingModule

struct AppModuleContainer {
  let animalService: AnimalService = FewAnimalService()
  let animalModule: AnimalModule
  let settingModule: SettingModule
  
  var loginService = DefaultLoginService()
  var loginModule: LoginModule
  
  init() {
    loginModule = LoginModule(loginService: loginService)
    animalModule = AnimalModule(animalService: animalService)
    settingModule = SettingModule(loginService: loginService)
  }
}
