//
//  PlayerSoccer.swift
//  BluffMarket
//
//  Created by MacAMD on 4/7/21.
//

import Foundation

struct PlayerSoccer {
    
    // MARK: - Propiedades del Struct -
    var imagePlayer: String? // -> Imagen del jugador
    var name: String // -> Nombre del jugador
    var teamLocal: String? // -> Imagen del equipo actual
    var teamDestination: String? // -> Imagen del equipo destino
    var probability: Float = 0.0 // -> Probabilidad de fichaje
    var teamLocalSoccer: String? // -> Imagen probabilidad up o down
    var transfer: Float = 0.0 // Dinero del Transfer.
    var description: String?
}

typealias PlayerSoccers = [PlayerSoccer]

extension Float {
    
    func stringFormatMoney() -> String {
            let value = Float(self)
            let format = NumberFormatter()
            format.numberStyle = .decimal
            format.decimalSeparator = ","
            format.groupingSeparator = "."
            if let stringFormat = format.string(from: NSNumber(value: value)){
                return stringFormat + " €"
            } else {
                return ""
            }
       
        }
}
