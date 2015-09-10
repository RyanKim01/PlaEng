//
//  CardCell.swift
//  PlaEng
//
//  Created by Ryan Kim on 9/10/15.
//  Copyright (c) 2015 RKProduction. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {

    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var progressLabel: UILabel!

    var chapter: Chapter? {
        didSet {
            if let chapter = chapter {
                nameLabel.text = chapter.videoName
            }
        }
    }
//    func useMember(chapter:Chapter) {
//        // Round those corners
//        mainView.layer.cornerRadius = 10;
//        mainView.layer.masksToBounds = true;
//        
//        // Fill in the data
//        nameLabel.text = chapter.videoName
////        descriptionLabel.text = chapter.
//        videoImage.image = UIImage(data: chapter.imageFile!)
//        
//        // Fill the buttons and show or hide them
//        webLabel.text = member.web
//           }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    
}
