//
//  BeerCell.swift
//  Beer
//
//  Created by Ian Pablo on 18/01/21.
//

import UIKit

class BeerCell: UITableViewCell {

  
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var ivImage_url: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbIbv: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewCell.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
 
    func update(_ beer: BeerModel){

        ivImage_url.loadImage(beer.image_url)
        lbTitle.text = beer.name
        lbIbv.text = "\(beer.alcohol)% vol."

    }

}
