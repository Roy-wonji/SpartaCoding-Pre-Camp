import Foundation

enum Category: String {
    case phone
    case noteBook
    case tablet
    case accessories
    case wearables
    case etc
    
    var categoryDescition: String {
        switch self {
        case .phone:
            return "핸드폰"
        case .noteBook:
            return "노트북"
        case .accessories:
            return "악세사리"
        case .tablet:
            return "태블릿"
        case .wearables:
            return "웨어러블"
        case .etc:
            return "기타"
        }
    }
}

struct Product {
    var id : String
    var name : String
    var price: Double
    var category: Category
}

extension Product {
    var formattedPrice: String {
        return String(format: "$%.2f", price)
    }
    
    static var mockItem : [Product] {
        return [
            Product(id: "1", name: "MacBook Pro", price: 2499.99, category: .noteBook),
            Product(id: "2", name: "iPhone 15", price: 1199.99, category: .phone),
            Product(id: "3", name: "AirPods Pro", price: 249.99, category:.accessories),
            Product(id: "4", name: "iPad Air", price: 699.99, category: .accessories),
            Product(id: "5", name: "Apple Watch", price: 399.99, category: .wearables)
        ]
    }
}

