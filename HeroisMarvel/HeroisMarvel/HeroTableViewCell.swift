//
//  HeroTableViewCell.swift
//  HeroisMarvel
//
//  Created by Vinicius Loss on 02/03/23.
//  Copyright © 2023 Eric Brito. All rights reserved.
//

import UIKit
import Kingfisher // Para acessar metodos da dependencia que foi importada ao projeto.

class HeroTableViewCell: UITableViewCell {

    @IBOutlet weak var ivThumb: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepareCell(with hero: Hero){
        lbName.text = hero.name
        lbDescription.text = hero.description

        if let url = URL(string: hero.thumbnail.url){
            ivThumb.kf.indicatorType = .activity
            ivThumb.kf.setImage(with: url) // Utilizando Kingfisher para fazer download da image
        } else {
            ivThumb.image = nil
        }
        
        ivThumb.layer.cornerRadius = ivThumb.frame.height/2
        ivThumb.layer.borderColor = UIColor.red.cgColor
        ivThumb.layer.borderWidth = 2
    }

}
