//
//  ContentTicketView.swift
//  Zpzg
//
//  Created by 이서준 on 2022/06/30.
//

import UIKit
import SnapKit

class ContentTicketView: UIView {
    
    lazy var tableView = UITableView().then {
        $0.delegate = self
        $0.dataSource = self
        $0.separatorStyle = .none
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = UITableView.automaticDimension
        $0.register(PriceStatementList.self, forCellReuseIdentifier: PriceStatementList.identifier)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
            $0.width.equalTo(Metric.contentTicketWidth)
            $0.height.equalTo(Metric.ticketHeight)
        }
    }
}

extension ContentTicketView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: PriceStatementList.identifier, for: indexPath) as? PriceStatementList {
            cell.purposeLabel.text = "Swift infrean"
            cell.priceLabel.text = "30,000"
            return cell
        }
        return UITableViewCell()
    }
}

fileprivate class PriceStatementList: UITableViewCell {
    static let identifier = String(describing: PriceStatementList.self)
    
    lazy var wrapperView = UIView().then {
        $0.backgroundColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var purposeLabel = UILabel().then {
        $0.textAlignment = .left
        $0.textColor = R.Color.gray
        $0.font = .systemFont(ofSize: 18, weight: .regular)
    }
    
    lazy var priceLabel = UILabel().then {
        $0.textAlignment = .left
        $0.textColor = R.Color.gray
        $0.font = .systemFont(ofSize: 18, weight: .regular)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(wrapperView)
        wrapperView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(200 / 4)
        }
        
        wrapperView.addSubview(purposeLabel)
        purposeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.centerY.equalToSuperview()
            let length = Metric.contentTicketWidth * 0.7
            $0.width.equalTo(length)
        }
        
        wrapperView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints {
            $0.leading.equalTo(purposeLabel.snp.trailing)
            $0.trailing.centerY.equalToSuperview()
        }
    }
}
