//
//  ScrollView.swift
//  Surf
//
//  Created by Tatyana Sosina on 09.02.2023.
//

import UIKit

/// Кастомная табличка, умеет скролится на текстовом поле и на кнопках
public final class ScrollView: UIScrollView {
  public override func touchesShouldCancel(in view: UIView) -> Bool {
    true
  }
}
