//
//  BasicAVC.swift
//  testClass
//
//  Created by Youngmin Jin on 2023/07/13.
//

import UIKit
import RxCocoa
import RxSwift
import ExtensionCollection

@available(iOS 11.0, *)
open class MessageAVC: BaseAVC {

    // MARK: - IBOutlet
    @IBOutlet var messageLabel:UILabel!
    @IBOutlet var button:UIButton!
    
    // MARK: - Variable
    public var message:String!
    public var messageColor:UIColor!
    
    public var buttonTitleString:String!
    public var buttonBorderColor:UIColor!
    public var buttonNormalColor:UIColor!
    public var buttonHighlightedColor:UIColor!
    public var buttonSelectedColor:UIColor!
    public var buttonDisabledColor:UIColor!
    public var buttonBorder:CGFloat!
    public var buttonBorderWidth:CGFloat!
    
    // MARK: - Life Cycle
    open override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func initLayout() {
        super.initLayout()

        if message != nil {
            messageLabel.text = message
        }
        
        if buttonTitleString != nil {
            button.setTitle(buttonTitleString, for: .normal)
        }
        
        button.changeBorder(width: 1, radius: 8, color: buttonBorderColor != nil ? buttonBorderColor : UIColor(red: 89/255, green: 92/255, blue: 245/255, alpha: 1.0))
        
        if borderColor != nil {
            popupView.changeBorder(width: 0, radius: 16, color: borderColor)
        }
        
        if messageColor != nil {
            messageLabel.textColor = messageColor
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
