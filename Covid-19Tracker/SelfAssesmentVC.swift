//
//  SelfAssesmentVC.swift
//  Covid-19Tracker
//
//  Created by Mayur Parmar on 17/04/20.
//  Copyright © 2020 Mayur Parmar. All rights reserved.
//

import UIKit

class SelfAssesmentVC: UIViewController {
    
    //MARK:- Outlet and variable
    @IBOutlet var question1View: UIView!
    @IBOutlet var question1No: UIButton!
    @IBOutlet var question1Yes: UIButton!
    
    @IBOutlet var question2View: UIView!
    @IBOutlet var question2No: UIButton!
    @IBOutlet var question2Yes: UIButton!
    
    @IBOutlet var question3View: UIView!
    @IBOutlet var question3No: UIButton!
    @IBOutlet var question3Yes: UIButton!
    
    @IBOutlet var question4View: UIView!
    @IBOutlet var question4No: UIButton!
    @IBOutlet var question4Yes: UIButton!
    
    @IBOutlet var question5View: UIView!
    @IBOutlet var questiob5No: UIButton!
    @IBOutlet var question5Yes: UIButton!
    
    let arrResult = ["Please call 911 or go directly to your nearest emergency department.","Please consult your family doctor. If you are unable to reach your regular health care provider, call Telehealth.","Please stay at home. As a precaution, the Public Health Agency of Canada is asking anyone with symptoms (fever, cough, sneezing, sore throat, or difficulty breathing) to stay home for 14 days.","Please self-isolate for 14 days. You do not need testing for COVID-19.","Please self-isolate for 14 days. You do not need testing for COVID-19."]
    
    
    //MARK:- VIewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        hideAll(hide:true)
    }
    
    //Setup UI
    func setupUI() {
        roundedBorder(view: question1View)
        roundedBorder(view: question2View)
        roundedBorder(view: question3View)
        roundedBorder(view: question4View)
        roundedBorder(view: question5View)
        
    }
    
    // hide all view and button
    func hideAll(hide:Bool) {
        question2View.isHidden = hide
        question2No.isHidden = hide
        question2Yes.isHidden = hide
        
        question3View.isHidden = hide
        question3No.isHidden = hide
        question3Yes.isHidden = hide
        
        question4View.isHidden = hide
        question4No.isHidden = hide
        question4Yes.isHidden = hide
        
        question5View.isHidden = hide
        questiob5No.isHidden = hide
        question5Yes.isHidden = hide
    }
    
    func roundedBorder(view: UIView){
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
    }
    
    // handel no button click
    func unHide(question: Int) {
        if question == 0 {
            question2View.isHidden = false
            question2No.isHidden = false
            question2Yes.isHidden = false
        } else if question == 1 {
            question3View.isHidden = false
            question3No.isHidden = false
            question3Yes.isHidden = false
        } else if question == 2 {
            question4View.isHidden = false
            question4No.isHidden = false
            question4Yes.isHidden = false
        } else if question == 3 {
            question5View.isHidden = false
            questiob5No.isHidden = false
            question5Yes.isHidden = false
        } else {
            let selfAssesmentResultVC = self.storyboard!.instantiateViewController(withIdentifier: "SelfAssesmentResultVC") as! SelfAssesmentResultVC
            selfAssesmentResultVC.result = "Since you don’t have any COVID-19 symptoms, you don’t need to be tested for COVID-19.\nPlease self-monitor, wash your hands frequently, and practice physical distancing. If you develop any symptoms (fever, cough, sneezing, sore throat, or difficulty breathing), or become aware of any potential exposures to cases of COVID-19, take this self-assessment again."
            self.navigationController!.pushViewController(selfAssesmentResultVC, animated: true)
        }
    }
    
    
    
    
    //MARK:- IBAction
    @IBAction func btnBackPress(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnNoPress(_ sender: UIButton) {
        unHide(question: sender.tag)
    }
    
    @IBAction func btnYesPress(_ sender: UIButton) {
        let selfAssesmentResultVC = self.storyboard!.instantiateViewController(withIdentifier: "SelfAssesmentResultVC") as! SelfAssesmentResultVC
        selfAssesmentResultVC.result = self.arrResult[sender.tag ]
        self.navigationController!.pushViewController(selfAssesmentResultVC, animated: true)
    }
    
    
}
