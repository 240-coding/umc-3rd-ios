//
//  SecondViewController.swift
//  Week3
//
//  Created by 이서영 on 2022/10/08.
//

import UIKit

class SecondViewController: UIViewController {
    
    var result: String?
    
    @IBOutlet var resultLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
