//
//  BeerTests.swift
//  BeerTests
//
//  Created by Ian Pablo on 20/01/21.
//
import RxSwift
import XCTest
import RxBlocking
@testable import Beer

class BeerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testValues(){
        let beer = BeerModel(id: 10, name: "Skol", tagline: "Redonda", image_url: "skol.jpg", description: "Desce Redonda", abv: 2.2, attenuation_level: 2.2)
        
        let beerViewModel = DetailBeerViewModel(beer: beer)
        
        XCTAssertEqual(beer.name, "Skol")
        XCTAssertEqual(beer.alcohol, "2.2")
        XCTAssertEqual(beer.tagline, beerViewModel.beerInfo.tagline)
    }
}
