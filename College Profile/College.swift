//
//  College.swift
//  College Profile
//
//  Created by Garrett Haufschild on 1/20/16.
//  Copyright © 2016 Swag Productions. All rights reserved.
//

import UIKit

class College: NSObject {
    
    var name: String = ""
    var location: String = ""
    var website: String = ""
    var colors: String = ""
    var act: Int = 0
    var enrollment: Int = 0
    var image = UIImage(named: "Default")
    
    convenience  init(name: String)
    {
        self.init()
        self.name = name
    }
    
    convenience init(name: String, location: String, website: String, colors: String, act: Int, enrollment: Int, image: UIImage)
    {
        self.init()
        self.name = name
        self.location = location
        self.website = website
        self.colors = colors
        self.act = act
        self.enrollment = enrollment
        self.image = image
    }

}
