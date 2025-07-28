import SwiftUI

@Observable
class ShoppingCartViewModel: ShoppingCartProtocol, DiscountableProtocol {
    var item: [Product] = Product.mockItem
    
    var originalPrice: Double {
        return item.reduce(0) { $0 + $1.price }
    }
    
    func discountedPrice(rate: Double) -> Double {
        return originalPrice * (1 - rate)
    }
    
    var totalPrice: Double {
        return item.reduce(0) { $0 + $1.price }
    }
    
    func addItem(_ product: Product) async throws {
        item.append(product)
    }
    
    func removeItem(at index: Int) {
        guard item.indices.contains(index) else { return }
        item.remove(at: index)
    }
}
