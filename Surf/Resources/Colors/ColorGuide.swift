//
//  ColorGuide.swift
//  Surf
//
//  Created by Tatyana Sosina on 09.02.2023.
//

import UIKit

/// Гайд по цветам в приложении, для светлой и темной темы
public struct ColorGuide {
  
  /// Основной черный цвет
  public let primaryBlack = UIColor(light: .primaryBlack, dark: .primaryBlack)
  
  /// Темно-серый цвет
  public let primaryGray = UIColor(light: .primaryGray, dark: .primaryWhite)
  
  /// Светло-серый цвет
  public let secondaryGray = UIColor(light: .secondaryGray, dark: .secondaryGray)
  
  /// Светло-белый цвет
  public let primaryWhite = UIColor(light: .primaryWhite, dark: .primaryWhite)
}
