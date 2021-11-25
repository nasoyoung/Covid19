//
//  PopUpVC.swift
//  COVID-19
//
//  Created by 또용이 on 2021/08/21.
//

import UIKit

class PopUpVC: UIViewController {

    @IBOutlet weak var popView: UIView!
    
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var totalCase: UILabel!
    @IBOutlet weak var newCase: UILabel!
    @IBOutlet weak var recovered: UILabel!
    @IBOutlet weak var death: UILabel!
    
    var receiveRegion: String = ""
    var receiveTotalCase: String = ""
    var receiveNewCase: String = ""
    var receiveRecovered: String = ""
    var receiveDeath: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        region.text = receiveRegion
        totalCase.text = receiveTotalCase
        newCase.text = "\(receiveNewCase) ▲"
        recovered.text = receiveRecovered
        death.text = receiveDeath
        
        popView.layer.cornerRadius = 15

    }
    
    @IBAction func goToBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
