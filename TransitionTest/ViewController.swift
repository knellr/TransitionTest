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
    
    @IBAction func togglePressed(_ sender: AnyObject) {
        
        
        if !self.bottomConstraint.isActive
        {
            NSLayoutConstraint.activate([self.bottomConstraint])
            NSLayoutConstraint.deactivate([self.bottomConstraint2])
            self.view1.isHidden = false
            self.view2.isHidden = true
        }
        else
        {
            NSLayoutConstraint.deactivate([self.bottomConstraint])
            NSLayoutConstraint.activate([self.bottomConstraint2])
            self.view1.isHidden = true
            self.view2.isHidden = false
        }
        
        UIView.transition(with: containerView,
                          duration: 0.3,
                          options: [UIViewAnimationOptions.transitionCrossDissolve, UIViewAnimationOptions.layoutSubviews],
                          animations: {
                            
                            self.view.setNeedsLayout()
                            self.view.layoutIfNeeded()
        }, completion: nil)
        
        
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt heightForRowAtIndexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.layer.borderWidth = 2
        cell.contentView.layer.borderWidth = 2
        cell.contentView.layer.borderColor = UIColor.red.cgColor
        
        return cell
    }
}

class View1: UIView
{
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: 200)
    }
}

class View2: UIView
{
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: 100)
    }
}
