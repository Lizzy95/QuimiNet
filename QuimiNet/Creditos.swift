//
//  Creditos.swift
//  QuimiNet
//  Clase asignada a la vista de Creditos donde se desplegara los responsables de la aplicacion, asi como sus politicas
//  de difusion.
//
//  Created by Lizzy Cruz on 02/05/16.
//  Copyright © 2016 Lizzy Cruz. All rights reserved.
//

import UIKit

class Creditos: UIViewController {
    var InicioX: CGFloat = 0
    var InicioY : CGFloat = 0
    
    @IBOutlet weak var VistaScrollCre: UIScrollView!
    @IBOutlet weak var Vista1: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Añade scroll a la imagen con los creditos.
        InicioY = ((Vista1.frame.size.height)/2)
        VistaScrollCre.addSubview(Vista1)
        VistaScrollCre.contentSize = Vista1.frame.size
        VistaScrollCre.contentOffset = CGPoint(x: 0, y: 0)

        // Do any additional setup after loading the view.
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
