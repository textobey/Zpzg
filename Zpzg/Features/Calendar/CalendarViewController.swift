//
//  CalendarViewController.swift
//  Zpzg
//
//  Created by 이서준 on 2022/06/23.
//

import UIKit

class CalendarViewController: UIViewController {
    
    let navTitle: String
    
    let monthDataSource: [String] = Array(repeating: "7월", count: 30)
    
    let dayDataSource: [String] = Array<Int>(0...29).map { String($0) }
    
    private(set) var offsetY: CGFloat = 0.0 {
        willSet {
            offsetY < newValue ? fixCalendarFrame() : releaseCalendarFrame()
        }
    }
    
    lazy var scrollView = UIScrollView().then {
        $0.delegate = self
        $0.alwaysBounceVertical = true
        $0.showsHorizontalScrollIndicator = false
    }
    
    lazy var scrollContainerView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var calendarStackView = UIStackView().then {
        $0.spacing = 0
        $0.axis = .vertical
        $0.distribution = .fillEqually
        //$0.addBackground(color: .white)
    }
    
    lazy var contentStackView = UIStackView().then {
        $0.spacing = 0
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fillEqually
        //$0.addBackground(color: .white)
    }
    
    init(title: String) {
        self.navTitle = title
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = R.Color.dark
        setupNavigationBar()
        setupLayout()
        bindDataSource()
    }
    
    private func setupNavigationBar() {
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addPriceStatement))
    }
    
    private func setupLayout() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.directionalEdges.equalToSafeAreaAuto(self.view)
        }
        scrollView.addSubview(scrollContainerView)
        scrollContainerView.snp.makeConstraints {
            $0.top.bottom.centerX.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.size.width)
        }
        scrollContainerView.addSubview(calendarStackView)
        calendarStackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
            $0.width.equalTo(60)
        }
        scrollContainerView.addSubview(contentStackView)
        contentStackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(calendarStackView.snp.trailing)
            $0.trailing.equalToSuperview()
        }
    }
}

extension CalendarViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        offsetY = scrollView.contentOffset.y
    }
}

extension CalendarViewController {
    private func bindDataSource() {
        (0 ..< 30).enumerated().forEach { index, dataSource in
            let calendarView = CalendarTicketView().then {
                $0.tag = index + 100
                $0.monthLabel.text = monthDataSource[index]
                $0.dayLabel.text = dayDataSource[index]
            }
            let contentview = ContentTicketView().then {
                $0.backgroundColor = R.Color.gray
                $0.tag = index + 200
            }
            calendarStackView.addArrangedSubview(calendarView)
            contentStackView.addArrangedSubview(contentview)
        }
    }
    
    @objc func addPriceStatement() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .white
        present(viewController, animated: true)
    }
}

extension CalendarViewController {
    private func fixCalendarFrame() {
        let offsetY = scrollView.contentOffset.y
        let row = offsetY <= 200 ? 0 : (offsetY / 200)

        if let view = calendarStackView.viewWithTag(Int(row) + 100) as? CalendarTicketView {
            view.monthLabel.snp.remakeConstraints {
                $0.top.equalToSafeAreaAuto(self.view)
                $0.leading.trailing.equalToSuperview()
            }
        }
    }
    
    private func releaseCalendarFrame() {
        let offsetY = scrollView.contentOffset.y
        let row = (offsetY / 200)
        
        if let view = calendarStackView.viewWithTag(Int(row) + 101) as? CalendarTicketView {
            view.monthLabel.snp.remakeConstraints {
                $0.top.leading.trailing.equalToSuperview()
            }
        }
    }
}
