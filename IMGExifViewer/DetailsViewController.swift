//
//  DetailsViewController.swift
//  test2
//
//  Created by Karel on 20/01/2017.
//  Copyright © 2017 Karel. All rights reserved.
//

import UIKit
import Photos


class DetailsViewController: UITableViewController
{

    var toSend = [(String, String)]()
    //var exif: [String] = []
    
    
    @IBOutlet var tableView1: UITableView!
    
    
        public override func	tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        var countRow = 0
//        if section == 0 {
//            countRow = 1
//        }
//        if section == 1 {
//            countRow = 1
//        }
//        if section == 2 {
//            countRow = 1
//        }
        return 8
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: .default, reuseIdentifier: "test id")
        cell.textLabel?.text = toSend[indexPath.row].0 + ": " + toSend[indexPath.row].1
        //cell.detailTextLabel?.text = toSend[indexPath.row].1
        return cell
    }
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(toSend)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
