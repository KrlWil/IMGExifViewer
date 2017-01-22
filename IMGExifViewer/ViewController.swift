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

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    public struct cellData{
        let cell: String!
        let text: String!
    }
    
    var arrCellData = [(cell: String, text: String)]()
    
    var imagePicker = UIImagePickerController()
    

    override func viewDidLoad() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "white.jpg")
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    
    
    @IBAction func btnClicked() {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.savedPhotosAlbum){
                        print("Button capture")
            
            
                        imagePicker.delegate = self
                        imagePicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum;
                        imagePicker.allowsEditing = false
            
                        self.present(imagePicker, animated: true, completion: nil)
            
        }
    }
    
  
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let urlAsset = info[UIImagePickerControllerReferenceURL] as! URL
        let result = PHAsset.fetchAssets(withALAssetURLs: [urlAsset], options: nil)
        
        let image = result.firstObject
        image?.requestContentEditingInput(with: nil, completionHandler: { contentEditingInput, info in
            let url = contentEditingInput?.fullSizeImageURL
            let inputImage = CIImage(contentsOf: url!)!
            
            let pixelWidth  = inputImage.properties["PixelWidth"] as! Int
            self.arrCellData.append((cell: "PixelWidth", text: "\(pixelWidth)"))
            
            let pixelHeight = inputImage.properties["PixelHeight"] as! Int
            self.arrCellData.append((cell: "PixelHeight", text: "\(pixelHeight)"))
            
            let orientation = inputImage.properties["Orientation"] as! Int
            self.arrCellData.append((cell: "Orientation", text: "\(orientation)"))
            
            let profileName = inputImage.properties["ProfileName"] as! String
            self.arrCellData.append((cell: "ProfileName", text: "\(profileName)"))
            
            let colorModel  = inputImage.properties["ColorModel"] as! String
            self.arrCellData.append((cell: "ColorModel", text: "\(colorModel)"))
            
            let dpiWidth    = inputImage.properties["DPIWidth"] as! Int
            self.arrCellData.append((cell: "DPIWidth", text: "\(dpiWidth)"))
            
            let dpiHeight   = inputImage.properties["DPIHeight"] as! Int
            self.arrCellData.append((cell: "DPIHeight", text: "\(dpiHeight)"))
            
            let depth       = inputImage.properties["Depth"] as! Int
            self.arrCellData.append((cell: "Depth", text: "\(depth)"))
            
            
            

            
            self.dismiss(animated: true, completion: nil)
            let vc = DetailsViewController()
            vc.toSend = self.arrCellData
            self.present(vc, animated: true, completion: nil)
        })


        

    }
}

