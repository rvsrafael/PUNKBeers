//
//  Beer.swift
//  RM30950
//
//  Created by Rafael Valverde on 26/11/17.
//  Copyright © 2017 PUNKBeers. All rights reserved.
//

import Foundation

class Beer {
    var imageURL: String?
    var name: String?
    var tagline: String?
    var alcoholByVolume: Double?
    var internationalBitternessUnits: Double?
    var description: String
    
    init(imageURL: String, name: String, tagline: String, abv: Double, ibu: Double, description: String ) {
        self.imageURL = imageURL
        self.name = name
        self.tagline = tagline
        self.alcoholByVolume = abv
        self.internationalBitternessUnits = ibu
        self.description = description
    }
}
