//
//  SpendingInputViewController.swift
//  Zpzg
//
//  Created by 이서준 on 2022/07/04.
//

import UIKit

class SpendingInputViewController: UIViewController {
    
    var grabberVisible: Bool = false {
        willSet {
            if newValue { addGrabber() }
        }
    }
    
    lazy var closeButton = UIButton().then {
        $0.tintColor = .white
        $0.setPreferredSymbolConfiguration(.init(pointSize: 22), forImageIn: .normal)
        $0.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        $0.addTarget(self, action: #selector(closeButtonDidTap), for: .touchUpInside)
    }
    
    lazy var spendingInputView = SpendingInputView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = R.Color.dark
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(closeButton)
        closeButton.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(32)
        }
        
        view.addSubview(spendingInputView)
        spendingInputView.snp.makeConstraints {
            $0.top.equalTo(closeButton.snp.bottom).offset(12)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func addGrabber() {
        let indicatorSize = CGSize(width: 30, height: 5)
        let indicator = UIView().then {
            $0.backgroundColor = .tertiaryLabel
            $0.layer.cornerRadius = indicatorSize.height / CGFloat(2.0)
        }
        view.addSubview(indicator)
        indicator.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(indicatorSize)
        }
    }
    
    @objc func closeButtonDidTap() {
        dismiss(animated: true)
    }
}
