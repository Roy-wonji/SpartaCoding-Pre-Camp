import SwiftUI
import Combine

import Foundation
import Combine

import SwiftUI
import Combine
import SwiftUI
import Combine

@Observable
final class CombineViewModel {
    // MARK: - 내부 상태
    struct State {
        var color: Color = .black
        var cancellable: AnyCancellable?
        
        let numbers = [10, 20, 30, 40, 50].publisher
        let justPublisher = Just(100)
        var count: Int = .zero
        var enableButton = false
    }
    
    // MARK: - 외부에 노출할 상태
    var state = State()
    
    // MARK: - 기타 내부 변수
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Action 정의
    enum Action {
       case addCount
        case minusCount
        case resetCount
    }
    
    // MARK: - Action 실행 메서드
    func send(action: Action) {
        switch action {
        case .addCount:
            state.count = min(state.count + 1, 10)
            
        case .minusCount:
            state.count = max(state.count - 1, -10)

            
        case .resetCount:
            state.count = .zero
            
        }
    }
}
