import SwiftUI

protocol ShoppingCartProtocol {
    var totalPrice: Double { get }
    func addItem(_ product: Product) async throws 
    func removeItem(at index: Int) async throws
}
