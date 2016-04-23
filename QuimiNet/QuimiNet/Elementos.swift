//
//  Elementos.swift
//  QuimiNet
//
//  Created by Lizzy Cruz on 23/04/16.
//  Copyright © 2016 Lizzy Cruz. All rights reserved.
//

import UIKit

class Elementos: NSObject {
    var nomMolecula : String  = ""
    var numElem : Int = 0
    
    init(nom : String, num : Int){
        nomMolecula = nom
        numElem = num
    }
}
