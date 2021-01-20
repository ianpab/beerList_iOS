//
//  BeerService.swift
//  Beer
//
//  Created by Ian Pablo on 18/01/21.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

protocol BeerServiceProtrocol {
    func getBeer() -> Observable<[BeerModel]>

}

enum Fail: Error {
  case invalidURL
  case invalidParameter

}

class BeerService: BeerServiceProtrocol{
    
    func getBeer() -> Observable<[BeerModel]> {
        return Observable.create { observer in
            let comps = URLComponents(string: "https://api.punkapi.com/v2/beers?&per_page=60")!
            let stringURL = try! comps.asURL()

            AF.request(stringURL).responseJSON { (response) in
                guard let data = response.data,
                    let json = try? JSONDecoder().decode([BeerModel].self, from: data) else {
                    observer.onError(Fail.invalidParameter)
                return
              }
              observer.onNext(json)
              observer.onCompleted()
            }
            return Disposables.create {
            }

      }
    }
}
