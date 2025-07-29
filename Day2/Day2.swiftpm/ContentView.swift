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
            var queue = Queue()
            queue.enqueue(10)
            queue.enqueue(20)
            queue.enqueue(30)
            queue.printStatus()      // 출력: Queue 상태: [10, 20, 30]
            if let removed = queue.dequeue() {
                print("제거된 값: \(removed)")
            }        // 제거: 10
            _ = queue.dequeue()  // ✅ 경고 없음
            queue.printStatus()      // 출력: Queue 상태: [20, 30]
            
            
            var stack = Stack()
            stack.push("Hello")
            stack.push("World")
            print(stack.peek() ?? "Empty")  // 출력: World
            if let popped = stack.pop() {
                print("제거된 값: \(popped)")
            }                  // 제거: World
            _ = stack.pop()  // ✅ 경고 없음
            print(stack.peek() ?? "Empty")  // 출력: Hello
            
            
            do {
                let person = Person(name: "Suhwon")
                let dog = Pet(name: "Bori")
                
                person.pet = dog
                dog.owner = person
            }
        }
    }
}
