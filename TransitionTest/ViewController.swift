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

    @IBOutlet weak var flexibleView: View!
    
    @IBAction func togglePressed(_ sender: AnyObject) {
        
        
        flexibleView.height = flexibleView.height == CGFloat(200) ? CGFloat(300) : CGFloat(200)
        
        UIView.transition(with: flexibleView,
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
}

class View: UIView
{
    var height = CGFloat(200) {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: height)
    }
}
