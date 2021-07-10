//
//  DeaViewController.swift
//  BluffMarket
//
//  Created by MacAMD on 4/7/21.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: Public properties
    var soccer: PlayerSoccer?
    
    // MARK: IBOutlets
    @IBOutlet weak var imageSoccer: UIImageView!
    @IBOutlet weak var labelNameSoccer: UILabel!
    @IBOutlet weak var labelTeamLocal: UILabel!
    @IBOutlet weak var localTeamImage: UIImageView!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var descriptionView: UITextView!
    
    
    
    
    // MARK: Lifecicle
    override func viewDidLoad() {
        super.viewDidLoad()
        labelNameSoccer.text = soccer?.name
        labelTeamLocal.text = soccer?.teamLocalSoccer
        localTeamImage.image = UIImage(named: soccer?.teamLocal ?? "")
        imageSoccer.image = UIImage(named: soccer?.imagePlayer ?? "")
        descriptionView.text = soccer?.description
        
        background.layer.cornerRadius = 4.0
        background.layer.shadowColor = UIColor.white.cgColor
        background.layer.shadowOffset = CGSize.zero
        background.layer.shadowOpacity = 0.7
        
        navigationController?.navigationBar.barTintColor = UIColor.black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = true // Escondemos la barra de navegación
    }


}
