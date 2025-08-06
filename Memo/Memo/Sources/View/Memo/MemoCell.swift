//
//  MemoCell.swift
//  Memo
//
//  Created by Wonji Suh  on 8/6/25.
//

import UIKit
import Reusable

final class MemoCell: UITableViewCell, Reusable {

  // MARK: - UI

  private let memoLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 16)
    label.textColor = .label
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  // MARK: - Initializers

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupView()
    setupLayout()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupView()
    setupLayout()
  }

  // MARK: - Setup

  private func setupView() {
    contentView.addSubview(memoLabel)
    selectionStyle = .none
  }

  private func setupLayout() {
    NSLayoutConstraint.activate([
      memoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
      memoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
      memoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      memoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
    ])
  }

  // MARK: - Public

  func configure(with text: String) {
    memoLabel.text = text
  }
}
