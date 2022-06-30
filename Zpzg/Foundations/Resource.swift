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
}
