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


    
    var alcohol: String{
        return String(abv)
    }

    var attenuation: String{
        return String(attenuation_level)
    }
}
