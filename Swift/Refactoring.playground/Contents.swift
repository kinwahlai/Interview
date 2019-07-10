//: A Cocoa based Playground to present user interface

import PlaygroundSupport

struct Config {
    static let country: String = "USA"
    static let state: String = "Seattle"
    static let taxRate: Double = 10.00
}

final class PriceCalculator {
    var discountApplied: Double = 0.0
    var coupons: [String: Double] = ["STDOFF": 10.00, "VIP": 25.00, "SEASON": 15.00]
    var itemRegistry: [String: Double] = [:]
    init() {}
    
    func addItem(name: String, price: Double) {
        self.itemRegistry[name] = price
    }
    
    func applyCoupon(code: String) -> Bool {
        discountApplied = coupons[code] ?? 0.0
        return true
    }
    
    func finalPrice() -> Double {
        var subTotal: Double = 0.0
        itemRegistry.forEach { (_, price) in
            subTotal += price
        }
        var total = subTotal - (subTotal * (discountApplied / 100))
        total = total + (total * (Config.taxRate / 100))
        return total
    }
    
    func printReceipt() {
        var subTotal: Double = 0.0
        itemRegistry.forEach { (_, price) in
            subTotal += price
        }
        print("***************************************")
        itemRegistry.forEach { (name, price) in
            let formattedPrice = String(format: "$%.2f", price)
            let spacer = 40 - name.count - formattedPrice.count - 1
            print("\(name)\(String(repeating: " ", count: spacer))\(formattedPrice)")
        }
        print("---------------------------------------")
        let formattedSubTotal = String(format: "$%.2f", subTotal)
        let subTotalSpacer = 40 - "Subtotal:".count - formattedSubTotal.count - 1
        print("Subtotal:\(String(repeating: " ", count: subTotalSpacer))\(formattedSubTotal)")
        var discountValue = (subTotal * (discountApplied / 100))
        if discountApplied > 0.0 {
            let formattedDV = String(format: "$%.2f", discountValue)
            let discountSpacer = 40 - "Discount:".count - formattedDV.count - 1
            print("Discount:\(String(repeating: " ", count: discountSpacer))\(formattedDV)")
        }
        var totalB4Tax = subTotal - discountValue
        var taxValue = totalB4Tax * (Config.taxRate / 100)
        if Config.taxRate > 0.0 {
            let taxValue = String(format: "$%.2f", taxValue)
            let taxSpacer = 40 - "Tax:".count - taxValue.count - 1
            print("Tax:\(String(repeating: " ", count: taxSpacer))\(taxValue)")
        }
        let formattedTotalValue = String(format: "$%.2f", totalB4Tax + taxValue)
        let taxSpacer = 40 - "Total:".count - formattedTotalValue.count - 1
        print("Total:\(String(repeating: " ", count: taxSpacer))\(formattedTotalValue)")
        print("***************************************")
    }
}



// Example
let priceCalculator = PriceCalculator()
// add items
priceCalculator.addItem(name: "Book", price: 10.00)
priceCalculator.addItem(name: "Pen", price: 3.00)

// Apply coupons
//priceCalculator.applyCoupon(code: "STDOFF")
//priceCalculator.applyCoupon(code: "WRONG")

// calculate final price and print receipt
priceCalculator.finalPrice()
priceCalculator.printReceipt()

