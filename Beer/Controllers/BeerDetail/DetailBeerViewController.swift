//
//  BeerDetailViewController.swift
//  Beer
//
//  Created by Ian Pablo on 19/01/21.
//

import UIKit
import RxSwift
import RxCocoa

class DetailBeerViewController: UIViewController {

    private let bag = DisposeBag()
    fileprivate var viewModel: DetailBeerViewModel!
    fileprivate var navigator: Navigator!
    
    static func createWith(navigator: Navigator, storyboard: UIStoryboard, viewModel: DetailBeerViewModel) -> DetailBeerViewController {
      return storyboard.instantiateViewController(ofType: DetailBeerViewController.self).then { vc in
        vc.navigator = navigator
        vc.viewModel = viewModel
      }
    }
    
    @IBOutlet weak var ivBackground: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbTagline: UILabel!
    @IBOutlet weak var lbAbv: UILabel!
    @IBOutlet weak var lbIbu: UILabel!
    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var lbDescription: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

        
        }
    
    func setupView(){
        lbTitle.text = viewModel.beerInfo.name
        ivBackground.image = UIImage(named: "beer")
        ivBackground.layer.cornerRadius = 35
        lbTagline.text = viewModel.beerInfo.tagline
        lbAbv.text = "\(viewModel.beerInfo.alcohol)% vol."
        lbIbu.text = "\(viewModel.beerInfo.attenuation) Ibu"
        ivPhoto.loadImage(viewModel.beerInfo.image_url)
        lbDescription.text = viewModel.beerInfo.description
    }


}
