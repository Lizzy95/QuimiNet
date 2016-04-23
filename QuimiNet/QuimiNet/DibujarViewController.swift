//
//  DibujarViewController.swift
//  QuimiNet
//
//  Created by Lizzy Cruz on 01/04/16.
//  Copyright © 2016 Lizzy Cruz. All rights reserved.
//

import UIKit

class DibujarViewController: UIViewController {
    var InicioX: CGFloat = 10
    var InicioY : CGFloat = 100
    var auxInicioX : CGFloat = 10
    var auxInicioY : CGFloat = 100
    var contEnlaces : Int = 0
    var contElementos : Int  = 0
    var contEnlEl : Int = 0
    var moleculas : [Elementos] = []
    var arrRamificac : [Ramificaciones] = []
    var iRamificaciones :Int = 0
    var iRamCor :Int = 0
    
    @IBOutlet weak var Vista: UIView!
    
    //botones de elementos
    @IBOutlet weak var btC: UIButton!

    @IBOutlet weak var btCH: UIButton!
    
    @IBOutlet weak var btCH2: UIButton!
    
    @IBOutlet weak var btCH3: UIButton!
    
    @IBOutlet weak var btCH4: UIButton!
    
    @IBOutlet weak var btEnlace: UIButton!
    //botones para obtener el nombre
    @IBOutlet weak var btNombre: UIButton!
    @IBOutlet weak var btDobleEnlace: UIButton!
    var gpFuncionales : String!
    //obtener la respuesta
    @IBOutlet weak var lbRes: UILabel!
    @IBOutlet weak var lbNombre: UILabel!
    
    @IBOutlet weak var btTriple: UIButton!
    
    var imagee : UIImageView!
    
    
    // MARK: - Actions
    
    @IBAction func oprimeC(sender: UIButton) {
        if contElementos == 0 {
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
            var auxElementos = Elementos(nom: "C", num: contElementos)
            moleculas.append(auxElementos)
            contElementos += 1
            contEnlaces += 4
            iRamificaciones += 3
            var auxRamificacion = Ramificaciones(nom: "C", num: contElementos, posx: auxInicioX, posy: auxInicioY)
            arrRamificac.append(auxRamificacion)
            auxInicioY = InicioY+51
            auxRamificacion = Ramificaciones(nom: "C", num: contElementos, posx: auxInicioX, posy: auxInicioY)
            arrRamificac.append(auxRamificacion)
            auxInicioX = InicioX-60
            auxRamificacion = Ramificaciones(nom: "C", num: contElementos, posx: auxInicioX, posy: auxInicioY)
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
            var auxElementos = Elementos(nom: "C", num: contElementos)
            moleculas.append(auxElementos)
            contElementos += 1
            contEnlaces += 3
            iRamificaciones += 2
            var auxRamificacion = Ramificaciones(nom: "C", num: contElementos, posx: auxInicioX, posy: auxInicioY)
            arrRamificac.append(auxRamificacion)
            auxInicioY = InicioY+53
            auxRamificacion = Ramificaciones(nom: "C", num: contElementos, posx: auxInicioX, posy: auxInicioY)
            arrRamificac.append(auxRamificacion)
        }
        
    }
    
