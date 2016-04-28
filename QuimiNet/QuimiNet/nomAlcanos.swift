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
    
    func sacarNombreRam(cantMol: Int) -> String {
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
        nombre += "il"
        
        
        return nombre
    }
    
    func sacarNombreRamifi(arRami: [Ramificaciones], arrMole: [Elementos]) -> String {
        
        var nomMolecula: String = ""
        var auxCadena: [Elementos] = []
        var cont :Int = 0
        var faltan : Int = 0
        var auxCadenaLarga: [[Elementos]] = []
        var posRamifi: [Int] = []
        var cadeLarga : Int = 0
        var nuevaMole: [Elementos] = []

        for i in 0...arRami.count-1 {
            print(arRami[i].nomMolecula," ",arRami[i].numElem)
        }
        print("sale")
        for i in 0...arrMole.count-1 {
            if arrMole[i].nomMolecula == "Ram" {
                posRamifi.append(i)
            }
        }
        
        for i in 0...arrMole.count-1{
            print("guarda",arrMole[i].nomMolecula)
        }
        
        //cadena principal
        for pos1 in 0...posRamifi[0]-1{
            var auxElementos = Elementos(nom: arrMole[pos1].nomMolecula, num: arrMole[pos1].numElem, idP: arrMole[pos1].idPadre, hij: arrMole[pos1].numHijos)
            auxCadena.append(auxElementos)
        }
        auxCadenaLarga.append(auxCadena)
        auxCadena = []
        for cant in 0...arRami.count-1 {
            var posEl = arRami[cant].numElem-1
            // Hace un append de la cadena desde su ramificacion hasta donde termina la cadena principal.
            for posi in posEl...posRamifi[0]-1 {
                print(arrMole[posi])
                var auxElementos = Elementos(nom: arrMole[posi].nomMolecula, num: arrMole[posi].numElem, idP: arrMole[posi].idPadre, hij: arrMole[posi].numHijos)
                auxCadena.append(auxElementos)
            }
            if cant >=  posRamifi.count-1 {
                //hace el appen de su ramificacion correspondiente, de donde comienza hasta donde termina la cadena
                for pos3 in posRamifi[cant]+1...arrMole.count-1 {
                    //auxCadena.append(arrMole[pos3])
                    var auxElementos = Elementos(nom: arrMole[pos3].nomMolecula, num: arrMole[pos3].numElem, idP: arrMole[pos3].idPadre, hij: arrMole[pos3].numHijos)
                    auxCadena.insert(auxElementos, atIndex: 0)
                }
            }
            else{
                //hace el appen de su ramificacion correspondiente, de donde comienza a donde empieza la otra ramificacion.
                for pos2 in posRamifi[cant]+1...posRamifi[cant+1]-1{
                    //auxCadena.append(arrMole[pos2])
                    var auxElementos = Elementos(nom: arrMole[pos2].nomMolecula, num: arrMole[pos2].numElem, idP: arrMole[pos2].idPadre, hij: arrMole[pos2].numHijos)
                    auxCadena.insert(auxElementos, atIndex: 0)
                }
            }
            
            auxCadenaLarga.append(auxCadena)
            auxCadena = []
        }
        
        //parte inversa de las ramifiaciones
        for cant in 0...arRami.count-1 {
            var posEl = arRami[cant].numElem-1
            // Hace un append de la cadena desde su ramificacion hasta donde termina la cadena principal.
            for posi in 0...posEl {
                print(arrMole[posi])
                //auxCadena.append(arrMole[posi])
                var auxElementos = Elementos(nom: arrMole[posi].nomMolecula, num: arrMole[posi].numElem, idP: arrMole[posi].idPadre, hij: arrMole[posi].numHijos)
                auxCadena.insert(auxElementos, atIndex: 0)
            }
            if cant >=  posRamifi.count-1 {
                //hace el appen de su ramificacion correspondiente, de donde comienza hasta donde termina la cadena
                for pos3 in posRamifi[cant]+1...arrMole.count-1 {
                    //auxCadena.append(arrMole[pos3])
                    var auxElementos = Elementos(nom: arrMole[pos3].nomMolecula, num: arrMole[pos3].numElem,idP: arrMole[pos3].idPadre, hij: arrMole[pos3].numHijos)
                    auxCadena.insert(auxElementos, atIndex: 0)
                }
            }
            else{
                //hace el appen de su ramificacion correspondiente, de donde comienza a donde empieza la otra ramificacion.
                for pos2 in posRamifi[cant]+1...posRamifi[cant+1]-1{
                    //auxCadena.append(arrMole[pos2])
                    var auxElementos = Elementos(nom: arrMole[pos2].nomMolecula, num: arrMole[pos2].numElem, idP: arrMole[pos2].idPadre, hij: arrMole[pos2].numHijos)
                    auxCadena.insert(auxElementos, atIndex: 0)
                }
            }
            
            auxCadenaLarga.append(auxCadena)
            auxCadena = []
        }
        
        for auxi in auxCadenaLarga {
            print("entra una vez")
            auxCadena = auxi
            for aux in 0...auxCadena.count-1 {
                print("sale", auxCadena[aux].nomMolecula, " ", auxCadena[aux].numElem)
               // print(auxCadena[aux].numElem)
            }
        }
        
        //sacar cadena mas larga
        cadeLarga = cadenaLarga(auxCadenaLarga)
        nomMolecula = sacarNombreSencilla(auxCadenaLarga[cadeLarga].count)
        nuevaMole = auxCadenaLarga[cadeLarga]
        var auxPadre : Int = 0
        if (arrMole.count-arRami.count) > nuevaMole.count {
            faltan = (arrMole.count-arRami.count) - nuevaMole.count
            while faltan > 0 {
                for i in 0...arrMole.count-1{
                    if arrMole[i].nomMolecula != "Ram" {
                        if !buscar(arrMole[i].numElem, caden: nuevaMole){
                            if (arrMole[i].idPadre == -1) && (arrMole[i].numElem == 0){
                                arrMole[i].idPadre = arrMole[i].numElem + 1
                                auxPadre = buscarPadre(arrMole[i].idPadre, caden: nuevaMole)
                                nuevaMole[auxPadre].numHijos += 1
                                faltan -= 1
                            }
                            else if arrMole[i].idPadre == -1 {
                                if arrMole[i-1].idPadre == -1{
                                    arrMole[i].idPadre = arrMole[i].numElem + 1
                                    auxPadre = buscarPadre(arrMole[i].idPadre, caden: nuevaMole)
                                    nuevaMole[auxPadre].numHijos += 1
                                    faltan -= 1
                                }
                                else {
                                    arrMole[i].idPadre = arrMole[i-1].idPadre
                                    auxPadre = buscarPadre(arrMole[i].idPadre, caden: nuevaMole)
                                    nuevaMole[auxPadre].numHijos += 1
                                    faltan -= 1
                                }
                            }
                            else {
                                auxPadre = buscarPadre(arrMole[i].idPadre, caden: nuevaMole)
                                nuevaMole[auxPadre].numHijos += 1
                                faltan -= 1
                            }
                        }
                    }
                    
                }
                
            }
            
        }
        
        for i in 0...nuevaMole.count-1{
            print(nuevaMole[i].nomMolecula," ",nuevaMole[i].idPadre," ",nuevaMole[i].numHijos,"id elem",nuevaMole[i].numElem)
        }
         // para saber el nombre de las ramificaciones una vez que ya sabemos quienes tienen hijos y cuantos hijos tienen.
        var aux : Int = 0
        var auxNom: String  = ""
        var cadenaRami : [[String]] = []
     
        aux = (nuevaMole.count-1) / 2
        
        for j in 0...nuevaMole.count-1{
            print("entra",j," ",nuevaMole[j].nomMolecula)
            if nuevaMole[j].numHijos > 0 {
                if j <= aux {
                    auxNom += "\(j+1)" + "-" + sacarNombreRam(nuevaMole[j].numHijos)
                    print("entra2",j," ",nuevaMole[j].nomMolecula)
                }
                else{
                    auxNom += "\((nuevaMole.count-j)+1)" + "-" + sacarNombreRam(nuevaMole[j].numHijos)
                }
            }
        }
        
        
        return (auxNom + "-" + nomMolecula)
    }
    func buscarPadre(numElem : Int, caden: [Elementos]) -> Int{
        for i in 0...caden.count-1{
            if caden[i].numElem == numElem {
                return i
            }
        }
        return -1
    }
    
    func buscar(numElem : Int, caden:[Elementos]) -> Bool{
        for i in 0...caden.count-1{
            if caden[i].numElem == numElem {
                return true
            }
        }
        return false
    }
    
    func cadenaLarga(caden: [[Elementos]])->Int{
        var posi: Int = 0
        var aux: Int = 0
        for elem in 0...caden.count-1{
           //
         //   print("entra",posi)
            if aux < caden[elem].count {
      //          print(caden[elem].count)
                posi = elem
                aux = caden[elem].count
            }
        }
        return posi
    }
}

