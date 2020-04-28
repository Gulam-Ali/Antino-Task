//
//  Animatore.swift
//  AntinoLabsTASK
//
//  Created by gulam ali on 28/04/20.
//  Copyright © 2020 gulam ali. All rights reserved.
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
