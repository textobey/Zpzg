//
//  Resource.swift
//  Zpzg
//
//  Created by 이서준 on 2022/06/30.
//

import UIKit

struct R {
    struct String {
        struct Main {}
    }
    struct Color {}
}

extension R.Color {
    // MARK: - DarkMode
    /// UIColor(0, 0, 0)
    static let dark = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    /// UIColor(22, 22, 24)
    static let dark22 = #colorLiteral(red: 0.0862745098, green: 0.0862745098, blue: 0.09411764706, alpha: 1)
    /// UIColor(33, 33, 36)
    static let dark33 = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1411764706, alpha: 1)
    /// UIColor(255, 255, 255)
    static let white = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    /// UIColor(129, 129, 129)
    static let gray = #colorLiteral(red: 0.5058823529, green: 0.5058823529, blue: 0.5058823529, alpha: 1)
    
    // MARK: - HIG Colors
    /// UIColor(255, 59, 48)
    static let red = #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)
    /// UIColor(255, 149, 0)
    static let orange = #colorLiteral(red: 1, green: 0.5843137255, blue: 0, alpha: 1)
    /// UIColor(255, 204, 0)
    static let yellow = #colorLiteral(red: 1, green: 0.8, blue: 0, alpha: 1)
    /// UIColor(76, 217, 100)
    static let green = #colorLiteral(red: 0.2980392157, green: 0.8509803922, blue: 0.3921568627, alpha: 1)
    /// UIColor(90, 200, 250)
    static let cyan = #colorLiteral(red: 0.3529411765, green: 0.7843137255, blue: 0.9803921569, alpha: 1)
    /// UIColor(0, 122, 255)
    static let blue = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
    /// UIColor(88, 86, 214)
    static let purple = #colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1)
    /// UIColor(255, 45, 85)
    static let pink = #colorLiteral(red: 1, green: 0.1764705882, blue: 0.3333333333, alpha: 1)
}
