import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .onAppear{
    Dispathctest()
            tasktest()
            generictest()
            generictest2()
        }
    }
    
    
    
    func Dispathctest() {
        DispatchQueue.global().async {
            for i in 1...5 {
                print(i)
            }
            DispatchQueue.main.async {
                print("UI 업데이트 완료")
            }
        }
        
        
    }
    
    func tasktest() {
        Task {
            // 3초 동안 대기 (비동기)
            try? await Task.sleep(nanoseconds: 3_000_000_000) // 3초
            
            print("데이터 로딩 중...")
            
            // UI 업데이트는 MainActor에서
            await MainActor.run {
                print("데이터 로드 완료")
            }
        }
    }
    
    func generictest() {
        var a = 10
        var b = 20
        swapValues(&a, &b)
        print(a, b) // 출력: 20, 10
    }
    
    func swapValues<T>(_ a: inout T, _ b: inout T) {
        let temp = a
        a = b
        b = temp
    }
    
    func generictest2() {
        var intStack = Stack<Int>()
        intStack.push(1)
        intStack.push(2)
        print(intStack.pop()) // 출력: 2
    }
}


struct Stack<T> {
    private var elements: [T] = []
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        return elements.popLast()
    }
}
