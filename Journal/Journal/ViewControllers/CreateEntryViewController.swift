//
//  ViewController.swift
//  Journal
//
//  Created by Clean Mac on 8/5/20.
//  Copyright © 2020 LambdaStudent. All rights reserved.
//

import UIKit

class CreateEntryViewController: UIViewController {
    //MARK: - Properties
    
    
    //MARK: - Outlets
    @IBOutlet weak var entryBodyTextView: UITextView!    
    @IBOutlet weak var entryTitleTextField: UITextField!
    @IBOutlet weak var segmantedControl: UISegmentedControl!
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        guard let title = entryTitleTextField.text,
            !title.isEmpty else { return }
        
        guard let bodyText = entryBodyTextView.text,
            !bodyText.isEmpty else { return }
        
        let timestamp = Date()
        
        let uuid = UUID()
        let identifier: String = "\(uuid)"
        
        Entry(title: title, bodyText: bodyText, timestamp: timestamp, identifier: identifier)
        do {
            try CoreDataStack.shared.mainContext.save()
            navigationController?.dismiss(animated: true, completion: nil)
        } catch {
            NSLog("error saving managed object context \(error)")
        }
        
    }
}
