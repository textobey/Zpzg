//
//  MainViewController.swift
//  Zpzg
//
//  Created by 이서준 on 2022/06/23.
//

import UIKit

class MainViewController: UIViewController {
    
    private let dataSources: [Int] = Array<Int>(0 ... 11)
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        let length = (UIScreen.main.bounds.size.width - (12 * 3)) / 2
        $0.itemSize = CGSize(width: length, height: length * 0.45)
        $0.minimumLineSpacing = 12
        $0.minimumInteritemSpacing = 12
    }).then {
        $0.delegate = self
        $0.dataSource = self
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        $0.register(MonthCollectionViewCell.self, forCellWithReuseIdentifier: MonthCollectionViewCell.identifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = R.Color.dark
        setupNavigationBar()
        setupLayout()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Month"
    }
    
    private func setupLayout() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(12)
        }
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSources.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MonthCollectionViewCell.identifier, for: indexPath) as? MonthCollectionViewCell {
            cell.monthLabel.text = "\(dataSources[indexPath.row] + 1)월"
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? MonthCollectionViewCell {
            //print(cell.monthLabel.text, "Tapped!")
            let calendarViewController = CalendarViewController(title: cell.monthLabel.text ?? "Calendar")
            navigationController?.pushViewController(calendarViewController, animated: true)
        }
    }
}
