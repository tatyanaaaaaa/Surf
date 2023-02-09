//
//  UIColor+Guide.swift
//  Surf
//
//  Created by Tatyana Sosina on 09.02.2023.
//

import UIKit

/// Расширение для `UIColor`
public extension UIColor {
  
  /// Список цветов `SurfColor`
  class var surfColor: ColorGuide { colorGuide }
}

// MARK: - Public property

public var surfColor: ColorGuide { colorGuide }

// MARK: - Private property

private let colorGuide = ColorGuide()
