import UIKit

// SILVER BULLET 2.0

let screenWidth: Double = 1366  // Ширина экрана
let colNumber: Double = 16       // Количество колонок
let gap: Double = 12            // Гаттер между колонками
var sideMargin: Double = 104    // Начальный боковой отступ (изменится, если это потребуется)

///////////////////////////////////////////////////////////

var colWidthInc: Double = 0
var colWidthDec: Double = 0
var sideMarginInc = sideMargin
var sideMarginDec = sideMargin
var inc = 0
var dec = 0

var colWidthOpt: Double = 0
var colWidthAlt: Double = 0
var sideMarginOpt: Double = 0
var sideMarginAlt: Double = 0

func calculateInc() {
    colWidthInc = (screenWidth - sideMarginInc * 2 - gap * (colNumber - 1)) / colNumber
}

func calculateDec() {
    colWidthDec = (screenWidth - sideMarginDec * 2 - gap * (colNumber - 1)) / colNumber
}

if screenWidth.truncatingRemainder(dividingBy: 2) != 0 && colNumber.truncatingRemainder(dividingBy: 2) == 0 {
    print("Выберите чётное число для ширины экрана")
} else {
    
    calculateInc()
    calculateDec()

    while floor(colWidthInc) != colWidthInc {
        inc += 1
        sideMarginInc += 1
        calculateInc()
    }

    while floor(colWidthDec) != colWidthDec {
        dec += 1
        sideMarginDec -= 1
        calculateDec()
    }

    if sideMarginInc == sideMarginDec {
        print("Боковой отступ = \(Int(sideMarginInc)) px. Ширина колонки = \(Int(colWidthInc)) px. Общая ширина контента = \(Int(screenWidth - sideMarginInc * 2)) px")
    } else {
        if inc < dec {
            sideMarginOpt = sideMarginInc
            colWidthOpt = colWidthInc
            sideMarginAlt = sideMarginDec
            colWidthAlt = colWidthDec
        } else if inc > dec {
            sideMarginOpt = sideMarginDec
            colWidthOpt = colWidthDec
            sideMarginAlt = sideMarginInc
            colWidthAlt = colWidthInc
        }
        print("Ближайший вариант:")
        print("Боковой отступ = \(Int(sideMarginOpt)) px. Ширина колонки = \(Int(colWidthOpt)) px. Общая ширина контента = \(Int(screenWidth - sideMarginOpt * 2)) px")
        print("")
        print("Альтернативный вариант:")
        print("Боковой отступ = \(Int(sideMarginAlt)) px. Ширина колонки = \(Int(colWidthAlt)) px. Общая ширина контента = \(Int(screenWidth - sideMarginAlt * 2)) px")
    }

}
