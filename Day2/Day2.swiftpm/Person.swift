import Foundation

class Person {
    let name: String
    var pet: Pet?
    
    init(name: String) {
        self.name = name
        print("👤 \(name) 초기화됨")
    }
    
    deinit {
        print("👤 \(name) 해제됨")
    }
}
