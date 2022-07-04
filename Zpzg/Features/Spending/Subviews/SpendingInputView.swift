//
//  SpendingInputView.swift
//  Zpzg
//
//  Created by 이서준 on 2022/07/04.
//

import UIKit
import SnapKit

class SpendingInputView: UIView {
    
    private let dataSources: [String] = ["날짜", "카테고리", "제목", "결제수단", "메모"]
    
    lazy var scrollView = UIScrollView().then {
        $0.alwaysBounceVertical = true
        $0.showsHorizontalScrollIndicator = false
        $0.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
    
    lazy var scrollContainerView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var titleLabelTextField = UITextField().then {
        $0.placeholder = "제목 없음"
        $0.font = .systemFont(ofSize: 32, weight: .bold)
    }
    
    lazy var spendingPriceTextField = UITextField().then {
        $0.placeholder = "0"
        $0.keyboardType = .numberPad
        $0.font = .systemFont(ofSize: 24, weight: .medium)
    }
    
    lazy var fixedWonLabel = UIButton().then {
        $0.setTitle("원", for: .normal)
        $0.contentHorizontalAlignment = .left
        $0.setTitleColor(R.Color.gray, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        $0.addTarget(self, action: #selector(wonButtonDidTap), for: .touchUpInside)
    }
    
    lazy var stackView = UIStackView().then {
        $0.spacing = 0
        $0.axis = .vertical
        $0.distribution = .fillEqually
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        bindDataSource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.directionalEdges.equalToSuperview()
        }
        
        scrollView.addSubview(scrollContainerView)
        scrollContainerView.snp.makeConstraints {
            $0.top.bottom.centerX.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.size.width)
        }
        
        scrollContainerView.addSubview(titleLabelTextField)
        titleLabelTextField.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(33)
        }
        
        scrollContainerView.addSubview(spendingPriceTextField)
        spendingPriceTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabelTextField.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(24)
        }
        
        scrollContainerView.addSubview(fixedWonLabel)
        fixedWonLabel.snp.makeConstraints {
            $0.bottom.equalTo(spendingPriceTextField)
            $0.leading.equalTo(spendingPriceTextField.snp.trailing).offset(2)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(18)
        }
        
        scrollContainerView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalTo(spendingPriceTextField.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func bindDataSource() {
        dataSources.forEach { dataSource in
            let view = SpendingInputListView()
            view.titleLabel.text = dataSource
            stackView.addArrangedSubview(view)
        }
    }
    
    @objc func wonButtonDidTap() {
        spendingPriceTextField.becomeFirstResponder()
    }
}

class SpendingInputListView: UIView {
    
    lazy var wrapperView = UIView()
    
    lazy var titleLabel = UILabel().then {
        $0.textAlignment = .left
        $0.textColor = R.Color.white
        $0.font = .systemFont(ofSize: 18, weight: .regular)
    }
    
    lazy var textField = UITextField().then {
        $0.placeholder = "미분류"
    }
    
    lazy var separator = UIView().then {
        $0.backgroundColor = R.Color.gray
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(wrapperView)
        wrapperView.snp.makeConstraints {
            $0.directionalEdges.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        wrapperView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(80)
        }
        
        wrapperView.addSubview(textField)
        textField.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        wrapperView.addSubview(separator)
        separator.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(0.2)
        }
    }
}
