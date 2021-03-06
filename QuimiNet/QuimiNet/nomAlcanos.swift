//
//  nomAlcanos.swift
//  QuimiNet
//
//  Created by Lizzy Cruz and Abe Gonzalez on 16/04/16.
//  Copyright © 2016 Lizzy Cruz. All rights reserved.
//

import UIKit

class nomAlcanos: NSObject {
    
    /*
     *
     * Metodo sacarNombreSencilla
     *
     *Este metodo se encarga de regresar el nombre de un alcano en una cadena sencilla.
     *
     */
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
    
    /*
     *
     * Metodo sacarNombreRam
     *
     *Este metodo se encarga de regresar el nombre para carbones en las cadenas de ramificaciones.
     *
     */
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
    
    /*
     *
     * Metodo sacarNumeroCadena
     *
     *Este metodo se encarga de regresar el numero de cadenas de ramas o grupos, esto en el caso de que sean iguales.
     *
     */
    func sacarNumeroCadena(cantMol: Int) -> String {
        var nombre :String = ""
        
        switch cantMol {
        case 1:
            nombre += ""
        case 2:
            nombre += "di"
        case 3:
            nombre += "tri"
        case 4:
            nombre += "tetra"
        case 5:
            nombre += "penta"
        case 6:
            nombre += "hexa"
        case 7:
            nombre += "hepta"
        case 8:
            nombre += "octa"
        case 9:
            nombre += "nona"
        case 10:
            nombre += "deca"
        case 11:
            nombre += "undeca"
        case 12:
            nombre += "duodeca"
        default:
            nombre += "ano"
        }
        
        return nombre
    }
    
    
    /*
     *
     * Metodo sacarNombreRamifi
     *
     * Este metodo se encarga de sacar el nombre de la cadena formada con las ramificaciones, primeramente hace los
     * posibles caminos que se pueden seguir en la cadena y escoge la cadena mas larga para de esta sacar su nombre y
     * posteriormente ver sus diferentes ramificaciones con su nombre.
     *
     */
    func sacarNombreRamifi(arRami: [Ramificaciones], arrMole: [Elementos]) -> String {
        
        var nomMolecula: String = ""
        var auxCadena: [Elementos] = []
        var faltan : Int = 0
        var auxCadenaLarga: [[Elementos]] = []
        var posRamifi: [Int] = []
        var cadeLarga : Int = 0
        var nuevaMole: [Elementos] = []

        for i in 0...arrMole.count-1 {
            if arrMole[i].nomMolecula == "Ram" {
                posRamifi.append(i)
            }
        }
        
        //cadena principal
        for pos1 in 0...posRamifi[0]-1{
            let auxElementos = Elementos(nom: arrMole[pos1].nomMolecula, num: arrMole[pos1].numElem, idP: arrMole[pos1].idPadre, hij: arrMole[pos1].numHijos)
            auxCadena.append(auxElementos)
        }
        auxCadenaLarga.append(auxCadena)
        auxCadena = []
        for cant in 0...arRami.count-1 {
            let posEl = buscarPadre(arRami[cant].numElem, caden: arrMole)
            // Hace un append de la cadena desde su ramificacion hasta donde termina la cadena principal.
            if(posEl >  posRamifi[0]-1){
                return "Tienes que rehacer la cadena"
            }
            for posi in posEl...posRamifi[0]-1 {
                let auxElementos = Elementos(nom: arrMole[posi].nomMolecula, num: arrMole[posi].numElem, idP: arrMole[posi].idPadre, hij: arrMole[posi].numHijos)
                auxCadena.append(auxElementos)
            }
            if cant >=  posRamifi.count-1 {
                //hace el appen de su ramificacion correspondiente, de donde comienza hasta donde termina la cadena
                for pos3 in posRamifi[cant]+1...arrMole.count-1 {
                    let auxElementos = Elementos(nom: arrMole[pos3].nomMolecula, num: arrMole[pos3].numElem, idP: arrMole[pos3].idPadre, hij: arrMole[pos3].numHijos)
                    auxCadena.insert(auxElementos, atIndex: 0)
                }
            }
            else{
                //hace el appen de su ramificacion correspondiente, de donde comienza a donde empieza la otra ramificacion.
                for pos2 in posRamifi[cant]+1...posRamifi[cant+1]-1{
                    let auxElementos = Elementos(nom: arrMole[pos2].nomMolecula, num: arrMole[pos2].numElem, idP: arrMole[pos2].idPadre, hij: arrMole[pos2].numHijos)
                    auxCadena.insert(auxElementos, atIndex: 0)
                }
            }
            auxCadenaLarga.append(auxCadena)
            auxCadena = []
        }
        
        //parte inversa de las ramifiaciones
        for cant in 0...arRami.count-1 {
            let posEl = buscarPadre(arRami[cant].numElem, caden: arrMole)
            // Hace un append de la cadena desde su ramificacion hasta donde termina la cadena principal.
            for posi in 0...posEl {
                let auxElementos = Elementos(nom: arrMole[posi].nomMolecula, num: arrMole[posi].numElem, idP: arrMole[posi].idPadre, hij: arrMole[posi].numHijos)
                auxCadena.insert(auxElementos, atIndex: 0)
            }
            if cant >=  posRamifi.count-1 {
                //hace el appen de su ramificacion correspondiente, de donde comienza hasta donde termina la cadena
                for pos3 in posRamifi[cant]+1...arrMole.count-1 {
                    let auxElementos = Elementos(nom: arrMole[pos3].nomMolecula, num: arrMole[pos3].numElem,idP: arrMole[pos3].idPadre, hij: arrMole[pos3].numHijos)
                    auxCadena.insert(auxElementos, atIndex: 0)
                }
            }
            else{
                //hace el appen de su ramificacion correspondiente, de donde comienza a donde empieza la otra ramificacion.
                for pos2 in posRamifi[cant]+1...posRamifi[cant+1]-1{
                    let auxElementos = Elementos(nom: arrMole[pos2].nomMolecula, num: arrMole[pos2].numElem, idP: arrMole[pos2].idPadre, hij: arrMole[pos2].numHijos)
                    auxCadena.insert(auxElementos, atIndex: 0)
                }
            }
            
            auxCadenaLarga.append(auxCadena)
            auxCadena = []
        }
        
        //sacar cadena mas larga, y obtener su nombre
        cadeLarga = cadenaLarga(auxCadenaLarga)
        if auxCadenaLarga[cadeLarga].count > 12 {
            return "Tu cadena mas larga debe de ser de 12 elementos"
        }
        
        nomMolecula = sacarNombreSencilla(auxCadenaLarga[cadeLarga].count)
        nuevaMole = auxCadenaLarga[cadeLarga]
        
        //Sacar la posicion de los elementos restantes de la cadena
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
        
                                    arrMole[i].idPadre = arrMole[i].numElem-1
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
         // para saber el nombre de las ramificaciones una vez que ya sabemos quienes tienen hijos y cuantos hijos tienen.
        var aux : Int = 0
        var auxNom: String  = ""
        var cadenaRami : [String] = []
        var nums: [String] = []
     
        aux = (nuevaMole.count-1) / 2
        
        if buscarC("C", caden: nuevaMole){
            for j in 0...nuevaMole.count-1{
                if (nuevaMole[j].numHijos > 0) && (nuevaMole[j].nomMolecula == "C"){
                    for i in 0...nuevaMole[j].numHijos-1{
                        auxNom += "\(nuevaMole[j].numHijos)" + ","
                    }
                    if j <= aux {
                        auxNom += "-" + sacarNumeroCadena(nuevaMole[j].numHijos) + sacarNombreRam(nuevaMole[j].numHijos-1)
                    }
                    else{//si es despues de la mitad da el nombre contando su posicion de atras a adelante
                        auxNom += "\((nuevaMole.count-j)+1)" + "-" + sacarNombreRam(nuevaMole[j].numHijos-1)
                    }
                }
            }
        }
        else{
            for j in 0...nuevaMole.count-1{
                if nuevaMole[j].numHijos > 0 {
                    //de acuerdo a su posicion es como da el nombre si es antes de la mitad.
                    if j <= aux {
                        cadenaRami.append(sacarNombreRam(nuevaMole[j].numHijos)+" "+"\(j+1)")
                        nums.append("\(j+1)")
                    }
                    else{//si es despues de la mitad da el nombre contando su posicion de atras a adelante
                        cadenaRami.append(sacarNombreRam(nuevaMole[j].numHijos)+" "+"\(j+1)")
                        nums.append("\((nuevaMole.count-j)+1)")
                    }
                }
            }
            cadenaRami.sortInPlace()
            if cadenaRami.count == 0 {
                auxNom = ""
            }
            else{
                for n in 0...cadenaRami.count-1{
                    nums = cadenaRami[n].componentsSeparatedByString(" ")
                    auxNom += nums[1]+"-"+nums[0]+"-"
                    
                }
            }
            
        }

        return (auxNom + " " + nomMolecula)
    }
    
