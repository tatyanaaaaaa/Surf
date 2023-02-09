//
//  ButtonView.swift
//  Surf
//
//  Created by Tatyana Sosina on 09.02.2023.
//

import UIKit

/// View для экрана
final class ButtonView: UIButton {
  
  // MARK: - Initialization
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureLayout()
    applyDefaultBehavior()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Private func
  
  private func configureLayout() {
    NSLayoutConstraint.activate([
      heightAnchor.constraint(equalToConstant: Appearance().contentHeight)
    ])
  }
  
  private func applyDefaultBehavior() {
    backgroundColor = surfColor.primaryBlack
    titleLabel?.font = surfFont.primaryMedium16
    layer.cornerRadius = Appearance().contentHeight / 2
  }
}

// MARK: - Appearance

private extension ButtonView {
  struct Appearance {
    let contentHeight: CGFloat = 60
  }
}
