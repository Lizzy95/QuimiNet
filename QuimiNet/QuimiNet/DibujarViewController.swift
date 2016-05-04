//
//  DibujarViewController.swift
//  QuimiNet
//
//  Created by Lizzy Cruz and Abe Gonzalez on 01/04/16.
//  Copyright © 2016 Lizzy Cruz. All rights reserved.
//

import UIKit

class DibujarViewController: UIViewController {
    var InicioX: CGFloat = 0
    var InicioY : CGFloat = 0
    var auxInicioX : CGFloat = 10
    var auxInicioY : CGFloat = 100
    var contEnlaces : Int = 0
    var contElementos : Int  = 0
    var contEnlEl : Int = 0
    var moleculas : [Elementos] = []
    var arrRamificac : [Ramificaciones] = []
    var iRamificaciones :Int = 0
    var iRamCor :Int = 0
    var idPadre : Int = -1
    
    @IBOutlet weak var Vista: UIView!
    
    @IBOutlet weak var VistaScroll: UIScrollView!
    
    //botones de elementos
    @IBOutlet weak var btC: UIButton!

    @IBOutlet weak var btCH: UIButton!
    
    @IBOutlet weak var btCH2: UIButton!
    
    @IBOutlet weak var btCH3: UIButton!
    
    //botones para obtener el nombre
    @IBOutlet weak var btNombre: UIButton!
    var gpFuncionales : String!
    //obtener la respuesta
    @IBOutlet weak var lbRes: UILabel!
    @IBOutlet weak var lbNombre: UILabel!

    var indica : UIImageView = UIImageView(image: UIImage(named: "dot"))
    
    var imagee : UIImageView!
    
    
    // MARK: - Actions
    
    @IBAction func oprimeC(sender: UIButton) {
        if contElementos != 0 && buscarC(idPadre, caden: moleculas){
            if iRamCor == arrRamificac.count{
                lbRes.text = "Recrea tu cadena"
                btC.enabled = false
                btCH.enabled = false
                btCH2.enabled = false
                btCH3.enabled = false
            }
        }
        if contElementos == 0 {
            InicioX = (Vista.frame.size.width)/4
            imagee = UIImageView(image: UIImage(named: "Enlace"))
            //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
            imagee.frame = CGRectMake(InicioX, InicioY, 40, 28)
            self.Vista.addSubview(imagee)
            auxInicioX = InicioX
            InicioX += imagee.frame.width
            imagee = UIImageView(image: UIImage(named: "C"))
            //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
            imagee.frame = CGRectMake(InicioX, InicioY, 20, 23)
            self.Vista.addSubview(imagee)
            imagee = UIImageView(image: UIImage(named: "EnlaceParado"))
            //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
            imagee.frame = CGRectMake(InicioX-10, InicioY-26, 40, 28)
            self.Vista.addSubview(imagee)
            imagee = UIImageView(image: UIImage(named: "EnlaceParado"))
            //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
            imagee.frame = CGRectMake(InicioX-10, InicioY+23, 40, 28)
            self.Vista.addSubview(imagee)
            auxInicioX = InicioX
            auxInicioY = InicioY-51
            InicioX += 20
            imagee = UIImageView(image: UIImage(named: "Enlace"))
            //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
            imagee.frame = CGRectMake(InicioX, InicioY, 40, 28)
            self.Vista.addSubview(imagee)
            InicioX += imagee.frame.width
            let auxElementos = Elementos(nom: "C", num: contElementos, idP: idPadre, hij: 0)
            moleculas.append(auxElementos)
            contElementos += 1
            contEnlaces += 4
            iRamificaciones += 3
            var auxRamificacion = Ramificaciones(nom: "C", num: contElementos-1, posx: auxInicioX, posy: auxInicioY)
            arrRamificac.append(auxRamificacion)
            auxInicioY = InicioY+51
            auxRamificacion = Ramificaciones(nom: "C", num: contElementos-1, posx: auxInicioX, posy: auxInicioY)
            arrRamificac.append(auxRamificacion)
            auxInicioX = InicioX-140
            auxRamificacion = Ramificaciones(nom: "C", num: contElementos-1, posx: auxInicioX, posy: InicioY)
            arrRamificac.append(auxRamificacion)
        }
        else if contElementos > 0 {
            imagee = UIImageView(image: UIImage(named: "C"))
            //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
            imagee.frame = CGRectMake(InicioX, InicioY, 20, 23)
            self.Vista.addSubview(imagee)
            imagee = UIImageView(image: UIImage(named: "EnlaceParado"))
            //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
            imagee.frame = CGRectMake(InicioX, InicioY-25, 40, 28)
            self.Vista.addSubview(imagee)
            auxInicioX = InicioX
            auxInicioY = InicioY-53
            imagee = UIImageView(image: UIImage(named: "EnlaceParado"))
            //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
            imagee.frame = CGRectMake(InicioX, InicioY+25, 40, 28)
            self.Vista.addSubview(imagee)
            InicioX += 20
            imagee = UIImageView(image: UIImage(named: "Enlace"))
            //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
            imagee.frame = CGRectMake(InicioX, InicioY, 40, 28)
            self.Vista.addSubview(imagee)
            InicioX += imagee.frame.width
            let auxElementos = Elementos(nom: "C", num: contElementos, idP: idPadre, hij: 0)
            moleculas.append(auxElementos)
            contElementos += 1
            contEnlaces += 3
            iRamificaciones += 2
            var auxRamificacion = Ramificaciones(nom: "C", num: contElementos-1, posx: auxInicioX, posy: auxInicioY)
            arrRamificac.append(auxRamificacion)
            auxInicioY = InicioY+53
            auxRamificacion = Ramificaciones(nom: "C", num: contElementos-1, posx: auxInicioX, posy: auxInicioY)
            arrRamificac.append(auxRamificacion)
        }
        //Agrega indicado
        indica.frame = CGRectMake(InicioX, InicioY, 24, 24)
        self.Vista.addSubview(indica)
    }
    
