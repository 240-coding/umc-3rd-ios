//
//  SecondViewController.swift
//  Week3
//
//  Created by 이서영 on 2022/10/08.
//

import UIKit

class SecondViewController: UIViewController {
    
    var result: String?
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var resultLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if let result = result {
            resultLabel.text = result
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateImageView()

    }
    
    func animateImageView() {
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.3, options: .repeat) {
            let translation = CGAffineTransform(translationX: 0, y: 10)
            self.imageView.transform = translation
            self.imageView.layoutIfNeeded()
        }
    }
    

    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
