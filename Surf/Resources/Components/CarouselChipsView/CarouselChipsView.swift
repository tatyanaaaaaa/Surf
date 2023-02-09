//
//  CarouselChipsView.swift
//  Surf
//
//  Created by Tatyana Sosina on 09.02.2023.
//

import UIKit

/// View для экрана
final class CarouselChipsView: UIView {
  
  // MARK: - Public properties
  
  /// Список элементов для отображения
  ///  - Parameter listChips: Массив элементов для отображения
  public var listChips: [ChipsView] = [] {
    didSet {
      configureSubviewsForStack()
    }
  }
  
  public override var intrinsicContentSize: CGSize {
    Appearance().intrinsicContentSize
  }
  
  // MARK: - Private properties
  
  private let scrollView = ScrollView()
  private let contentStackView = UIStackView()
  private var listViews: [UIView] = []
  
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
    [scrollView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      addSubview($0)
    }
    
    [contentStackView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      scrollView.addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
      scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
      
      contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
    ])
  }
  
  private func applyDefaultBehavior() {
    let appearance = Appearance()
    backgroundColor = surfColor.primaryWhite
    
    scrollView.showsHorizontalScrollIndicator = false
    scrollView.contentInset = appearance.insets
    
    contentStackView.axis = .horizontal
    contentStackView.spacing = appearance.spacing
  }
  
  private func configureSubviewsForStack() {
    contentStackView.removeFullyAllArrangedSubviews()
    let listChips = listChips.compactMap { $0 }
    
    listChips.enumerated().forEach { index, chipsView in
      [chipsView].forEach {
        $0.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.addArrangedSubview($0)
      }
    }
  }
}

// MARK: - UIStackView

/// Удаление View из UIStackView
private extension UIStackView {
  
  /// Удаляет конкретную UIView из UIStackView
  func removeFully(view: UIView) {
    removeArrangedSubview(view)
    view.removeFromSuperview()
  }
  
  /// Удаляет все UIView из UIStackView
  func removeFullyAllArrangedSubviews() {
    arrangedSubviews.forEach { (view) in
      removeFully(view: view)
    }
  }
}


// MARK: - Appearance

private extension CarouselChipsView {
  struct Appearance {
    let intrinsicContentSize = CGSize(width: UIView.noIntrinsicMetric, height: 44)
    let insets = UIEdgeInsets(top: .zero, left: 16, bottom: .zero, right: 16)
    let spacing: CGFloat = 12
  }
}
