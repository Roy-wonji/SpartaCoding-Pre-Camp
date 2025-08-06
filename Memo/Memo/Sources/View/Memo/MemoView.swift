//
//  MemoView.swift
//  Memo
//
//  Created by Wonji Suh  on 8/6/25.
//

import UIKit
import Reusable


final class MemoListView: BaseView, Reusable {

  let tableView = UITableView()
    let resetButton: UIButton = {
      let button = UIButton(type: .system)
      button.setTitle("초기화", for: .normal)
      button.setTitleColor(.white, for: .normal)
      button.backgroundColor = .systemRed
      button.layer.cornerRadius = 8
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }()

    override func configureView() {
      super.configureView()

      // ✅ 기존 register → Reusable 방식으로 교체
      tableView.register(cellType: MemoCell.self)

      tableView.translatesAutoresizingMaskIntoConstraints = false
      addSubview(tableView)
      addSubview(resetButton)
    }

    override func setupLayout() {
      NSLayoutConstraint.activate([
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor),

        resetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        resetButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
        resetButton.widthAnchor.constraint(equalToConstant: 80),
        resetButton.heightAnchor.constraint(equalToConstant: 40),
      ])
    }
}
