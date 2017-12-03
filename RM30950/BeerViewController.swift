//
//  BeerViewController.swift
//  RM30950
//
//  Created by Rafael Valverde on 02/12/17.
//  Copyright © 2017 PUNKBeers. All rights reserved.
//

import UIKit
import Kingfisher


class BeerViewController: UIViewController {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbTagline: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbABV: UILabel!
    @IBOutlet weak var lbIBU: UILabel!
    @IBOutlet weak var ivBeer: UIImageView!
    
    var beer: Beer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadBeer()
    }

    func loadBeer() {
        if beer != nil {
            
            let url = ImageResource(downloadURL: URL(string: (beer?.imageURL)!)!, cacheKey: beer?.name)
            let name = beer!.name
            let tagline = beer!.tagline
            let abv = beer!.alcoholByVolume
            let ibu = beer!.internationalBitternessUnits
            let description = beer!.description
            
            ivBeer.kf.setImage(with: url)
            lbName.text = name
            lbTagline.text = tagline
            lbABV.text = String(format: "%.1f", abv!)
            lbIBU.text = String(format: "%.1f", ibu!)
            
            lbDescription.text = description
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
