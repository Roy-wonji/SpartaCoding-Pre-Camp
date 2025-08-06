//
//  MemoListViewModel.swift
//  Memo
//
//  Created by Wonji Suh  on 8/6/25.
//

import Foundation
import Combine

final class MemoListViewModel {
  // MARK: - Properties

  @Published private(set) var memos: [String] = []

  private let memoKey = "memoList"

  init() {
    loadData()
  }

  // MARK: - Public Methods

  func add(_ memo: String) {
    memos.append(memo)
    saveData()
  }

  func delete(at index: Int) {
    guard memos.indices.contains(index) else { return }
    memos.remove(at: index)
    saveData()
  }

  func reset() {
    memos.removeAll()
    UserDefaults.standard.removeObject(forKey: memoKey) // ✅ UserDefaults에서 삭제
  }

  // MARK: - Persistence

  private func saveData() {
    UserDefaults.standard.set(memos, forKey: memoKey)
  }

  private func loadData() {
    if let saved = UserDefaults.standard.array(forKey: memoKey) as? [String] {
      self.memos = saved
    }
  }
}
