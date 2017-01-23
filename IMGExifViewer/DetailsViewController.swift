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

    let sections : [String] = ["General", "Advanced", "Professional"]
    var toSend1 = [(String, String)]()
    var toSend2 = [(String, String)]()
    var toSend3 = [(String, String)]()
    
    init(got1: [(String, String)], got2: [(String, String)], got3: [(String, String)]){
        
        toSend1 = got1
        toSend2 = got2
        toSend3 = got3
        super.init(nibName: nil , bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //var exif: [String] = []
    var sectionData : [Int: [(String, String)]] = [:]
    
    @IBOutlet var tableView1: UITableView!
    
    
        public override func	tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var countRow = 0
        if section == 0 {
            countRow = toSend1.count
        }
        if section == 1 {
            countRow = toSend2.count
        }
        if section == 2 {
            countRow = toSend3.count
        }
        return countRow
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        //cell?.textLabel?.text = toSend1[indexPath.row].0 + ": " + toSend1[indexPath.row].1
        cell?.textLabel?.text = sectionData[indexPath.section]![indexPath.row].0 + ": " + sectionData[indexPath.section]![indexPath.row].1
        
        //cell.detailTextLabel?.text = toSend[indexPath.row].1
        return cell!
    }
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionData = [0:toSend1, 1:toSend2, 2:toSend3]
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
