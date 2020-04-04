//
//  UITableView+Ext.swift
//  MovieCorn
//
//  Created by Roman Rakhlin on 04.04.2020.
//  Copyright © 2020 Roman Rakhlin. All rights reserved.
//

import UIKit

extension UITableView {
    func isLastVisibleCell(at indexPath: IndexPath) -> Bool {
        guard let lastIndexPath = indexPathsForVisibleRows?.last else {
            return false
        }
        return lastIndexPath == indexPath
    }
}
