//
//  ListBeerViewModel.swift
//  Beer
//
//  Created by Ian Pablo on 20/01/21.
//

import Foundation
import RxSwift
import RxCocoa

class ListBeerViewModel{
    private let disposeBag = DisposeBag()
    // MARK: - Output
    var beer = BehaviorRelay<[BeerModel]>(value: [])

    // MARK: - Init
    private let beerService: BeerServiceProtrocol
    
    init(beerService: BeerServiceProtrocol = BeerService()) {
        self.beerService = beerService
        bindUI()
            }
    
    
    func bindUI() {
        
        let data = beerService.getBeer()
    data
        .observeOn(MainScheduler.instance)
        .bind(to: beer)
        .disposed(by: disposeBag)
    
    }
    
    var cellId: String{
        return "Cell"
    }
    
    var navigationTitle: String{
        return "Beer List"
    }
    

}
