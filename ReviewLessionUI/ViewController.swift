//
//  ViewController.swift
//  ReviewLessionUI
//
//  Created by Hiếu đang cáu on 27/10/2023.
//

import UIKit

enum light {
    case red
    case yellow
    case green
    case none
}

class ViewController: UIViewController {
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var yellowView: UIView!
    
    @IBOutlet weak var labelS: UILabel!
    var lightNow: light = .none
    var timer : Timer!
    
    var second: Int = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLight()
        second = 5
        labelS.text = "3"
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
        
    @IBAction func onClickGreen(_ sender: Any) {
        
        lightNow = .green
        setLightClick()
    }
    
    @IBAction func onClickYellow(_ sender: Any) {
        
        lightNow = .yellow
        setLightClick()
    }
    
    @IBAction func onclickRed(_ sender: Any) {
        
        lightNow = .red
        setLightClick()
    }
    
   @objc func runTimer() {
       if second == 1{
           changeColor()
           second = 5
       }
            second -= 1
       var giay = second - 1
       labelS.text = String(giay)
    }
    
    func setLightClick(){
        timer.invalidate()
        changeColor()
        second = 5
        labelS.text = "3"
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    func setUpLight(){
        redView.layer.cornerRadius = 25
        greenView.layer.cornerRadius = 25
        yellowView.layer.cornerRadius = 25
    }
    
    func changeColor(){
        switch lightNow {
            case .red:
                redView.alpha = 0
                yellowView.alpha = 1
                greenView.alpha = 1
                lightNow = .yellow
            case .yellow:
                redView.alpha = 1
                yellowView.alpha = 0
                greenView.alpha = 1
                lightNow = .green
            case .green:
                redView.alpha = 1
                yellowView.alpha = 1
                greenView.alpha = 0
                lightNow = .red
            case .none:
                redView.alpha = 1
                yellowView.alpha = 1
                greenView.alpha = 1
                lightNow = .none
        }
    }
    
}

