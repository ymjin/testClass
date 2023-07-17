//
//  TitleMessageAVC.swift
//  testClass
//
//  Created by Youngmin Jin on 2023/07/17.
//

import UIKit

@available(iOS 11.0, *)
class TitleMessageAVC: BaseAVC {

    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var messageLabel:UILabel!
    @IBOutlet var button:UIButton!
    
    public var titleString:String!
    public var titleColor:UIColor!
    public var titleFont:UIFont!
    public var titleFontSize:CGFloat!
    public var titleAttributedString:NSAttributedString!
    
    public var messageString:String!
    public var messageColor:UIColor!
    public var messageFont:UIFont!
    public var messageFontSize:CGFloat!
    public var messageAttributedString:NSAttributedString!
    
    public var buttonTitleString:String!
    public var buttonBorderColor:UIColor!
    public var buttonNormalColor:UIColor!
    public var buttonHighlightedColor:UIColor!
    public var buttonSelectedColor:UIColor!
    public var buttonDisabledColor:UIColor!
    public var buttonBorderRadius:CGFloat!
    public var buttonBorderWidth:CGFloat!
    public var buttonAttributedString:NSAttributedString!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func initLayout() {
        super.initLayout()

        if borderColor != nil {
            popupView.changeBorder(width: 0, radius: 16, color: borderColor)
        }
        
        setTitleAttribution()
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
    
    func setTitleAttribution() {
        if titleString != nil {
            titleLabel.text = titleString
        }
        
        if titleFont != nil {
            titleLabel.font = titleFont
        }
        else {
            if titleColor != nil {
                titleLabel.textColor = titleColor
            }
            
            if titleFontSize != nil {
                titleLabel.font = UIFont.systemFont(ofSize: titleFontSize)
            }
        }
        
        if titleAttributedString != nil {
            titleLabel.attributedText = titleAttributedString
        }
    }

    func setMessageAttribution() {
        if messageString != nil {
            messageLabel.text = messageString
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
        
        if messageAttributedString != nil {
            messageLabel.attributedText = messageAttributedString
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
        
        if buttonAttributedString != nil {
            button.titleLabel?.attributedText = buttonAttributedString
        }
    }
}
