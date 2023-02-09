//
//  UIColor+DynamicProvider.swift
//  Surf
//
//  Created by Tatyana Sosina on 09.02.2023.
//

import UIKit

extension UIColor {
  convenience init(light: ColorToken, dark: ColorToken? = nil) {
    guard #available(iOS 13.0, *), let dark = dark else {
      self.init(hexString: light.rawValue)
      return
    }
    
    let lightColor = UIColor(hexString: light.rawValue)
    let darkColor = UIColor(hexString: dark.rawValue)
    
    self.init(dynamicProvider: {
      switch $0.userInterfaceStyle {
      case .light: return lightColor
      case .dark: return darkColor
      case .unspecified:
        fallthrough
      @unknown default:
        return lightColor
      }
    })
  }
}
