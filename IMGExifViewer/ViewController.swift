import UIKit
//
//  ViewController.swift
//  test2
//
//  Created by Karel on 02/12/2016.
//  Copyright © 2016 Karel. All rights reserved.
//

import UIKit
import Photos
import Foundation


var arrCellData1 = [(cell: String, text: String)]()
var arrCellData2 = [(cell: String, text: String)]()
var arrCellData3 = [(cell: String, text: String)]()



class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    public struct cellData{
        let cell: String!
        let text: String!
    }
    
    @IBOutlet var lblIMG: UILabel!
    
    
    var imagePicker = UIImagePickerController()
    

    override func viewDidLoad() {
        lblIMG.adjustsFontSizeToFitWidth = true
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "ocean2.jpg")!)
    }
    
    
    
    @IBAction func btnClicked() {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.savedPhotosAlbum){
            
                        imagePicker.delegate = self
                        imagePicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum;
                        imagePicker.allowsEditing = false
            
                        self.present(imagePicker, animated: true, completion: nil)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var data: String
        if (segue.identifier == "push"){
            
        }
        //(segue.destination as! DetailsViewController).arrCellData1 = self.arrCellData1
    }
    
  
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let urlAsset = info[UIImagePickerControllerReferenceURL] as! URL
        let result = PHAsset.fetchAssets(withALAssetURLs: [urlAsset], options: nil)
        
        let image = result.firstObject
        image?.requestContentEditingInput(with: nil, completionHandler: { contentEditingInput, info in
            let url = contentEditingInput?.fullSizeImageURL
            let inputImage = CIImage(contentsOf: url!)!
            
            arrCellData1.removeAll()
            arrCellData2.removeAll()
            arrCellData3.removeAll()
            
            
            let pixelWidth  = inputImage.properties["PixelWidth"] as! Int
            arrCellData1.append((cell: "PixelWidth", text: "\(pixelWidth)"))
            
            let pixelHeight = inputImage.properties["PixelHeight"] as! Int
            arrCellData1.append((cell: "PixelHeight", text: "\(pixelHeight)"))
            
            let orientation = inputImage.properties["Orientation"] as! Int
            arrCellData2.append((cell: "Orientation", text: "\(orientation)"))
            
            let profileName = inputImage.properties["ProfileName"] as! String
            arrCellData2.append((cell: "ProfileName", text: "\(profileName)"))
            
            let colorModel  = inputImage.properties["ColorModel"] as! String
            arrCellData3.append((cell: "ColorModel", text: "\(colorModel)"))
            
            let dpiWidth    = inputImage.properties["DPIWidth"] as! Int
            arrCellData3.append((cell: "DPIWidth", text: "\(dpiWidth)"))
            
            let dpiHeight   = inputImage.properties["DPIHeight"] as! Int
            arrCellData3.append((cell: "DPIHeight", text: "\(dpiHeight)"))
            
            let depth       = inputImage.properties["Depth"] as! Int
            arrCellData3.append((cell: "Depth", text: "\(depth)"))
            
            print(inputImage.properties["{Exif}"])
            let exif = inputImage.properties["{Exif}"] as! NSDictionary
            let dateOrig = exif.value(forKey: "DateTimeOriginal") as! NSString
            
            //let date = NSDate()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy:MM:dd HH:mm:ss"
            let dateFromString = dateFormatter.date(from: dateOrig as String)
            let dateFormatter2 = DateFormatter()
            dateFormatter2.dateFormat = "dd/MM/yyyy"
            let stringDate = dateFormatter2.string(from: dateFromString!)
            
            arrCellData1.append((cell: "Original Date and Time", text: "\(dateOrig)"))
            
            
            //Source: http://stackoverflow.com/questions/25665122/how-to-search-an-array-containing-struct-elements-in-swift
            if elements.filter({ $0.url == url}).count == 0
            {
            elements.append(HistoryElement(lnk: url, resolution: "\(inputImage.properties["PixelWidth"]!) x \(inputImage.properties["PixelHeight"]!)", date: "\(stringDate)"))
            }
            
            print(inputImage.properties["{GPS}"])
            print(inputImage.properties["{TIFF}"])
            print(inputImage.properties["{IPTC}"])
            print(inputImage.properties["{JFIF}"])
            
            
            
            
        
        self.dismiss(animated: true, completion: nil)
        
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "tvc") as! DetailsViewController
        vc.toSend1 = arrCellData1
        vc.toSend2 = arrCellData2
        vc.toSend3 = arrCellData3
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(vc, animated: true)
})
    }
    

        

    }






