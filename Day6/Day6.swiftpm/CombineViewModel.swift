import SwiftUI
import Combine

import Foundation
import Combine

import SwiftUI
import Combine

@Observable
final class CombineViewModel {
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - State
    var color: Color = .black
    
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
        case randomColor
        case resetColor
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
            
        case .randomColor:
            color = generateRandomColor()
            print("🌈 랜덤 색상 생성됨: \(color)")
            
        case .resetColor:
            color = .white
        }
    }
    
    // MARK: - 랜덤 색상 생성기
    private func generateRandomColor() -> Color {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        return Color(red: red, green: green, blue: blue)
    }
}
