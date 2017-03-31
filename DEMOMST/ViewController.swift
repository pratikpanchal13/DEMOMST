//
//  ViewController.swift
//  DEMOMST
//
//  Created by indianic on 31/03/17.
//  Copyright © 2017 pratik. All rights reserved.
//

import UIKit
import MST1

class ViewController: UIViewController {

    var obj =  MulipleSelectionVC()
    
    @IBOutlet weak var btnClick: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//                self.loadStoryboard()           // Load Stroyboard

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Mark:- Load Storyboard
    func loadStoryboard()
    {
        

        let podBundle = Bundle(for: MulipleSelectionVC.self)
        let bundleURL = podBundle.url(forResource: "MST1", withExtension: "bundle")
        let bundle = Bundle(url: bundleURL!)!
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let vc = storyboard.instantiateInitialViewController()!
        
        vc.willMove(toParentViewController: self)
        self.view.addSubview(vc.view)
        self.addChildViewController(vc)
        vc.didMove(toParentViewController: self)
    }


    @IBAction func btnClickeMe(_ sender: Any) {
        

        let podBundle = Bundle(for: MulipleSelectionVC.self)
        let bundleURL = podBundle.url(forResource: "MST1", withExtension: "bundle")
        let bundle = Bundle(url: bundleURL!)!
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let vc:MulipleSelectionVC = storyboard.instantiateViewController(withIdentifier: "MulipleSelectionVC") as! MulipleSelectionVC

        
        //        objMultipleSelectionVC.arrContent = [1,2,3,4,5,6,7,8,9]  // Pass Array Data
        vc.arrContent = ["IPhone","IMac","IPad","MacBook","IPod","MacMini","Apple TV"]  // Pass Array Data
//        vc.backgroundColorDoneButton = UIColor.green
//        vc.backgroundColorHeaderView = UIColor.purple
//        vc.backgroundColorTableView = UIColor.darkGray
//        vc.backgroundColorCellTitle = UIColor.yellow
//        vc.backgroundColorDoneTitle = UIColor.brown
//        vc.backgroundColorSelectALlTitle = UIColor.magenta
        
        // Get Selected Index from PKMultipleSelectionVC
        if let returnIndex = UserDefaults.standard.object(forKey: "indexPath") as? [Int] {
            vc.objGetSelectedIndex = returnIndex
        }
        
        
        // Data Passing Usning Block
        vc.passDataWithIndex = { arrayData, selectedIndex in
            self.btnClick.setTitle("\(arrayData)", for: UIControlState.normal)
            UserDefaults.standard.set(arrayData, forKey: "data")
            UserDefaults.standard.synchronize()
        }

        vc.willMove(toParentViewController: self)
        self.view.addSubview(vc.view)
        self.addChildViewController(vc)
        vc.didMove(toParentViewController: self)
    }

    
    


}


