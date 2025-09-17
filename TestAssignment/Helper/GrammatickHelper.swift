//
//  GrammatickHelper.swift
//  TestAssignment
//
//  Created by Maxim on 17.09.2025.
//

import Foundation

enum GrammatickHelper{
    static func formatExperience(_ years: Int) -> String {
        if years == 0 {
            return "нет опыта"
        }
        
        let lastDigit = years % 10
        
        let lastTwoDigits = years % 100
        
        if lastTwoDigits >= 11 && lastTwoDigits <= 14 {
            return "стаж \(years) лет"
        }
        
        switch lastDigit {
        case 1:
            return "стаж \(years) год"
        case 2, 3, 4:
            return "стаж \(years) года"
        default:
            return "стаж \(years) лет"
        }
    }

    static func formCategory(_ category: Int) -> String {
        switch category {
        case 0:
            return "Врач без категори"
        case 1:
            return "Врач второй категории"
        case 2:
            return "Врач первой категории"
        default:
            return "Врач выcшей категории"
        }
    }
}

