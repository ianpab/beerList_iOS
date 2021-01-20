//
//  DetailBeerViewModel.swift
//  Beer
//
//  Created by Ian Pablo on 20/01/21.
//


import Foundation
import RxSwift
import RxCocoa

class DetailBeerViewModel{
    
    var beer: BeerModel

    var beerInfo: BeerModel{
        return beer
    }

    init(beer: BeerModel) {
      self.beer = beer

    }
}
