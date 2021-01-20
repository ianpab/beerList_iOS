//
//  BeerModel.swift
//  Beer
//
//  Created by Ian Pablo on 18/01/21.
//

import Foundation

struct BeerModel: Codable {
    
    let id: Int
    let name: String
    let tagline: String
    let image_url: String
    let description: String
    let abv: Double
    let attenuation_level: Double
//    let ibu: Double
//
//    init(id: Int, name: String, tagline:String, image_url:String, description:String, abv:Double,atte:Double) {
//        self.id = id
//        self.name = name
//        self.tagline = tagline
//        self.image_url = image_url
//        self.description = description
//        self.abv = abv
//        self.attenuation_level = atte
//    }
//    
    var alcohol: String{
        return String(abv)
    }

    var attenuation: String{
        return String(attenuation_level)
    }
}
