//
//  ConstraintMakerRelatable+.swift
//  Zpzg
//
//  Created by 이서준 on 2022/06/30.
//

import UIKit
import SnapKit

extension ConstraintMakerRelatable {
    @discardableResult
    public func equalToSafeAreaAuto(_ view: UIView, _ file: String = #file, _ line: UInt = #line) -> ConstraintMakerEditable {
        return self.equalTo(view.safeAreaLayoutGuide, file, line)
    }
}
