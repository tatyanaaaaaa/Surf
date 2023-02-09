//
//  MainScreenModel.swift
//  Surf
//
//  Created by Tatyana Sosina on 09.02.2023.
//

import Foundation

struct MainScreenModel {
  
  /// Заголовок
  let title: String?
  
  /// Описание
  let description: String?
  
  /// Список чипсов
  let listChips: [Chips]
  
  // MARK: - Chips
  
  struct Chips {
    
    /// Название чипсы
    let name: String
    
    /// Событие по нажатию на кнопку
    var action: ((_ isSelected: Bool) -> Void)?
  }
}
