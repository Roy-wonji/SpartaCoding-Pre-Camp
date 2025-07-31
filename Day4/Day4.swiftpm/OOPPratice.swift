import SwiftUI
import OSLog

class Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func makeSound() {
        print("Some generic sound")
    }
}


class Dog: Animal {
    override func makeSound() {
        print("Bark")
    }    
}
