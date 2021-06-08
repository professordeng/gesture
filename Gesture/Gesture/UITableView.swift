//
//  UITableView.swift
//  Gesture
//
//  Created by deng on 2021/6/7.
//

import UIKit

extension UITableView {
    func indexPathAtLocation(_ location: CGPoint) -> IndexPath? {
        indexPathsForVisibleRows?.filter {
            rectForRow(at: $0).contains(location)
        }.first
    }

    func sectionAtLocation(_ location: CGPoint) -> UITableViewHeaderFooterView? {
        for section in 0..<numberOfSections
        where rectForHeader(inSection: section).contains(location) {
            return headerView(forSection: section)
        }
        return nil
    }
}
