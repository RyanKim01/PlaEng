//
//  TipInCellAnimator.swift
//  PlaEng
//
//  Created by Ryan Kim on 9/10/15.
//  Copyright (c) 2015 RKProduction. All rights reserved.
//

import UIKit

class TipInCellAnimator {
    // placeholder for things to come -- only fades in for now
    class func animate(cell:UITableViewCell) {
        let view = cell.contentView
        view.layer.opacity = 0.1
        UIView.animateWithDuration(1.4) {
            view.layer.opacity = 1
        }
    }
}