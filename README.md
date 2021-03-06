# BMICalculator
![](https://img.shields.io/badge/Swift-3.0-orange.svg) ![](https://img.shields.io/github/license/marcelvoss/BMICalculator.svg)

A simple Swift class for calculating BMI (Body Mass Index) values.

>Your BMI is a measurement of your body weight based on your height and weight. Although your BMI does not actually "measure" your percentage of body fat, it is a useful tool to estimate a healthy body weight based on your height.

## Why?
Well, I had to calculate BMI values for a personal project and thought: "Hey, I should put that on Github." So, yeah. There you go.

## Usage
BMICalculator provides a single class with one public function that'll calculate a BMI value based on two required values: the weight and the height. In addition to that, you can specify wether the passed values are in imperial or metric units. It's super simple and will calculate the BMI value as well as returning an appropriate BMI rating (such as normal, obese class II or mild thinness).

In **Imperial units**:
```swift
let bmi = BMICalculator.calculateBMI(weight: 176.37, height: 73.2283, useMetricUnits: false)
print("\(bmi.0)")
```

In **Metric units**:
```swift
let bmi = BMICalculator.calculateBMI(weight: 80.0, height: 186.0)
print("\(bmi.0)")
```

The 'useMetricUnits' argument may be omitted but is set to `true` by default.

## License
BMICalculator is available under the MIT license. See the [LICENSE](https://github.com/marcelvoss/BMICalculator/blob/master/LICENSE) file for more information.
