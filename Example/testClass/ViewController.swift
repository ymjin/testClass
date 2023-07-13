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
        
        showAlert01()
    }
    
    func showAlert01() {
        let alert = getAlertVC(type: .messageAVC) as! MessageAVC
        alert.message = "첫번재 팝업입니다."
        alert.borderColor = .red
        alert.buttonBorderColor = .red
        
        showMessageAlert(alert: alert) {
            print("팝업 사라짐")
        }
    }
    
    func showAlert02() {
        showMessageAlert(message: "메시지 테스트 입니다.", titleString: "확인") {
            print("팝업 사라짐")
        }
    }
}

