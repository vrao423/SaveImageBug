//
//  ViewController.swift
//  ImageExportBug
//
//  Created by Venkat Rao on 10/14/16.
//  Copyright © 2016 Rao Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var useNSData: UISwitch!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var labelCount: UILabel!
    @IBOutlet weak var sharePressed: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        labelCount.text = "\(stepper.value)"
    }

    @IBAction func stepperChange(_ sender: UIStepper) {
        labelCount.text = "\(sender.value)"
    }

    @IBAction func sharePressed(_ sender: UIButton) {
        
        let image = UIImage.init(named: "wide")
        var items: [NSObject] = []
        
        let data = UIImageJPEGRepresentation(image!, 1.0)

        
        for _ in 1...Int(stepper.value) {
            if useNSData.isOn {
                items.append(data! as NSObject)
            } else {
                items.append(image!)
            }
        }
        
        let activityController = UIActivityViewController(activityItems: items, applicationActivities: nil);
    
        present(activityController, animated: true, completion: nil)
    }
}

