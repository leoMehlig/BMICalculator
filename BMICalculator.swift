//
//  BMICalculator.swift
//
//  Created by Marcel Voß on 05/01/2017.
//  Copyright © 2017 Marcel Voss. All rights reserved.
//
//  Sources:
//  http://www.calculator.net/bmi-calculator.html
//  https://www.uni-hohenheim.de/wwwin140/info/interaktives/bmi.htm
//

import UIKit

class BMICalculator: NSObject {
    
    enum BMIRating {
        case severeThinness // < 16
        case moderateThinness // 16 - 17
        case mildThinness // 17 - 18.5
        case normal // 18.5 - 25
        case overweight // 25 - 30
        case obeseClassI // 30 - 35
        case obeseClassII // 35 - 40
        case obeseClassIII // > 40
        case undefined // Undefined/Error
    }

    /// Calculates a BMI (Body Mass Index) using the given weight and height.
    ///
    /// - Parameters:
    ///   - weight: The weight (in kilogram or pounds) that shall be used to calculate the BMI.
    ///   - height: The height (in centimeters or inches) that shall be used to calculate the BMI.
    ///   - useMetricUnits: Wether the given values are in metric or imperial units. May be omitted (is set to true by default).
    /// - Returns: The calculated BMI value and an appropriate value of BMIRating type.
    class func calculateBMI(weight: Float, height: Float, useMetricUnits: Bool = true) -> (Float, BMIRating) {
        if useMetricUnits {
            // Metric Units:
            // BMI = weight(kg)/height2(m2)
            
            let BMI =  weight/pow(height / 100, 2)
            return (BMI, BMICalculator.ratingForBMI(BMI))
        } else {
            // Imperial Units:
            // BMI = 703·weight(lb)/height2(in2)
            
            let BMI = 703 * weight/pow(height, 2)
            return (BMI, BMICalculator.ratingForBMI(BMI))
        }
    }
    
    /// Takes a calculated BMI value and returns an appropriate BMIRating type.
    ///
    /// - Parameter bmi: BMI value that shall be used.
    /// - Returns: A value of the BMIRating type.
    private class func ratingForBMI(_ bmi: Float) -> BMIRating {
        if bmi < 16 {
            return .severeThinness
        } else if bmi >= 16 && bmi <= 17 {
            return .moderateThinness
        } else if bmi >= 17 && bmi <= 18.5 {
            return .mildThinness
        } else if bmi >= 18.5 && bmi <= 25 {
            return .normal
        } else if bmi >= 25 && bmi <= 30 {
            return .overweight
        } else if bmi >= 30 && bmi <= 35 {
            return .obeseClassI
        } else if bmi >= 35 && bmi <= 40 {
            return .obeseClassII
        } else if bmi > 40 {
            return .obeseClassIII
        } else {
            return .undefined
        }
    }
    
}
