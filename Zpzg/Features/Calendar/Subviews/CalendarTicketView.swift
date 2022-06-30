//
//  CalendarTicketView.swift
//  Zpzg
//
//  Created by 이서준 on 2022/06/30.
//

import UIKit
import SnapKit

class CalendarTicketView: UIView {
    
    lazy var wrapperView = UIView().then {
        $0.backgroundColor = R.Color.dark
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var monthLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 18, weight: .regular)
        $0.textColor = R.Color.gray
    }
    
    lazy var dayLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 32, weight: .bold)
        $0.textColor = R.Color.white
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
            $0.top.leading.bottom.equalToSuperview()
            $0.size.equalTo(CGSize(width: 60, height: 200))
        }
        
        wrapperView.addSubview(monthLabel)
        monthLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        wrapperView.addSubview(dayLabel)
        dayLabel.snp.makeConstraints {
            $0.top.equalTo(monthLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
    }
}
