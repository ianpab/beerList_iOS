//
//  BeerListViewModel.swift
//  Beer
//
//  Created by Ian Pablo on 18/01/21.
//

import Foundation

class BeerListViewModel {
    
    let barTitle = "Beer L"
    let cellId = "Cell"
    var coordinator: BeerListCoordinator?

    
    let id: Int
    let name: String
    let image_url: String
    let alcohol: String


    init(beer: BeerModel) {
        self.id = beer.id
        self.name = beer.name
        self.image_url = beer.image_url
        self.alcohol = beer.alcohol
    }
//    var beer: BeerModel

//    func fetchBeer(){
//        BeerService.api.fetchBeer(pages: 1) { (beer) in
//            if let beer = beer {
//                return beer
//            }
//        }
//    }
    
    func didSelectRow(_ selectedBeer: BeerModel) {
//        let selectBeer = beer
        coordinator?.onSelect(selectedBeer)
    }
    
   
}
