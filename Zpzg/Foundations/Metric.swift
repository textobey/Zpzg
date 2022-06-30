//
//  Metric.swift
//  Zpzg
//
//  Created by 이서준 on 2022/06/30.
//

import UIKit

struct Metric {
    static let deviceSize: CGSize = UIScreen.main.bounds.size
    static let ticketHeight: CGFloat = 200
    static let calendarTicketWidth: CGFloat = 60
    static let contentTicketWidth: CGFloat = deviceSize.width - calendarTicketWidth
}
