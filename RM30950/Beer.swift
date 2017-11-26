//
//  Beer.swift
//  RM30950
//
//  Created by Rafael Valverde on 26/11/17.
//  Copyright © 2017 PUNKBeers. All rights reserved.
//

import Foundation

class Beer {
    var id: Int
    var name: String
    var abv: Double
    var image_url: String
    
    init(id: Int, name: String, abv: Double, image_url: String) {
        self.id = id
        self.name = name
        self.abv = abv
        self.image_url = image_url
    }
}
