//
//  MonthCollectionViewCell.swift
//  Zpzg
//
//  Created by 이서준 on 2022/06/23.
//

import UIKit
import SnapKit

class MonthCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: MonthCollectionViewCell.self)
    
    lazy var wrapperView = UIView().then {
        $0.layer.cornerRadius = 20
        $0.backgroundColor = UIColor(22, 22, 24)
        //$0.backgroundColor = UIColor(33, 33, 36)
    }
    
    lazy var monthLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 18, weight: .bold)
        $0.numberOfLines = 0
        $0.lineBreakMode = .byTruncatingTail
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(wrapperView)
        wrapperView.snp.makeConstraints {
            $0.directionalEdges.equalToSuperview()
        }
        wrapperView.addSubview(monthLabel)
        monthLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-12)
            $0.centerY.equalToSuperview()
        }
    }
}