    @IBAction func oprimeCH(sender: UIButton) {
        if buscarC(idPadre, caden: moleculas){
            if iRamCor == arrRamificac.count{
                lbRes.text = "Recrea tu cadena"
                btC.enabled = false
                btCH.enabled = false
                btCH2.enabled = false
                btCH3.enabled = false
            }
        }
        if contElementos == 0 {
            imagee = UIImageView(image: UIImage(named: "CH"))
            //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
            imagee.frame = CGRectMake(InicioX, InicioY, 35, 23)
            self.Vista.addSubview(imagee)
            imagee = UIImageView(image: UIImage(named: "EnlaceParado"))
            //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
            imagee.frame = CGRectMake(InicioX, InicioY+35, 40, 28)
            self.Vista.addSubview(imagee)
            imagee = UIImageView(image: UIImage(named: "EnlaceParado"))
            //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
            imagee.frame = CGRectMake(InicioX, InicioY-39, 40, 28)
            self.Vista.addSubview(imagee)
            auxInicioY = InicioY-65
            auxInicioX = InicioX
            InicioX += 35
            imagee = UIImageView(image: UIImage(named: "Enlace"))
            //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
            imagee.frame = CGRectMake(InicioX, InicioY, 40, 28)
            self.Vista.addSubview(imagee)
            InicioX += imagee.frame.width
            let auxElementos = Elementos(nom: "CH", num: contElementos, idP: idPadre, hij: 0)
            moleculas.append(auxElementos)
            contElementos += 1
            contEnlaces += 3
            iRamificaciones += 2
            var auxRamificacion = Ramificaciones(nom: "CH", num: contElementos-1, posx: auxInicioX, posy: auxInicioY)
            arrRamificac.append(auxRamificacion)
            auxInicioY = InicioY+65
            auxRamificacion = Ramificaciones(nom: "CH", num: contElementos-1, posx: auxInicioX, posy: auxInicioY)
            arrRamificac.append(auxRamificacion)
        }
        else if contElementos > 0 {
            imagee = UIImageView(image: UIImage(named: "CH"))
            //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
            imagee.frame = CGRectMake(InicioX, InicioY, 35, 23)
            self.Vista.addSubview(imagee)
            imagee = UIImageView(image: UIImage(named: "EnlaceParado"))
            //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
            imagee.frame = CGRectMake(InicioX, InicioY-37, 40, 28)
            self.Vista.addSubview(imagee)
            auxInicioX = InicioX
            auxInicioY = InicioY-65
            InicioX += 35
            imagee = UIImageView(image: UIImage(named: "Enlace"))
            //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
            imagee.frame = CGRectMake(InicioX, InicioY, 40, 28)
            self.Vista.addSubview(imagee)
            InicioX += imagee.frame.width
            let auxElementos = Elementos(nom: "CH", num: contElementos, idP: idPadre, hij: 0)
            moleculas.append(auxElementos)
            contElementos += 1
            contEnlaces += 2
            iRamificaciones += 1
            let auxRamificacion = Ramificaciones(nom: "CH", num: contElementos-1, posx: auxInicioX, posy: auxInicioY)
            arrRamificac.append(auxRamificacion)
        }
        
        //Agrega Indicador
        indica.frame = CGRectMake(InicioX, InicioY, 24, 24)
        self.Vista.addSubview(indica)

    }
    
