//
//  ViewController.swift
//  Swift_PHP
//
//  Created by Orazio Conte on 30/09/2019.
//  Copyright © 2019 Orazio Conte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    
    
    @IBAction func send(_ sender: Any) {
        
        //put the link of the php file here. The php file connects the mysql and swift
        let request = NSMutableURLRequest(url: NSURL(string: "http://YOUR FILE PATH")! as URL)
        request.httpMethod = "POST"
        
        let postString = "a=\(name.text!)&b=\(age.text!)"
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print("error=\(String(describing: error))")
                return
            }
            
            print("response = \(String(describing: response))")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(String(describing: responseString))")
        }
        task.resume()
        
        let alertController = UIAlertController(title: "Candidate's Name", message: "Successfully Added", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: nil))
                
        self.present(alertController, animated: true, completion: nil)
        
        age.text = ""
        name.text = ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

