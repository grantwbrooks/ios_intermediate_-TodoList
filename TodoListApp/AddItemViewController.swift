//
//  ViewController.swift
//  TodoListApp
//
//  Created by Grant Brooks on 9/13/17.
//  Copyright © 2017 Grant Brooks. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    @IBAction func touchedDate(_ sender: UIDatePicker) {
        view.endEditing(true)
    }
    
    weak var delegate: AddItemDelegate?
    
    @IBOutlet weak var TitleLabel: UITextField!
    @IBOutlet weak var BodyLabel: UITextView!
    @IBOutlet weak var DateLabel: UIDatePicker!
    
    @IBAction func addItemPressed(_ sender: UIButton) {
        delegate?.addItem(title: TitleLabel.text!, body: BodyLabel.text!, date: DateLabel.date, done: false)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIViewController {
    // be sure to put this function in every viewController viewDidLoad if you want taps outside UIObject to close keyboard
    // on this one I also added a endEditing to the date picker so if you change values on that it closes keyboard.
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.  this can interfere with didSelectRowAtIndexPath so add below line to stop interference.
        //tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