    @IBAction func oprimeCH2(sender: UIButton) {
        if contElementos >= 10 && arrRamificac.count <= 0{
            lbRes.text = "Tu cadena mas larga debe de ser de 12 elementos"
            btC.enabled = false
            btCH.enabled = false
            btCH2.enabled = false
        }
        if buscarC(idPadre, caden: moleculas){
            if iRamCor == arrRamificac.count{
                lbRes.text = "Recrea tu cadena"
                btC.enabled = false
                btCH.enabled = false
                btCH2.enabled = false
                btCH3.enabled = false
            }
        }
        if contElementos == 0 {
            imagee = UIImageView(image: UIImage(named: "CH2"))
            //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
            imagee.frame = CGRectMake(InicioX, InicioY, 50, 22)
            self.Vista.addSubview(imagee)
            imagee = UIImageView(image: UIImage(named: "EnlaceParado"))
            //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
            imagee.frame = CGRectMake(InicioX, InicioY-30, 40, 28)
            self.Vista.addSubview(imagee)
            auxInicioX = InicioX
            auxInicioY = InicioY-58
            InicioX += 50
            imagee = UIImageView(image: UIImage(named: "Enlace"))
            //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
            imagee.frame = CGRectMake(InicioX, InicioY, 40, 28)
            self.Vista.addSubview(imagee)
            InicioX += imagee.frame.width
            let auxElementos = Elementos(nom: "CH2", num: contElementos, idP: idPadre, hij: 0)
            moleculas.append(auxElementos)
            contElementos += 1
            contEnlaces += 2
            iRamificaciones += 1
            let auxRamificacion = Ramificaciones(nom: "CH2", num: contElementos-1, posx: auxInicioX, posy: auxInicioY)
            arrRamificac.append(auxRamificacion)
        }
        else if contElementos > 0{
            imagee = UIImageView(image: UIImage(named: "CH2"))
            //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
            imagee.frame = CGRectMake(InicioX, InicioY, 50, 22)
            self.Vista.addSubview(imagee)
            InicioX += 50
            imagee = UIImageView(image: UIImage(named: "Enlace"))
            //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
            imagee.frame = CGRectMake(InicioX, InicioY, 40, 28)
            InicioX += imagee.frame.width
            self.Vista.addSubview(imagee)
            let auxElementos = Elementos(nom: "CH2", num: contElementos, idP: idPadre, hij: 0)
            moleculas.append(auxElementos)
            contEnlaces += 1
            contElementos += 1
        }
        indica.frame = CGRectMake(InicioX, InicioY, 24, 24)
        self.Vista.addSubview(indica)
    }
    
