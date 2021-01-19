//
//  BeerDetailViewController.swift
//  Beer
//
//  Created by Ian Pablo on 19/01/21.
//

import UIKit

class BeerDetailViewController: UIViewController {

    
    @IBOutlet weak var ivBackground: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbTagline: UILabel!
    @IBOutlet weak var lbAbv: UILabel!
    @IBOutlet weak var lbIbu: UILabel!
    
    
    var viewModel: BeerDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.ivBackground.image = UIImage(cgImage: )
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }


}
