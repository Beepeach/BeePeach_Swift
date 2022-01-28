import UIKit

// 10진수 -> 다른 진수는 Int -> String으로
let decimal: Int = 20

let binary: String = String(decimal, radix: 2)
print(binary)

// 다른진수 -> 10진수는 String -> Int로
let hexaDecimal: String = String(487, radix: 16, uppercase: true)
print(hexaDecimal)

let hexaToDecimal: Int = Int(hexaDecimal, radix: 16) ?? 0
print(hexaToDecimal)

