//
//  nomAlcanos.swift
//  QuimiNet
//
//  Created by Lizzy Cruz on 16/04/16.
//  Copyright © 2016 Lizzy Cruz. All rights reserved.
//

import UIKit

class nomAlcanos: NSObject {
    
    func sacarNombreSencilla(cantMol: Int) -> String {
        var nombre :String = ""
        
        switch cantMol {
        case 1:
            nombre += "met"
        case 2:
            nombre += "et"
        case 3:
            nombre += "prop"
        case 4:
            nombre += "but"
        case 5:
            nombre += "pent"
        case 6:
            nombre += "hex"
        case 7:
            nombre += "hept"
        case 8:
            nombre += "oct"
        case 9:
            nombre += "non"
        case 10:
            nombre += "dec"
        case 11:
            nombre += "undec"
        case 12:
            nombre += "duodec"
        default:
            nombre += "ano"
        }
        nombre += "ano"
        
        
        return nombre
    }
    
}

