//
//  ChipsView.swift
//  Surf
//
//  Created by Tatyana Sosina on 09.02.2023.
//

import UIKit

/// View для экрана
final class ChipsView: UIButton {
  
  // MARK: - Public properties
  
  public var action: ((_ isSelected: Bool) -> Void)?
  
  // MARK: - Private properties
  
  private var chipsIsSelected = false
  
  // MARK: - Initialization
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureLayout()
    applyDefaultBehavior()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Public func
  
  public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    chipsIsSelected.toggle()
    updateStyle()
    action?(chipsIsSelected)
  }
  
  public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesCancelled(touches, with: event)
    updateStyle()
  }
  
  // MARK: - Private func
  
  private func configureLayout() {
    NSLayoutConstraint.activate([
      heightAnchor.constraint(equalToConstant: Appearance().contentHeight)
    ])
  }
  
  private func applyDefaultBehavior() {
    backgroundColor = surfColor.secondaryGray
    titleLabel?.font = surfFont.primaryMedium14
    layer.cornerRadius = Appearance().cornerRadius
  }
  
  private func updateStyle() {
    backgroundColor = chipsIsSelected ? surfColor.primaryBlack : surfColor.secondaryGray
  }
}

// MARK: - Appearance

private extension ChipsView {
  struct Appearance {
    let contentHeight: CGFloat = 44
    let cornerRadius: CGFloat = 12
  }
}
