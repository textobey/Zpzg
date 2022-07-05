//
//  UIView+.swift
//  Zpzg
//
//  Created by 이서준 on 2022/07/05.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach {
            addSubview($0)
        }
    }
}
