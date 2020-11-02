//
//  ViewController.swift
//  FindUrZodiacSign
//
//  Created by rosebud on 11/1/20.
//  Copyright © 2020 kaak. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var horoscopeImage: UIImageView!
    @IBOutlet weak var horoscopeDatePicker: UIDatePicker!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //print(pisces.contains(formatter.date(from: "02/20/2020")!))
        
       self.view.backgroundColor = UIColor(patternImage: UIImage(named: "zodiac-signs-bg.png")!)
     
        
    }
    
    func horoscopeFinder(userDate: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        let pisces = formatter.date(from: "02/19/2020")!...formatter.date(from: "03/20/2020")!
        let aquarius = formatter.date(from: "01/20/2020")!...formatter.date(from: "02/18/2020")!
        let saggitarius = formatter.date(from: "11/22/2020")!...formatter.date(from: "12/21/2020")!
        let scorpio = formatter.date(from: "10/23/2020")!...formatter.date(from: "11/21/2020")!
        let libra = formatter.date(from: "09/23/2020")!...formatter.date(from: "10/22/2020")!
        let virgo = formatter.date(from: "08/23/2020")!...formatter.date(from: "09/22/2020")!
        let leo = formatter.date(from: "07/23/2020")!...formatter.date(from: "08/22/2020")!
        let cancer = formatter.date(from: "06/21/2020")!...formatter.date(from: "07/22/2020")!
        let gemini = formatter.date(from: "05/21/2020")!...formatter.date(from: "06/20/2020")!
        let taurus = formatter.date(from: "04/20/2020")!...formatter.date(from: "05/20/2020")!
        let aries = formatter.date(from: "03/21/2020")!...formatter.date(from: "04/19/2020")!
        
        if pisces.contains(userDate) {
            horoscopeImage.image = UIImage(named: "pisces-symbol.png")
            print("DONE")
        }
        else if aquarius.contains(userDate) {
            horoscopeImage.image = UIImage(named: "aquarius-symbol.png")
        }
        else if saggitarius.contains(userDate) {
            horoscopeImage.image = UIImage(named: "sagittarius-symbol.png")
        }
        else if scorpio.contains(userDate) {
            horoscopeImage.image = UIImage(named: "scorpio-symbol.png")
        }
        else if libra.contains(userDate) {
            horoscopeImage.image = UIImage(named: "libra-symbol.png")
        }
        else if virgo.contains(userDate) {
            horoscopeImage.image = UIImage(named: "virgo-symbol.png")
        }
        else if leo.contains(userDate) {
            horoscopeImage.image = UIImage(named: "leo-symbol.png")
        }
        else if cancer.contains(userDate) {
            horoscopeImage.image = UIImage(named: "crab-symbol.png")
        }
        else if gemini.contains(userDate) {
            horoscopeImage.image = UIImage(named: "gemini-symbol.png")
        }
        else if taurus.contains(userDate) {
            horoscopeImage.image = UIImage(named: "taurus-symbol.png")
        }
        else if aries.contains(userDate) {
            horoscopeImage.image = UIImage(named: "aries-symbol.png")
        }
        else {
            horoscopeImage.image = UIImage(named: "capricorn-symbol.png")
        }
        
    }
    
    
    @IBAction func onFind(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        let userEnteredDate = horoscopeDatePicker.date //formatter.date(from: "02/23/2020")!
        print("user entered: \(userEnteredDate)")
        print()
        horoscopeFinder(userDate: userEnteredDate)
    }
}
