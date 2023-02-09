//
//  UIFont+Guide.swift
//  Surf
//
//  Created by Tatyana Sosina on 09.02.2023.
//

import UIKit

/// Расширение для `UIFont`
public extension UIFont {
  
  /// Список цветов `SurfFont`
  class var surfFont: FontGuide { fontGuide }
}

// MARK: - Public property

public var surfFont: FontGuide { fontGuide }

// MARK: - Private property

private let fontGuide = FontGuide()