    @IBAction func oprimeCH(sender: UIButton) {
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
            var auxElementos = Elementos(nom: "CH", num: contElementos)
            moleculas.append(auxElementos)
            contElementos += 1
            contEnlaces += 3
            iRamificaciones += 2
            var auxRamificacion = Ramificaciones(nom: "CH", num: contElementos, posx: auxInicioX, posy: auxInicioY)
            arrRamificac.append(auxRamificacion)
            auxInicioY = InicioY+65
            auxRamificacion = Ramificaciones(nom: "CH", num: contElementos, posx: auxInicioX, posy: auxInicioY)
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
            var auxElementos = Elementos(nom: "CH", num: contElementos)
            moleculas.append(auxElementos)
            contElementos += 1
            contEnlaces += 2
            iRamificaciones += 1
            var auxRamificacion = Ramificaciones(nom: "CH", num: contElementos, posx: auxInicioX, posy: auxInicioY)
            arrRamificac.append(auxRamificacion)
        }
        

    }
    
    @IBAction func oprimeCH2(sender: UIButton) {
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
            var auxElementos = Elementos(nom: "CH2", num: contElementos)
            moleculas.append(auxElementos)
            contElementos += 1
            contEnlaces += 2
            iRamificaciones += 1
            var auxRamificacion = Ramificaciones(nom: "CH2", num: contElementos, posx: auxInicioX, posy: auxInicioY)
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
            var auxElementos = Elementos(nom: "CH2", num: contElementos)
            moleculas.append(auxElementos)
            contEnlaces += 1
            contElementos += 1
        }
        
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
            var auxElementos = Elementos(nom: "CH3", num: contElementos)
            moleculas.append(auxElementos)
            contElementos += 1
            contEnlaces += 1
            
        }
        else if contElementos > 0 {
            imagee = UIImageView(image: UIImage(named: "CH3"))
            //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
            imagee.frame = CGRectMake(InicioX, InicioY, 50, 22)
            InicioX += imagee.frame.width
            self.Vista.addSubview(imagee)
            var auxElementos = Elementos(nom: "CH3", num: contElementos)
            moleculas.append(auxElementos)
            InicioX += 50
            contElementos += 1
            if (iRamificaciones > 0 ){
                //label de advertencia
                lbRes.text = "Completa la ramificacion de " + arrRamificac[iRamCor].nomMolecula
                var auxElementos = Elementos(nom: "Ram", num: 0)
                moleculas.append(auxElementos)
                InicioX = arrRamificac[iRamCor].posX
                InicioY = arrRamificac[iRamCor].posY
                iRamificaciones -= 1
                iRamCor += 1
            }
            else {
                btC.enabled = false
                btCH.enabled = false
                btCH2.enabled = false
                btCH3.enabled = false
                lbRes.text = "Ya no puedes agregar mas elementos"
                
            }
        }

    }
    
    @IBAction func oprimeEnlace(sender: UIButton) {
         imagee = UIImageView(image: UIImage(named: "Enlace"))
        //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
        imagee.frame = CGRectMake(InicioX, InicioY, 40, 28)
        self.Vista.addSubview(imagee)
        InicioX += imagee.frame.width
        btC.enabled = true
        btCH.enabled = true
        btCH2.enabled = true
        btCH3.enabled = true
        contEnlaces += 1
        btEnlace.enabled = false

    }
    
    @IBAction func oprimeEnlace2(sender: UIButton) {
         imagee  = UIImageView(image: UIImage(named: "DobleEnlace"))
        //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
        imagee.frame = CGRectMake(InicioX, InicioY, 40, 11)
        self.Vista.addSubview(imagee)
        InicioX += imagee.frame.width
        contEnlaces += 1

    }
    
    @IBAction func oprimeEnlace3(sender: UIButton) {
         imagee = UIImageView(image: UIImage(named: "TripleEnlace"))
        //Crear variable Inicio (es para definir un punto de inicio(en el view) a la cadena)
        imagee.frame = CGRectMake(InicioX, InicioY, 40, 16)
        self.Vista.addSubview(imagee)
        InicioX += (imagee.frame.width)
        contEnlaces += 1
    }
    
    @IBAction func borrarDatos(sender: UIButton) {
        //con esto se borran los elementos agregados a la vista
        self.Vista.subviews.forEach({$0.removeFromSuperview()})
        btC.enabled = true
        btCH.enabled = true
        btCH2.enabled = true
        btCH3.enabled = true
        btEnlace.enabled = false
        contElementos = 0
        contEnlaces = 0
        InicioX = 10
        InicioY = 100
        auxInicioX = 10
        auxInicioY = 100
        moleculas = []
        arrRamificac = []
        lbRes.text=""
    }
    
    @IBAction func oprimeNombre(sender: UIButton) {
        print("elem ", contElementos)
        print("enla ",contEnlaces)
        print("cant", moleculas.count)
        if contEnlaces >= contElementos{
            lbRes.text = "Error te faltan elementos."
        }
        else {
            
            if iRamCor > 0 {
                var molec : nomAlcanos = nomAlcanos()
                let sNombre = molec.sacarNombreRamifi(arrRamificac, arrMole: moleculas)
                lbRes.text = sNombre
            }
            else {
                var molec : nomAlcanos = nomAlcanos()
                let sNombre = molec.sacarNombreSencilla(moleculas.count)
                lbRes.text = sNombre
            }
        }
        
       /* for inde in moleculas {
            print(inde)
        }
        print("cant ", iRamCor)*/
        /*for dos in 0...iRamCor-1 {
            print(arrRamificac[dos].nomMolecula)
            print(arrRamificac[dos].numElem)
            print(arrRamificac[dos].posX)
            print(arrRamificac[dos].posY)
        }*/
        
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
        lbNombre.text = gpFuncionales
        btEnlace.enabled = false
        if gpFuncionales == "Alcanos" {
            btDobleEnlace.hidden = true
            btTriple.hidden = true
        }
        else if gpFuncionales == "Alquenos" {
            btTriple.hidden = true
        }
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
