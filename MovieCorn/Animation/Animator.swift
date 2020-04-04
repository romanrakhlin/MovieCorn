//
//  Animator.swift
//  MovieCorn
//
//  Created by Roman Rakhlin on 04.04.2020.
//  Copyright © 2020 Roman Rakhlin. All rights reserved.
//

import UIKit

final class Animator {
    private var hasAnimatedAllCells = false
    private let animation: Animation

    init(animation: @escaping Animation) {
        self.animation = animation
    }

    func animate(cell: UITableViewCell, at indexPath: IndexPath, in tableView: UITableView) {
        guard !hasAnimatedAllCells else {
            return
        }
        
        animation(cell, indexPath, tableView)
        hasAnimatedAllCells = tableView.isLastVisibleCell(at: indexPath)
    }
} 
