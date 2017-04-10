//
//  HistoryTableViewController.swift
//  IMGExifViewer
//
//  Created by Karel on 27/02/2017.
//  Copyright © 2017 Karel. All rights reserved.
//

import UIKit

public var elements: [HistoryElement] = []

class HistoryTableViewController: UITableViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
    
    }
    
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "tvc") as! DetailsViewController
        vc.toSend1 = arrCellData1
        vc.toSend2 = arrCellData2
        vc.toSend3 = arrCellData3
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(vc, animated: true)

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return elements.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        
        cell.imageView?.image = elements[indexPath.row].GetImage()
        cell.textLabel?.text = elements[indexPath.row].dte
        cell.detailTextLabel?.text = elements[indexPath.row].res
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        cell.imageView?.isUserInteractionEnabled = true
        cell.imageView?.addGestureRecognizer(tapGestureRecognizer)
        
        
        return cell
    }
    
    
 
    @IBOutlet var lbl2: UILabel!

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

protocol ImageElement {

    func GetImage() -> UIImage
}

public class HistoryElement: ImageElement{

    var url: URL?
    var res: String = ""
    var dte: String = ""
    
    init(lnk: URL?, resolution: String, date: String){
        url = lnk
        res = resolution
        dte = date
    }
    
    func GetImage() -> UIImage{
        var imgCI = CIImage(contentsOf: url!)
        return UIImage(ciImage: imgCI!)
    }
    
    
}
