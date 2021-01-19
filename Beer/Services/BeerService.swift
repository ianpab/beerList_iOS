//
//  BeerService.swift
//  Beer
//
//  Created by Ian Pablo on 18/01/21.
//

import Foundation
import Alamofire


class BeerService{
    static let api = BeerService()


    func fetchBeer(pages:Int = 1, onComplete: @escaping ([BeerModel]?) -> Void){
    let page = pages
    let url = "https://api.punkapi.com/v2/beers?page=\(page)&per_page=40"
    print(url)
    
    AF.request(url).responseJSON { (response) in
        guard let data = response.data,
            let beerData = try? JSONDecoder().decode([BeerModel].self, from: data) else {
                onComplete(nil)
                return
        }
        onComplete(beerData)
    }
}
}
