//
//  ViewController.swift
//  Memo
//
//  Created by Wonji Suh  on 8/6/25.
//


import Combine
import UIKit

final class MemoListViewController: UIViewController {

  private let mainView = MemoListView()
  private let viewModel = MemoListViewModel() // ✅ ViewModel 도입
  private var cancellables = Set<AnyCancellable>()

  override func loadView() {
    self.view = mainView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "메모"
    setupUI()
    bindUI()
  }

  private func setupUI() {
    mainView.tableView.dataSource = self
    mainView.tableView.delegate = self

    navigationItem.rightBarButtonItem = UIBarButtonItem(
      systemItem: .add,
      primaryAction: UIAction { [weak self] _ in
        self?.showAddMemoAlert()
      },
      menu: nil
    )
  }

  private func bindUI() {
    // 버튼: 초기화
    mainView.resetButton
      .publisher(for: .touchUpInside)
      .sink { [weak self] in
        self?.viewModel.reset()
      }
      .store(in: &cancellables)

    // ViewModel → UI
    viewModel.$memos
      .receive(on: RunLoop.main)
      .sink { [weak self] _ in
        self?.mainView.tableView.reloadData()
      }
      .store(in: &cancellables)
  }

  private func showAddMemoAlert() {
    let alert = UIAlertController(title: "새 메모", message: nil, preferredStyle: .alert)
    alert.addTextField { $0.placeholder = "메모를 입력하세요" }

    let addAction = UIAlertAction(title: "추가", style: .default) { [weak self] _ in
      guard let text = alert.textFields?.first?.text, !text.isEmpty else { return }
      self?.viewModel.add(text)
    }

    alert.addAction(addAction)
    alert.addAction(UIAlertAction(title: "취소", style: .cancel))

    present(alert, animated: true)
  }
}

extension MemoListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    viewModel.memos.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: MemoCell = tableView.dequeueReusableCell(for: indexPath)
    cell.configure(with: viewModel.memos[indexPath.row])
    return cell
  }
}

extension MemoListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView,
                 trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
  -> UISwipeActionsConfiguration? {

    let deleteAction = UIContextualAction(style: .destructive, title: "삭제") { [weak self] _, _, completionHandler in
      self?.viewModel.delete(at: indexPath.row)
      completionHandler(true)
    }

    return UISwipeActionsConfiguration(actions: [deleteAction])
  }
}
