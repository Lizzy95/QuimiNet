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
    
    
    
    func sacarNombreRamifi(arRami: [Ramificaciones], arrMole: [Elementos]) -> String {
        
        var nomMolecula: String = ""
        var auxCadena: [Elementos] = []
        var cont :Int = 0
        var auxCadenaLarga: [[Elementos]] = []
        var posRamifi: [Int] = []
        var cadeLarga : Int = 0
        for i in 0...arrMole.count-1{
            print(arrMole[i])
        }
        print("sale")
        for i in 0...arrMole.count-1 {
            if arrMole[i].nomMolecula == "Ram" {
                posRamifi.append(i)
            }
        }
        
        //cadena principal
        for pos1 in 0...posRamifi[0]-1{
            var auxElementos = Elementos(nom: arrMole[pos1].nomMolecula, num: arrMole[pos1].numElem)
            auxCadena.append(auxElementos)
        }
        auxCadenaLarga.append(auxCadena)
        auxCadena = []
        for cant in 0...arRami.count-1 {
            var posEl = arRami[cant].numElem-1
            print("otravez",posEl)
            // Hace un append de la cadena desde su ramificacion hasta donde termina la cadena principal.
            for posi in posEl...posRamifi[0]-1 {
                print(arrMole[posi])
                var auxElementos = Elementos(nom: arrMole[posi].nomMolecula, num: arrMole[posi].numElem)
                auxCadena.append(auxElementos)
            }
            if cant >=  posRamifi.count-1 {
                print("otro",cant)
                //hace el appen de su ramificacion correspondiente, de donde comienza hasta donde termina la cadena
                for pos3 in posRamifi[cant]+1...arrMole.count-1 {
                    //auxCadena.append(arrMole[pos3])
                    var auxElementos = Elementos(nom: arrMole[pos3].nomMolecula, num: arrMole[pos3].numElem)
                    auxCadena.insert(auxElementos, atIndex: 0)
                }
            }
            else{
                print("dde",cant)
                 //hace el appen de su ramificacion correspondiente, de donde comienza a donde empieza la otra ramificacion.
                for pos2 in posRamifi[cant]+1...posRamifi[cant+1]-1{
                    //auxCadena.append(arrMole[pos2])
                    var auxElementos = Elementos(nom: arrMole[pos2].nomMolecula, num: arrMole[pos2].numElem)
                    auxCadena.insert(auxElementos, atIndex: 0)
                }
            }
            
            auxCadenaLarga.append(auxCadena)
            auxCadena = []
        }
        
        //parte inversa de las ramifiaciones
        for cant in 0...arRami.count-1 {
            var posEl = arRami[cant].numElem-1
            print("otravez",posEl)
            // Hace un append de la cadena desde su ramificacion hasta donde termina la cadena principal.
            for posi in 0...posEl {
                print(arrMole[posi])
                //auxCadena.append(arrMole[posi])
                var auxElementos = Elementos(nom: arrMole[posi].nomMolecula, num: arrMole[posi].numElem)
                auxCadena.insert(auxElementos, atIndex: 0)
            }
            if cant >=  posRamifi.count-1 {
                print("otro",cant)
                //hace el appen de su ramificacion correspondiente, de donde comienza hasta donde termina la cadena
                for pos3 in posRamifi[cant]+1...arrMole.count-1 {
                    //auxCadena.append(arrMole[pos3])
                    var auxElementos = Elementos(nom: arrMole[pos3].nomMolecula, num: arrMole[pos3].numElem)
                    auxCadena.insert(auxElementos, atIndex: 0)
                }
            }
            else{
                print("dde",cant)
                //hace el appen de su ramificacion correspondiente, de donde comienza a donde empieza la otra ramificacion.
                for pos2 in posRamifi[cant]+1...posRamifi[cant+1]-1{
                    //auxCadena.append(arrMole[pos2])
                    var auxElementos = Elementos(nom: arrMole[pos2].nomMolecula, num: arrMole[pos2].numElem)
                    auxCadena.insert(auxElementos, atIndex: 0)
                }
            }
            
            auxCadenaLarga.append(auxCadena)
            auxCadena = []
        }
        
        for auxi in auxCadenaLarga {
            auxCadena = auxi
            for aux in 0...auxCadena.count-1 {
                print("sale", auxCadena[aux].nomMolecula)
                print(auxCadena[aux].numElem)
            }
        }
        
        //sacar cadena mas larga
        cadeLarga = cadenaLarga(auxCadenaLarga)
        nomMolecula = sacarNombreSencilla(auxCadenaLarga[cadeLarga].count)
        
        return nomMolecula
    }
    
    func cadenaLarga(caden: [[Elementos]])->Int{
        var posi: Int = 0
        var aux: Int = 0
        for elem in 0...caden.count-1{
            print("entra",posi)
            if aux < caden[elem].count {
                print(caden[elem].count)
                posi = elem
                aux = caden[elem].count
            }
        }
        return posi
    }
}

