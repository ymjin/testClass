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
    public var messageFont:UIFont!
    public var messageFontSize:CGFloat!
    
    public var buttonTitleString:String!
    public var buttonBorderColor:UIColor!
    public var buttonNormalColor:UIColor!
    public var buttonHighlightedColor:UIColor!
    public var buttonSelectedColor:UIColor!
    public var buttonDisabledColor:UIColor!
    public var buttonBorderRadius:CGFloat!
    public var buttonBorderWidth:CGFloat!
    
    // MARK: - Life Cycle
    open override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func initLayout() {
        super.initLayout()

        if borderColor != nil {
            popupView.changeBorder(width: 0, radius: 16, color: borderColor)
        }
        
        setMessageAttribution()
        setButtonAttribution()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setMessageAttribution() {
        if message != nil {
            messageLabel.text = message
        }
        
        if messageFont != nil {
            messageLabel.font = messageFont
        }
        else {
            if messageColor != nil {
                messageLabel.textColor = messageColor
            }
            
            if messageFontSize != nil {
                messageLabel.font = UIFont.systemFont(ofSize: messageFontSize)
            }
        }
    }
    
    func setButtonAttribution() {
        button.changeBorder(width: buttonBorderWidth != nil ? buttonBorderWidth : 1, radius: buttonBorderRadius != nil ? buttonBorderRadius : 8, color: buttonBorderColor != nil ? buttonBorderColor : UIColor(red: 89/255, green: 92/255, blue: 245/255, alpha: 1.0))
        
        if buttonTitleString != nil {
            button.setTitle(buttonTitleString, for: .normal)
        }
        
        if buttonNormalColor != nil {
            button.setTitleColor(buttonNormalColor, for: .normal)
        }
        
        if buttonHighlightedColor != nil {
            button.setTitleColor(buttonNormalColor, for: .highlighted)
        }
        
        if buttonSelectedColor != nil {
            button.setTitleColor(buttonNormalColor, for: .selected)
        }
        
        if buttonDisabledColor != nil {
            button.setTitleColor(buttonNormalColor, for: .disabled)
        }
    }
}
