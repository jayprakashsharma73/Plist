//
//  ViewController.swift
//  fileManger
//
//  Created by Jay Prakash Sharma on 15/06/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var number: UITextField!
    
    
// variable

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

// Getting url
//        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        if let documentUrl = urls.first
//        {
//        let fileUrl =  documentUrl.appendingPathComponent("data.plist")
//        print(fileUrl)
//        }
//
// File manager - creating directory
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        let docURL = URL(string: documentsDirectory)!
        let dataPath = docURL.appendingPathComponent("data.plist")
        if !FileManager.default.fileExists(atPath: dataPath.path) {
            do {
                try FileManager.default.createDirectory(atPath: dataPath.path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        
// Fetching data from info.plist file
        let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        label.text = appVersion

// Fetching data from data.plist
        let path = Bundle.main.path(forResource: "data", ofType: "plist")!
        let dict = NSDictionary(contentsOfFile: path)
        name.text = dict?.object(forKey: "name") as? String
        address.text = dict?.object(forKey: "address") as? String
        age.text = dict?.object(forKey: "age") as? String
        number.text = dict?.object(forKey: "number") as? String
}
    
// Writing Data in data.plist File
    @IBAction func saveButton(_ sender: Any) {
//        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let documentUrl = urls.first
//        print(documentUrl as Any)
////        let fileUrl =  documentUrl!.appendingPathComponent("data.plist")
//        let datapath = Bundle.main.path(forResource: "data", ofType: "plist")!
//        let dataUrl = NSMutableDictionary(contentsOfFile: datapath)!
////        let url = fileUrl
////        let string = (self.name as! NSDictionary).value(forKey: "name") as! NSDictionary
////        string.write(to: url as URL, atomically: true)
//
//        for key in dataUrl.allKeys{
//            print(key)
//        }
//        dataUrl["name"] = name.text
//        dataUrl["address"] = address.text
//
//        print(dataUrl["name"] as Any)
//        print(dataUrl["address"] as Any)
        
        //write
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        let docURL = URL(string: documentsDirectory)!
        let dataPath = docURL.appendingPathComponent("data.plist")
        if !FileManager.default.fileExists(atPath: dataPath.path) {
            do {
                try FileManager.default.createDirectory(atPath: dataPath.path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error.localizedDescription)
            }
        }
//
        let urls = NSDictionary(contentsOf: dataPath)
        print(urls as Any)
       
        let path = Bundle.main.path(forResource: "data", ofType: "plist")
//        print(path!)
        
        let url = URL(fileURLWithPath: path!)
//        print(url.absoluteString)

        let nameStr = name.text
        let addressStr = address.text
        let ageStr = age.text
        let numberStr = number.text
        
        let dict = NSMutableDictionary()
//        print(dict)
        dict.setValue(nameStr, forKey: "name")
        dict.setValue(addressStr, forKey: "address")
        dict.setValue(ageStr, forKey: "age")
        dict.setValue(numberStr, forKey: "number")

// Writing
        dict.write(to: url, atomically: true)
        label.text = "Data Written"
  }
}

