//
//  EntryTableViewCell.swift
//  Journal
//
//  Created by Clean Mac on 8/5/20.
//  Copyright © 2020 LambdaStudent. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {

    //MARK: - Properties
    
    static let reuseIdentifier = "EntryCell"
    
    var entry: Entry? {
        didSet {
            updateViews()
        }
    }
    //MARK: - IBOutlets
    @IBOutlet weak var entryTitleLabel: UILabel!
    @IBOutlet weak var entryDateLabel: UILabel!
    @IBOutlet weak var entryBodyLabel: UILabel!
    
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy, HH:mm"
        return dateFormatter
    }()
    
    //MARK: - Actions
   
    private func updateViews() {
        guard let entry = entry else { return }
        //TODO: Figure out if this is correct way to unwrap date
        entryDateLabel.text = self.dateFormatter.string(from: entry.timestamp!)
        entryTitleLabel.text = entry.title
        entryBodyLabel.text = entry.bodyText
        
    }
}

