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

public struct BMI {
    
    public let bmi: Float
    public let rating: Rating
    
    public enum Rating {
        case severeThinness // < 16
        case moderateThinness // 16 - 17
        case mildThinness // 17 - 18.5
        case normal // 18.5 - 25
        case overweight // 25 - 30
        case obeseClassI // 30 - 35
        case obeseClassII // 35 - 40
        case obeseClassIII // > 40
        case undefined // Undefined/Error
        
        /// Takes a calculated BMI value and returns an appropriate BMIRating type.
        ///
        /// - Parameter bmi: BMI value that shall be used.
        /// - Returns: A value of the BMI.Rating type.
        init(bmi: Float) {
            if bmi < 16 {
                self = .severeThinness
            } else if bmi >= 16 && bmi <= 17 {
                self = .moderateThinness
            } else if bmi >= 17 && bmi <= 18.5 {
                self = .mildThinness
            } else if bmi >= 18.5 && bmi <= 25 {
                self = .normal
            } else if bmi >= 25 && bmi <= 30 {
                self = .overweight
            } else if bmi >= 30 && bmi <= 35 {
                self = .obeseClassI
            } else if bmi >= 35 && bmi <= 40 {
                self = .obeseClassII
            } else if bmi > 40 {
                self = .obeseClassIII
            } else {
                self = .undefined
            }
            
        }
    }
    
    /// Calculates a BMI (Body Mass Index) using the given weight and height.
    ///
    /// - Parameters:
    ///   - weight: The weight (in kilogram or pounds) that shall be used to calculate the BMI.
    ///   - height: The height (in centimeters or inches) that shall be used to calculate the BMI.
    ///   - useMetricUnits: Wether the given values are in metric or imperial units. May be omitted (is set to true by default).
    /// - Returns: The BMI type with the calculated BMI value and an appropriate value of Rating type.
    public init(weight: Float, height: Float, useMetricUnits: Bool = true) {
        if useMetricUnits {
            // Metric Units:
            // BMI = weight(kg)/height2(m2)
            
            self.bmi = weight / pow(height / 100, 2)
        } else {
            // Imperial Units:
            // BMI = 703·weight(lb)/height2(in2)
            
            self.bmi = 703 * weight/pow(height, 2)
        }
        self.rating = Rating(bmi: self.bmi)
    }
}
