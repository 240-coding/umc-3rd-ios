//
//  ViewController.swift
//  Week3
//
//  Created by 이서영 on 2022/10/08.
//

import UIKit

enum Calculation: String {
    case add = "+"
    case sub = "-"
    case mul = "*"
    case div = "/"
}

class ViewController: UIViewController {
    
    @IBOutlet var firstTextField: UITextField!
    @IBOutlet var secondTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        presentSecondViewController(type: .add)
    }
    
    @IBAction func subButtonTapped(_ sender: Any) {
        presentSecondViewController(type: .sub)
    }
    
    @IBAction func mulButtonTapped(_ sender: Any) {
        presentSecondViewController(type: .mul)

    }
    
    @IBAction func divButtonTapped(_ sender: Any) {
        presentSecondViewController(type: .div)
    }
    
    
    func presentSecondViewController(type: Calculation) {
        guard let secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
            return
        }
        secondViewController.result = calculate(type: type)
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    func calculate(type: Calculation) -> String {
        guard let firstText = firstTextField.text else {
            return ""
        }
        guard let secondText = secondTextField.text else {
            return ""
        }
        
        guard let firstNumber = Double(firstText) else {
            return ""
        }
        guard let secondNumber = Double(secondText) else {
            return ""
        }
        
        var result: Double = 0
        
        switch type {
        case .add:
            result = firstNumber + secondNumber
        case .sub:
            result = firstNumber - secondNumber
        case .mul:
            result = firstNumber * secondNumber
        case .div:
            if secondNumber == 0 {
                return "0으로는 나눌 수 없어요!"
            } else {
                result = firstNumber / secondNumber
            }
        }
        
        return "\(firstNumber) \(type.rawValue) \(secondNumber) = \(result) 입니다"
    }

}

