import Foundation

struct Stack {
    private var elements: [String] = []
    
    // 데이터 삽입
    mutating func push(_ value: String) {
        elements.append(value)
    }
    
    // 데이터 제거
    mutating func pop() -> String? {
        return elements.popLast()
    }
    
    // 최상단 값 반환
    func peek() -> String? {
        return elements.last
    }
}
