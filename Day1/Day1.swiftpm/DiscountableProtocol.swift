import SwiftUI

protocol DiscountableProtocol {
    var originalPrice: Double { get }
    func discountedPrice(rate: Double) -> Double
}

extension DiscountableProtocol {
    func finalPrice() -> Double {
        return discountedPrice(rate: 0.1) // 기본 10% 할인
    }
    
    func displayPrice() -> String {
        return "원가: \(originalPrice)원, 할인가: \(finalPrice())원"
    }
}
