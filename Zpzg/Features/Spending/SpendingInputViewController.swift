//
//  SpendingInputViewController.swift
//  Zpzg
//
//  Created by 이서준 on 2022/07/04.
//

import UIKit

class SpendingInputViewController: UIViewController {
    
    lazy var closeButton = UIButton().then {
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.addTarget(self, action: #selector(closeButtonDidTap), for: .touchUpInside)
        $0.tintColor = .white
    }
    
    lazy var spendingInputView = SpendingInputView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @objc func closeButtonDidTap() {
        dismiss(animated: true)
    }
}
