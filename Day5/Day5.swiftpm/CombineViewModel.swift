import SwiftUI
import Combine

import Foundation
import Combine

@Observable
final class CombineViewModel {
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Publishers
    let numbers = [10, 20, 30, 40, 50].publisher
    let justPublisher = Just(100)
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    var cancellable: AnyCancellable?
    // MARK: - Action 정의
    enum Action {
        case numberTest
        case justTest
        case todotest
        case timerTest
    }
    
    // MARK: - Action 실행 메서드
    func send(action: Action) {
        switch action {
        case .numberTest:
            numbers
                .map { $0 * 2 }
                .sink { print("🔢 numberTest: \($0)") }
                .store(in: &cancellables)
            
        case .justTest:
            justPublisher
                .map { $0 + 50 }
                .sink { print("🎯 justTest: \($0)") }
                .store(in: &cancellables)
            
        case .todotest:
            URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }
                .decode(type: Todo.self, decoder: JSONDecoder())
                .sink(
                    receiveCompletion: { print("Completion: \($0)") },
                    receiveValue: { print("Title: \($0.title)") }
                )
                .store(in: &cancellables)
            
        case .timerTest:
            cancellable = timer
                .sink { print($0) }
            
            Task {
                try? await Task.sleep(nanoseconds: 5_000_000_000)
                cancellable?.cancel()
                print("🛑 5초 후 구독 취소됨")
            }
            
        }
    }
}