    @IBAction func oprimeCH3(sender: UIButton) {
        if contElementos == 0 {
            imagee = UIImageView(image: UIImage(named: "CH3"))
            //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
            imagee.frame = CGRectMake(InicioX, InicioY, 50, 22)
            self.Vista.addSubview(imagee)
            InicioX += 50
            imagee = UIImageView(image: UIImage(named: "Enlace"))
            //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
            imagee.frame = CGRectMake(InicioX, InicioY, 40, 28)
            self.Vista.addSubview(imagee)
            InicioX += imagee.frame.width
            let auxElementos = Elementos(nom: "CH3", num: contElementos, idP: idPadre, hij: 0)
            moleculas.append(auxElementos)
            contElementos += 1
            contEnlaces += 1
            
            //Agrega Indicador
            indica.frame = CGRectMake(InicioX, InicioY, 24, 24)
            self.Vista.addSubview(indica)
            
        }
        else if contElementos > 0 {
            imagee = UIImageView(image: UIImage(named: "CH3"))
            //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
            imagee.frame = CGRectMake(InicioX, InicioY, 50, 22)
            InicioX += imagee.frame.width
            self.Vista.addSubview(imagee)
            let auxElementos = Elementos(nom: "CH3", num: contElementos, idP: idPadre, hij: 0)
            moleculas.append(auxElementos)
            InicioX += 50
            contElementos += 1
            if (iRamificaciones > 0 ){
                //label de advertencia
                lbRes.text = "Completa la ramificacion de " + arrRamificac[iRamCor].nomMolecula
                let auxElementos = Elementos(nom: "Ram", num: -1, idP: idPadre, hij: 0)
                moleculas.append(auxElementos)
                InicioX = arrRamificac[iRamCor].posX
                InicioY = arrRamificac[iRamCor].posY
                idPadre = arrRamificac[iRamCor].numElem
                iRamificaciones -= 1
                iRamCor += 1
                //Agregar indicador de posicion
                indica.frame = CGRectMake(InicioX, InicioY, 24, 24)
                self.Vista.addSubview(indica)
                
                
            }
            else {
                btC.enabled = false
                btCH.enabled = false
                btCH2.enabled = false
                btCH3.enabled = false
                lbRes.text = "Ya no puedes agregar mas elementos"
                indica.frame = CGRectMake(InicioX, InicioY, 0, 0)
                self.Vista.addSubview(indica)
                
            }
        }

    }
    
    
    func buscarC(numElem: Int, caden: [Elementos])-> Bool{
        for i in 0...caden.count-1{
            if caden[i].numElem == numElem {
                if caden[i].nomMolecula == "C"  {
                    return true
                }
            }
        }
        return false
    }
    
    @IBAction func borrarDatos(sender: UIButton) {
        //con esto se borran los elementos agregados a la vista
        self.Vista.subviews.forEach({$0.removeFromSuperview()})
        btC.enabled = true
        btCH.enabled = true
        btCH2.enabled = true
        btCH3.enabled = true
        contElementos = 0
        contEnlaces = 0
        contEnlEl = 0
        idPadre = -1
        iRamCor = 0
        iRamificaciones = 0
        InicioX = 10
        InicioY = ((Vista.frame.size.height)/4)*3
        auxInicioX = 10
        auxInicioY = 100
        moleculas = []
        arrRamificac = []
        lbRes.text=""
        //Agregar indicador de posicion
        
        indica.frame = CGRectMake(InicioX, InicioY, 24, 24)
        self.Vista.addSubview(indica)
    }
    
    @IBAction func oprimeNombre(sender: UIButton) {
        if contEnlaces >= contElementos{
            lbRes.text = "Error te faltan elementos."
        }
        else {
            
            if iRamCor > 0 {
                let molec : nomAlcanos = nomAlcanos()
                let sNombre = molec.sacarNombreRamifi(arrRamificac, arrMole: moleculas)
                lbRes.text = sNombre
            }
            else {
                let molec : nomAlcanos = nomAlcanos()
                let sNombre = molec.sacarNombreSencilla(moleculas.count)
                lbRes.text = sNombre
            }
        }
        
    }
    
   override func shouldAutorotate() -> Bool {
        return true
    }
 /*
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Landscape
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
            let value = UIInterfaceOrientation.LandscapeLeft.rawValue
            UIDevice.currentDevice().setValue(value, forKey: "orientation")
        //Codigo para implementar ScrollView
        InicioY = ((Vista.frame.size.height)/2)
        VistaScroll.addSubview(Vista)
        VistaScroll.contentSize = Vista.frame.size
        VistaScroll.contentOffset = CGPoint(x: InicioX, y: (InicioY/2))
        
        //Agregar indicador de posicion
        indica.frame = CGRectMake(InicioX, InicioY, 24, 24)
        self.Vista.addSubview(indica)
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
