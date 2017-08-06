import UIKit

// SILVER BULLET 1.0

let screenWidth: Double = 1366  // Ширина экрана
let colNumber: Double = 7       // Количество колонок

let gap: Double = 12
var sideMargin: Double = 104
var colWidth: Double = 0

func calculate() {
    colWidth = (screenWidth - sideMargin * 2 - gap * (colNumber - 1)) / colNumber
}

calculate()

while floor(colWidth) != colWidth {
    sideMargin += 1
    calculate()
}

print("Боковое поле = \(Int(sideMargin)) px. Ширина колонки = \(Int(colWidth)) px. Общая ширина контента = \(Int(screenWidth - sideMargin * 2)) px")