    //Funcion para buscar si se cuenta con un C en la cadena
    func buscarC(nomElem: String, caden: [Elementos])-> Bool{
        for i in 0...caden.count-1{
            if caden[i].nomMolecula == nomElem {
                return true
            }
        }
        return false
    }
    
    /*
     *
     * Metodo buscaPadre
     *
     * Este metodo busca la posicion de un elemento en un arreglo de objetos.
     *
     */
    func buscarPadre(numElem : Int, caden: [Elementos]) -> Int{
        for i in 0...caden.count-1{
            if caden[i].numElem == numElem {
                return i
            }
        }
        return -1
    }
    
    /*
     *
     * Metodo buscar
     *
     * Este metodo busca si se encuentra un elemento en un arreglo de objetos.
     *
     */
    func buscar(numElem : Int, caden:[Elementos]) -> Bool{
        for i in 0...caden.count-1{
            if caden[i].numElem == numElem {
                return true
            }
        }
        return false
    }
    
    /*
     *
     * Metodo cadenaLarga
     *
     * Este metodo regresa la cadena mas larga de una molecula.
     *
     */
    func cadenaLarga(caden: [[Elementos]])->Int{
        var posi: Int = 0
        var aux: Int = 0
        for elem in 0...caden.count-1{
            if aux < caden[elem].count {
                posi = elem
                aux = caden[elem].count
            }
        }
        return posi
    }
}

