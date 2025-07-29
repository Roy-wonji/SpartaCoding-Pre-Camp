import Foundation

class Pet {
    let name: String
    weak var owner: Person?  // 🔑 weak로 순환 참조 해결
    
    init(name: String) {
        self.name = name
        print("🐶 \(name) 초기화됨")
    }
    
    deinit {
        print("🐶 \(name) 해제됨")
    }
}
