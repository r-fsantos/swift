// MARK - Swift Premisses
/// Safety, Speed and Simplicity
/// Safety -> Estatically and Safe Type Check (Inference Types)
/// Speed ->
/// Simplicity ->

// MARK - Swift Types
/// Named -> Protcols, Enums, Structs and Classes
/// Compound -> Tuple, function. ?

// MARK - Working Example
/// Build a safe, speedy and simple Scalable Vector Graphics (SVG) Framework

import Foundation
import CoreFoundation

// You can do this

///enum ColorName: String {
///case black = "black"
///case silver = "silver"
///case gray = "gray"
///case white = "white"
///case maroon = "maroon"
///case red = "red"
///}

// But this is also, reachable because Swifts type inference
//enum ColorName: String {
//    case black
//    case silver
//    case gray
//    case white
//    case maroon
//    case red
//}

// In order to get your code real clean and readable, one can also
///
///enum ColorName: String {
///    case black, silver, gray, white, maroon, red
///}
///
///print(ColorName.gray)

// You can also "extends" such enum functionality by adding
// the CaseIterable protocol, so one can iterate over all cases inside of the enum
// take look into that

enum ColorName: String, CaseIterable {
    case black, silver, gray, white, maroon, red
}

ColorName.allCases.map {print($0)}


// MARK - Associated Values
/// More than one representation for an enum case data.

typealias Color = UInt8

enum CSSColor {
    case named(name: ColorName)
    case rgb(red: Color, green: Color, blue: Color)
}

let blueColor = CSSColor.rgb(red: 0, green: 0, blue: 255)

print(blueColor, type(of: blueColor))
