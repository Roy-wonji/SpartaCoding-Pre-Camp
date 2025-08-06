//
//  BaseView.swift
//  Memo
//
//  Created by Wonji Suh  on 8/6/25.
//

import UIKit

// MARK: - BaseView

/// 모든 커스텀 뷰의 공통 기능을 제공하는 기본 UIView 서브클래스.
///
/// - `configureView()`에서 뷰의 초기 속성을 설정합니다.
/// - `setupLayout()`에서 서브뷰의 제약조건 또는 레이아웃을 구성합니다.
/// - 두 메서드는 초기화 시 자동으로 호출됩니다.
class BaseView: UIView {
  // MARK: - Initialization

  /// 코드로 생성될 때 호출되며, 뷰 설정 및 레이아웃 메서드를 자동으로 실행합니다.
  ///
  /// - Parameter frame: 뷰의 초기 프레임
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureView()
    setupLayout()
  }

  /// 인터페이스 빌더에서 생성될 때 호출되며, 뷰 설정 및 레이아웃 메서드를 자동으로 실행합니다.
  ///
  /// - Parameter coder: 디코딩에 사용되는 NSCoder
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    configureView()
    setupLayout()
  }

  // MARK: - View Configuration

  /// 뷰의 기본 속성을 설정합니다.
  ///
  /// 서브클래스에서 배경색, 그림자, 테두리 등 뷰 자체의 속성을 정의할 때 오버라이드합니다.
  func configureView() {
    backgroundColor = .white
  }

  // MARK: - Layout

  /// 서브뷰의 레이아웃을 설정하는 진입점입니다.
  ///
  /// 서브클래스에서 Auto Layout 제약조건 또는 수동 레이아웃 코드를 작성할 때 오버라이드합니다.
  func setupLayout() {
  }
}

