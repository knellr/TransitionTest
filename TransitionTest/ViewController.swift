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
    
    @IBAction func togglePressed(sender: AnyObject) {
        
        flexibleView.height = flexibleView.height == CGFloat(200) ? CGFloat(300) : CGFloat(200)
        UIView.animateWithDuration(0.3) {
            self.flexibleView.layoutIfNeeded()
        }
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
}

class View: UIView
{
    var height = CGFloat(200) {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: height)
    }
}
