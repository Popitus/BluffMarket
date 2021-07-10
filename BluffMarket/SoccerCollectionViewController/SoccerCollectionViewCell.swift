//
//  SoccerCollectionViewCell.swift
//  BluffMarket
//
//  Created by MacAMD on 4/7/21.
//

import UIKit

class SoccerCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier: String = String(describing: SoccerCollectionViewCell.self)

    // MARK: IBOutlets
    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var soccerImage: UIImageView!
    @IBOutlet weak var soccerName: UILabel!
    @IBOutlet weak var teamLocalImage: UIImageView!
    @IBOutlet weak var teamHostImage: UIImageView!
    @IBOutlet weak var soccerTransferAmount: UILabel!
    @IBOutlet weak var transferProbabilty: UILabel!
    
    
    override func awakeFromNib() {
        // Se crea la celda
        super.awakeFromNib()
        frontView.layer.cornerRadius = 10.0
        frontView.layer.shadowColor = UIColor.white.cgColor
        frontView.layer.shadowOffset = CGSize.zero
        frontView.layer.shadowOpacity = 0.7
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // Solo cuando se crea la celda tendremos que limpiar los posibles datos para luego pintarlos por pantall
        soccerImage.image = nil
        soccerName.text = nil
        teamLocalImage.image = nil
        teamHostImage.image = nil
        soccerTransferAmount.text = nil
        transferProbabilty.text = nil
    }
    // MARK: - Funciones Publicas
    func updateView(soccerPlayer: PlayerSoccer) {
        update(soccerName: soccerPlayer.name)
        update(soccerImage: soccerPlayer.imagePlayer)
        update(teamLocalImage: soccerPlayer.teamLocal)
        update(teamHostImage: soccerPlayer.teamDestination)
        update(soccerTransfer: soccerPlayer.transfer)
        update(soccerProbabilty: soccerPlayer.probability)
    }
    

    // MARK: - Funciones Privada
    private func update(soccerImage: String?) {
        self.soccerImage.image = UIImage(named: soccerImage ?? "")
    }
    private func update(soccerName: String?) {
        self.soccerName.text = soccerName
    }
    private func update(teamLocalImage: String?) {
        self.teamLocalImage.image = UIImage(named: teamLocalImage ?? "")
    }
    private func update(teamHostImage: String?) {
        self.teamHostImage.image = UIImage(named: teamHostImage ?? "")
    }
    private func update(soccerTransfer: Float) {
        if soccerTransfer == 0.0 {
            self.soccerTransferAmount.text = "Jugador Libre"
        } else {
        self.soccerTransferAmount.text = soccerTransfer.stringFormatMoney()
        }
    }
    private func update(soccerProbabilty: Float) {
        self.transferProbabilty.text = String(format: "%.1f %%" , soccerProbabilty)
    }

    
}
