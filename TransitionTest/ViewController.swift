//
//  ViewController.swift
//  TransitionTest
//
//  Created by Jon Kneller on 03/08/2016.
//  Copyright © 2016 Late Rooms Group. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44
    }

    @IBOutlet weak var containerView: UIView!
    @IBOutlet var bottomConstraint: NSLayoutConstraint!
    @IBOutlet var bottomConstraint2: NSLayoutConstraint!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    @IBAction func togglePressed(sender: AnyObject) {
        
        
        if !self.bottomConstraint.active
        {
            NSLayoutConstraint.activateConstraints([self.bottomConstraint])
            NSLayoutConstraint.deactivateConstraints([self.bottomConstraint2])
            self.view1.hidden = false
            self.view2.hidden = true
        }
        else
        {
            NSLayoutConstraint.deactivateConstraints([self.bottomConstraint])
            NSLayoutConstraint.activateConstraints([self.bottomConstraint2])
            self.view1.hidden = true
            self.view2.hidden = false
        }
        
        UIView.transitionWithView(containerView,
                          duration: 0.3,
                          options: [UIViewAnimationOptions.TransitionCrossDissolve, UIViewAnimationOptions.LayoutSubviews],
                          animations: {
                            
                            self.view.setNeedsLayout()
                            self.view.layoutIfNeeded()
        }, completion: nil)
        
        
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

class View1: UIView
{
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: 200)
    }
}

class View2: UIView
{
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: 100)
    }
}
