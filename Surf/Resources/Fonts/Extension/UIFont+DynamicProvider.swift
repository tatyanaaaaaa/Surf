//
//  UIFont+DynamicProvider.swift
//  Surf
//
//  Created by Tatyana Sosina on 09.02.2023.
//

import UIKit

extension UIFont {
  static func get(font: FontToken) -> UIFont {
    switch font {
    case .primaryBold24:
      return UIFont.systemFont(ofSize: 24, weight: .bold)
    case .primaryMedium16:
      return UIFont.systemFont(ofSize: 16, weight: .medium)
    case .primaryMedium14:
      return UIFont.systemFont(ofSize: 14, weight: .medium)
    case .primaryRegular14:
      return UIFont.systemFont(ofSize: 14, weight: .regular)
    }
  }
}
