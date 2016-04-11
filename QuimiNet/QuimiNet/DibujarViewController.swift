//
//  DibujarViewController.swift
//  QuimiNet
//
//  Created by Lizzy Cruz on 01/04/16.
//  Copyright © 2016 Lizzy Cruz. All rights reserved.
//

import UIKit

class DibujarViewController: UIViewController {
    
    
    @IBOutlet weak var Vista: UIView!
    
    @IBOutlet weak var btC: UIButton!

    @IBOutlet weak var btCH: UIButton!
    
    @IBOutlet weak var btCH2: UIButton!
    
    @IBOutlet weak var btCH3: UIButton!
    
    @IBOutlet weak var btCH4: UIButton!
    
    @IBOutlet weak var btEnlace: UIButton!
    
    @IBOutlet weak var btDobleEnlace: UIButton!
    var gpFuncionales : String!
    
    @IBOutlet weak var lbNombre: UILabel!
    
    @IBOutlet weak var btTriple: UIButton!
    
    // MARK: - Actions
    
    @IBAction func oprimeC(sender: UIButton) {
        let label = UILabel(frame: CGRectMake(0,0,200,21))
        label.center = CGPointMake(10, 20)
        label.text = "C"
        self.Vista.addSubview(label)
        
        let imagee : UIImageView!
        
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
