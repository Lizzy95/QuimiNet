//
//  InformacionViewController.swift
//  QuimiNet
//  Clase en la que se ven las instrucciones de la aplicacion.
//
//  Created by Lizzy Cruz on 01/04/16.
//  Copyright © 2016 Lizzy Cruz. All rights reserved.
//

import UIKit

class InformacionViewController: UIViewController {

    internal var InicioX: CGFloat = 0.0
    
    internal var InicioY: CGFloat = 0.0
    
    @IBOutlet weak var VistaScrollInf: UIScrollView!
    @IBAction func regresarMenu(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Codigo para implementar ScrollView
        let imagen = UIImage(named: "Instrucciones")
        let VistaInf = UIImageView(image: imagen)
        InicioY = ((VistaInf.frame.size.height)/2)
        VistaScrollInf.addSubview(VistaInf)
        VistaScrollInf.contentSize = VistaInf.frame.size
        VistaScrollInf.contentOffset = CGPoint(x: 0, y: 0)
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
