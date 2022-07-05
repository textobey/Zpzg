//
//  UIButton+.swift
//  Zpzg
//
//  Created by 이서준 on 2022/07/05.
//

import UIKit

// Based on Kickstarter-Prelude version
// https://github.com/kickstarter/Kickstarter-Prelude/blob/master/Prelude-UIKit/UIButton.swift
extension UIButton {
    /**
     Sets the background color of a button for a particular state.
     - parameter backgroundColor: The color to set.
     - parameter state:           The state for the color to take affect.
     */
    func setBackgroundColor(_ backgroundColor: UIColor, for state: UIControl.State) {
        self.setBackgroundImage(.pixel(ofColor: backgroundColor), for: state)
    }
}
