//
//  ViewController.swift
//  TodoListApp
//
//  Created by Grant Brooks on 9/13/17.
//  Copyright © 2017 Grant Brooks. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

