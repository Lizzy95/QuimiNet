//
//  Ramificaciones.swift
//  QuimiNet
//  Clase de tipo de objetos para las ramificaciones.
//  Created by Lizzy Cruz and Abe Gonzalez on 16/04/16.
//  Copyright © 2016 Lizzy Cruz. All rights reserved.
//

import UIKit

class Ramificaciones: NSObject {
    var nomMolecula : String  = ""
    var numElem : Int = 0
    var posY : CGFloat = 0.0
    var posX : CGFloat = 0.0

    /*
     *
     * Metodo init
     *
     * Este metodo inicializa las variables con los datos dados.
     *
     */
    init(nom : String, num : Int, posx : CGFloat, posy : CGFloat){
        nomMolecula = nom
        numElem = num
        posX = posx
        posY = posy
    }

}
