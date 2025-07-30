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
            let doubled = ClouserPratice.number.map { $0 * 2 }
            print(doubled)
            ClouserPratice.incrementCounter()
             ClouserPratice.incrementCounter()
            print(ClouserPratice.count)
            let animal = Animal(name: "Cat")
            animal.makeSound() // ✅ 올바름
            
            let dog = Dog(name: "Dog")
            dog.makeSound() // ✅ 올바름
            
        }
    }
}
