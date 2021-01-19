//
//  BeerDetailViewModel.swift
//  Beer
//
//  Created by Ian Pablo on 19/01/21.
//

import Foundation

struct BeerDetailViewModel {
    
    var coordinator: BeerDetailCoordinator?
    
//    let beer: BeerDetailViewModel
////
////    var beerDetail: BeerDetailViewModel{
////        return beer
////    }
//
//    
//    init(beer: BeerDetailViewModel) {
//        self.beer = beer
//    }
    
    func viewDidDisappear() {
        coordinator?.didFinish()
    }
}
