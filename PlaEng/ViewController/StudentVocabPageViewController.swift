//
//  StudentVocabPageViewController.swift
//  PlaEng
//
//  Created by Ryan Kim on 9/9/15.
//  Copyright (c) 2015 RKProduction. All rights reserved.
//

import UIKit
import Parse

class StudentVocabPageViewController: UIViewController {
    
    var chapters : [Chapter] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let chapterQuery = PFQuery(className: "Chapter")
        chapterQuery.whereKey("fromUser", equalTo:PFUser.currentUser()!)
        
        chapterQuery.findObjectsInBackgroundWithBlock {(result: [AnyObject]?, error: NSError?) -> Void in
            // 8
            self.chapters = result as? [Chapter] ?? []
            println(self.chapters)
            self.tableView.reloadData()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: TableView
    //    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
    //        forRowAtIndexPath indexPath: NSIndexPath) {
    //            TipInCellAnimator.animate(cell)
    //    }
    
}

extension StudentVocabPageViewController: UITableViewDataSource {
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return chapters.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("CardCell") as! CardCell
        cell.mainView.layer.cornerRadius = 10
        cell.mainView.layer.masksToBounds = true
        var imageData = chapters[indexPath.row].imageFile
//        cell.videoImage.image = UIImage(data: imageData)
        if chapters.count != 0 {
        cell.nameLabel.text = chapters[indexPath.row].videoName
        }
        
        return cell
    }
    
}

extension StudentVocabPageViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath)
    {
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 300
    }
   
}




