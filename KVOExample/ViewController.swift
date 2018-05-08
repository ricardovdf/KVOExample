//
//  ViewController.swift
//  KVOExample
//
//  Created by Ricardo V Del Frari on 23/04/2018.
//  Copyright © 2018 Ricardo V Del Frari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonNumberLabel: UILabel!
    @IBOutlet weak var buttonsControl: ButtonsControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Registers the observer object to receive KVO notifications for the key path relative to the object receiving this message.
        buttonsControl.addObserver(self, forKeyPath: #keyPath(ButtonsControl.buttonSelected), options: NSKeyValueObservingOptions.new, context: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: KVO
    //Informs the observing object when the value at the specified key path relative to the observed object has changed.
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let newValue = change?[.newKey] {
            buttonNumberLabel.text = String(describing: newValue)
        }
    }

}

