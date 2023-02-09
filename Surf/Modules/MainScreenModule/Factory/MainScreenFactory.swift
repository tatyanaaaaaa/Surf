//
//  MainScreenFactory.swift
//  Surf
//
//  Created by Tatyana Sosina on 09.02.2023.
//

import UIKit

/// Cобытия которые отправляем из Factory в Presenter
protocol MainScreenFactoryOutput: AnyObject {
  
  /// Были получены данные
  ///  - Parameters:
  ///   - model: Модель данных
  func didReceive(model: MainScreenModel)
}

/// Cобытия которые отправляем от Presenter к Factory
protocol MainScreenFactoryInput {
  
  /// Создать мокковые данные
  func createMockData()
}

/// Фабрика
final class MainScreenFactory: MainScreenFactoryInput {
  
  // MARK: - Internal properties
  
  weak var output: MainScreenFactoryOutput?
  
  // MARK: - Internal func
  
  func createMockData() {
    var listChips: [MainScreenModel.Chips] = []
    listChips.append(.init(name: "IOS"))
    listChips.append(.init(name: "Android"))
    listChips.append(.init(name: "Design"))
    listChips.append(.init(name: "Flutter"))
    listChips.append(.init(name: "QA"))
    listChips.append(.init(name: "PM"))
    listChips.append(.init(name: "Swift"))
    listChips.append(.init(name: "Apple"))
    listChips.append(.init(name: "iPhone"))
    let model = MainScreenModel(title: "Стажировка в Surf",
                                description: "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты.",
                                listChips: listChips)
    output?.didReceive(model: model)
  }
}

// MARK: - Appearance

private extension MainScreenFactory {
  struct Appearance {}
}
