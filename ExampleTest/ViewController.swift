//
//  ViewController.swift
//  ExampleTest
//
//  Created by tran trung thanh on 7/5/17.
//  Copyright © 2017 tran trung thanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {//

    @IBOutlet var image: UIImageView!
    
    @IBOutlet var textInput: UITextField!
    var inactiveQueue: DispatchQueue!
    override func viewDidLoad() {
        super.viewDidLoad()
        let queue = DispatchQueue(label: "thread")
        queue.sync {
            for i in 3..<101
            {
                if i % 3 == 0
                {
                    print("So chia het cho 3: ", i);
                }
            }
        }
        for j in 200..<501
        {
            if j % 5 == 0
            {
                print("So chia het cho 5: ", j);
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        concurrentQueues() // P.A 1
        /*concurrentQueues() // P.A 2
        if let queue = inactiveQueue {
            queue.activate()
        }*/
    }
    
    func concurrentQueues() {
        //let anotherQueue = DispatchQueue(label: "com.appcoda.anotherQueue", qos: .utility) // P.A 1
        let anotherQueue = DispatchQueue(label: "com.appcoda.anotherQueue", qos: .utility, attributes: .concurrent)
        // let anotherQueue = DispatchQueue(label: "com.appcoda.anotherQueue", qos: .utility, attributes: .initiallyInactive)
        /*let anotherQueue = DispatchQueue(label: "com.appcoda.anotherQueue", qos: .userInitiated, attributes: [.concurrent, .initiallyInactive]) // P.A 2
        inactiveQueue = anotherQueue*/
        
        anotherQueue.async {
            for i in 0..<10 {
                print("🔴", i)
            }
        }
        
        
        anotherQueue.async {
            for i in 100..<110 {
                print("🔵", i)
            }
        }
        
        
        anotherQueue.async {
            for i in 1000..<1010 {
                print("⚫️", i)
            }
        }
    }
    @IBAction func btn(_ sender: Any) {
        let imageURL: URL = URL(string: self.textInput.text!)!
        
        (URLSession(configuration: URLSessionConfiguration.default)).dataTask(with: imageURL, completionHandler: { (imageData, response, error) in
            
            if let data = imageData {
                print("Did download image data")
                
                DispatchQueue.main.async {
                    self.image.image = UIImage(data: data)
                }
            }
        }).resume()
    }

}

