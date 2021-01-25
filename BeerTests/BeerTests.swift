//
//  BeerTests.swift
//  BeerTests
//
//  Created by Ian Pablo on 20/01/21.
//
import XCTest
import RxSwift
import RxTest
import RxBlocking
import RxCocoa

@testable import Beer

class BeerTests: XCTestCase {

    var sut: ListBeerViewModel!
    var scheduler: ConcurrentDispatchQueueScheduler!
    var beer: BeerModel!

    override func setUp() {
      super.setUp()
        sut = ListBeerViewModel()
        scheduler = ConcurrentDispatchQueueScheduler(qos: .default)
        beer = BeerModel(id: 10, name: "Skol", tagline: "Redonda", image_url: "skol.jpg", description: "Desce Redonda", abv: 2.2, attenuation_level: 2.2)
    }

    override func tearDown() {
     sut = nil
    scheduler = nil
        beer = nil
      super.tearDown()
    }
    
    func testBeerIsCorrectWhenReceivingValue() throws{
        let beerObservale = sut.beer.asObservable().subscribeOn(scheduler)
        
        sut.beer.accept([beer])
        
        XCTAssertEqual(try beerObservale.toBlocking(timeout: 1.0).first()?.first?.name, beer.name)
    }

    
    func testDetailBeerReceivingRawValues(){
        
        let beerViewModel = DetailBeerViewModel(beer: beer)
        
        XCTAssertEqual(beer.tagline, beerViewModel.beerInfo.tagline)
    }
}
