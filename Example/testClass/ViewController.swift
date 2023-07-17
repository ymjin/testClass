//
//  ViewController.swift
//  testClass
//
//  Created by ymjin on 07/11/2023.
//  Copyright (c) 2023 ymjin. All rights reserved.
//

import UIKit
import testClass

class ViewController: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showAVC03()
    }
    
    func showAlert01() {
        let alert = getAlertVC(type: .style01) as! MessageAVC
        alert.messageString = "첫번재 팝업입니다."
        alert.borderColor = .red
        alert.buttonBorderColor = .red
        
        showAVCStyle01(alert: alert) {
            print("팝업 사라짐")
        }
    }
    
    func showAlert02() {
        showAVCStyle01(message: "메시지 테스트 입니다.", buttonTitleString: "확인") {
            print("팝업 사라짐")
        }
    }
    
    func showAVC03() {
        showAVCStyle03(title: "임시", message: "메시지") {
            exit(0)
        }
    }
}

