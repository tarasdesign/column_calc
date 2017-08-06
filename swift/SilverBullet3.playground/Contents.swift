import UIKit

// SILVER BULLET 3.0

let screenWidth: Double = 1366                      // Ширина экрана
let gap: Double = 12                                // Расстояние между колонками
let minMargin = 40                                  // Минимально допустимые поля
let maxMargin = 200                                 // Максимально допустимые поля
let maxErrors = 0                                   // Максимально допустимое количество дробных колонок
let cols = [1, 2, 3, 4, 5, 6, 8, 9, 10, 12]         // Колонки


//////////////////////////////////////////////////////////////////////////////////


var sideMargin: Double = 0
var colWidth: Double = 0

func calculate(colNumber: Double) {
    colWidth = (screenWidth - sideMargin * 2 - gap * (colNumber - 1)) / colNumber
}

for var x in 0..<maxMargin - minMargin {
    
    sideMargin = Double(minMargin + x)
    
    var numberOfErrors = 0
    
    for var i in cols {
        calculate(colNumber: Double(i))
        if floor(colWidth) != colWidth {
            numberOfErrors += 1
        }
    }
    
    if numberOfErrors <= maxErrors {
        
        print("screen: \(Int(screenWidth))")
        print("margin: \(Int(sideMargin))")
        print("errors: \(numberOfErrors)")
        print()
        
        for var i in cols {
            calculate(colNumber: Double(i))
            if floor(colWidth) == colWidth {
                print("\(i) col —> width: \(Int(colWidth))")
            } else {
                print("\(i) col —> width: \(colWidth)")
            }
        }
        
        print(); print(); print(String(repeating: "=", count: 24)); print(); print()
    }
}
