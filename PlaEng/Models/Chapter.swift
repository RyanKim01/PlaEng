//
//  Chapter.swift
//  PlaEng
//
//  Created by Ryan Kim on 9/10/15.
//  Copyright (c) 2015 RKProduction. All rights reserved.
//

import Foundation
import Parse

// 1
class Chapter : PFObject, PFSubclassing {
    
    // 2
    @NSManaged var imageFile: PFFile?
    @NSManaged var videoName: String?
    
    
    //MARK: PFSubclassing Protocol
    
    // 3
    static func parseClassName() -> String {
        return "Chapter"
    }
    
    // 4
    override init () {
        super.init()
    }
    
    
}