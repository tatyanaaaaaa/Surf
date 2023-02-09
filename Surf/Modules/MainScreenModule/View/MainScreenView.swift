//
//  MainScreenView.swift
//  Surf
//
//  Created by Tatyana Sosina on 09.02.2023.
//

import UIKit

/// События которые отправляем из View в Presenter
protocol MainScreenViewOutput: AnyObject {
  
  /// Отправить заявку
  func submitApplicationAction()
}

/// События которые отправляем от Presenter ко View
protocol MainScreenViewInput {
  
  /// Обновить контент
  /// - Parameter model: Модель данных
  func updateContentWith(model: MainScreenModel)
}

/// Псевдоним протокола UIView & MainScreenViewInput
typealias MainScreenViewProtocol = UIView & MainScreenViewInput

/// View для экрана
final class MainScreenView: MainScreenViewProtocol {
  
  // MARK: - Internal properties
  
  weak var output: MainScreenViewOutput?
  
  // MARK: - Private properties
  
  private let backgroundImage = UIImageView()
  private let curtainView = UIView()
  private let titleLabel = UILabel()
  private let descriptionLabel = UILabel()
  private let carouselChipsView = CarouselChipsView()
  
  private let mainButton = ButtonView()
  private let joinUsButton = UIButton()
  
  // MARK: - Initialization
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureLayout()
    applyDefaultBehavior()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Internal func
  
  func updateContentWith(model: MainScreenModel) {
    titleLabel.text = model.title
    descriptionLabel.text = model.description
    
    let listChips: [ChipsView] = model.listChips.map {
      let chipsView = ChipsView()
      chipsView.setTitle($0.name, for: .normal)
      return chipsView
    }
    carouselChipsView.listChips = listChips
    layoutIfNeeded()
  }
}

// MARK: - Private

private extension MainScreenView {
  func configureLayout() {
    [titleLabel, descriptionLabel, carouselChipsView, mainButton, joinUsButton].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      curtainView.addSubview($0)
    }
    
    [backgroundImage, curtainView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      mainButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.6),
      backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
      backgroundImage.topAnchor.constraint(equalTo: topAnchor),
      backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
      backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      curtainView.leadingAnchor.constraint(equalTo: leadingAnchor),
      curtainView.trailingAnchor.constraint(equalTo: trailingAnchor),
      curtainView.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      titleLabel.leadingAnchor.constraint(equalTo: curtainView.leadingAnchor,
                                          constant: 20),
      titleLabel.topAnchor.constraint(equalTo: curtainView.topAnchor,
                                      constant: 24),
      titleLabel.trailingAnchor.constraint(equalTo: curtainView.trailingAnchor,
                                           constant: -20),
      
      descriptionLabel.leadingAnchor.constraint(equalTo: curtainView.leadingAnchor,
                                                constant: 20),
      descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                            constant: 12),
      descriptionLabel.trailingAnchor.constraint(equalTo: curtainView.trailingAnchor,
                                                 constant: -20),
      
      carouselChipsView.leadingAnchor.constraint(equalTo: curtainView.leadingAnchor),
      carouselChipsView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,
                                             constant: 12),
      carouselChipsView.trailingAnchor.constraint(equalTo: curtainView.trailingAnchor),
      
      mainButton.topAnchor.constraint(equalTo: carouselChipsView.bottomAnchor,
                                      constant: 32),
      mainButton.trailingAnchor.constraint(equalTo: curtainView.trailingAnchor,
                                           constant: -20),
      mainButton.bottomAnchor.constraint(equalTo: curtainView.bottomAnchor,
                                         constant: -58),
      
      joinUsButton.centerYAnchor.constraint(equalTo: mainButton.centerYAnchor),
      joinUsButton.leadingAnchor.constraint(equalTo: curtainView.leadingAnchor),
      joinUsButton.trailingAnchor.constraint(greaterThanOrEqualTo: mainButton.leadingAnchor,
                                             constant: -8)
    ])
  }
  
  func applyDefaultBehavior() {
    let appearance = Appearance()
    backgroundColor = surfColor.primaryWhite
    
    titleLabel.font = surfFont.primaryBold24
    titleLabel.textColor = surfColor.primaryBlack
    
    descriptionLabel.font = surfFont.primaryRegular14
    descriptionLabel.textColor = surfColor.primaryGray
    descriptionLabel.numberOfLines = .zero
    let chips = ChipsView()
    chips.setTitle("IOS", for: .normal)
    carouselChipsView.listChips = [
      chips,
      chips,
      chips,
      chips
    ]
    
    backgroundImage.contentMode = .scaleAspectFill
    backgroundImage.clipsToBounds = true
    backgroundImage.image = appearance.backgroundImage
    
    curtainView.backgroundColor = surfColor.primaryWhite
    curtainView.layer.cornerRadius = appearance.cornerRadius
    curtainView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    curtainView.clipsToBounds = true
    
    mainButton.setTitle(appearance.submitApplication, for: .normal)
    mainButton.addTarget(self, action: #selector(mainButtonAction), for: .touchUpInside)
    
    joinUsButton.setTitle(appearance.joinUs, for: .normal)
    joinUsButton.setTitleColor(surfColor.primaryGray, for: .normal)
    joinUsButton.titleLabel?.font = surfFont.primaryRegular14
  }
  
  @objc
  func mainButtonAction() {
    output?.submitApplicationAction()
  }
}

// MARK: - Appearance

private extension MainScreenView {
  struct Appearance {
    let backgroundImage = UIImage(named: "main_background")
    let cornerRadius: CGFloat = 16
    let submitApplication = "Отправить заявку"
    let joinUs = "Хочешь к нам?"
  }
}
