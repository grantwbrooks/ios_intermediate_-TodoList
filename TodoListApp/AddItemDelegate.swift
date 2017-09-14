//
//  AddItemDelegate.swift
//  TodoListApp
//
//  Created by Grant Brooks on 9/14/17.
//  Copyright © 2017 Grant Brooks. All rights reserved.
//

import Foundation
import UIKit

protocol AddItemDelegate: class {
    func addItem(title: String, body: String, date: Date, done: Bool)
}
