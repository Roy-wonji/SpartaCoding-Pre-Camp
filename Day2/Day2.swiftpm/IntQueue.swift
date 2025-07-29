struct Queue {
    private var elements: [Int] = []
    
    // 데이터 삽입
    mutating func enqueue(_ value: Int) {
        elements.append(value)
    }
    
    // 데이터 제거
    @discardableResult
    mutating func dequeue() -> Int? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
    
    // 현재 상태 출력
    func printStatus() {
        print("Queue 상태: \(elements)")
    }
}


