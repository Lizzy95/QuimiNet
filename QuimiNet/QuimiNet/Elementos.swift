//
//  Elementos.swift
//  QuimiNet
//
//  Created by Lizzy Cruz and Abe Gonzalez on 23/04/16.
//  Copyright © 2016 Lizzy Cruz. All rights reserved.
//

import UIKit

class Elementos: NSObject {
    var nomMolecula : String  = ""
    var numElem : Int = 0
    var idPadre : Int = 0
    var numHijos : Int = 0
    
    /*
     *
     * Metodo init
     *
     * Este metodo inicializa las variables con los datos dados.
     *
     */
    init(nom : String, num : Int, idP : Int, hij : Int){
        nomMolecula = nom
        numElem = num
        idPadre = idP
        numHijos = hij
        
    }
}
