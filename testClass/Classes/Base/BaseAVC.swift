//
//  BaseAVC.swift
//  testClass
//
//  Created by Youngmin Jin on 2023/07/13.
//

import Foundation
import RxCocoa
import RxSwift
import ExtensionCollection

public enum AlertType:String {
    /// message + one button
    case style01 = "MessageAVC"
    /// title + message + one button
    case style02 = "TitleMessageAVC"
    /// icon + title + message + one button
    case style03 = "IconTitleMessageAVC"
    
    var name:String {
        return self.rawValue
    }
}

@available(iOS 11.0, *)
open class BaseAVC: UIViewController {
    
    // MARK: - IBoutlet
    @IBOutlet var popupView: UIView!
    
    // MARK: - Variable
    public var bgColor:UIColor!
    public var popupViewBGColor:UIColor!
    public var borderColor:UIColor!
    public var borderWidth:CGFloat!
    public var borderRadius:CGFloat!
    
    var parents:BaseVC!
    let disposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    open override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buttonClicked()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        initLayout()
        setData()
    }
    
    /*
     @description
     - 화면 기본 구성
     @param nil
     @return nil
     */
    func initLayout() {
        view.backgroundColor = bgColor != nil ? bgColor : UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        if popupView != nil {
            popupView.changeBorder(width: borderWidth != nil ? borderWidth : 0, radius: borderRadius != nil ? borderRadius : 16, color: borderColor != nil ? borderColor : .clear)
            popupView.backgroundColor = popupViewBGColor != nil ? popupViewBGColor : .white
        }
    }
    
    /*
     @description
     - Rx를 활용한 버튼 클릭 이벤트
     @param nil
     @return nil
     */
    func buttonClicked() {
        
    }
    
    /*
     @description
     - 화면에 데이터 표시
     @param nil
     @return nil
     */
    func setData() {
        
    }
    
    public func getParents() -> BaseVC {
        return parents
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
