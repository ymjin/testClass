//
//  BaseVC.swift
//  testClass
//
//  Created by Youngmin Jin on 2023/07/13.
//

import UIKit
import RxCocoa
import RxSwift
import ExtensionCollection

@available(iOS 11.0, *)
open class BaseVC:UIViewController {
    // MARK: - Variable
    let disposeBag = DisposeBag()
    var tap:UITapGestureRecognizer!
    var touchEnable:Bool = true
    
    // MARK: - Life Cycle
    open override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tap = UITapGestureRecognizer(target: self, action: #selector(tapView(sender:)))
        
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
        view.isUserInteractionEnabled = true
        
        if touchEnable {
            view.addGestureRecognizer(tap)
        }
        else {
            view.removeGestureRecognizer(tap)
        }
    }
    
    // MARK: - Custom Function
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    /*
     @description
     - 화면 push
     @param vc push viewcontroller
     @param animated 에니메이션 여부
     @return nil
     */
    func pushViewController(vc:UIViewController, animated:Bool = true) {
        self.navigationController?.pushViewController(vc, animated: animated)
    }
    
    /*
     @description
     - 화면 생성 후 push
     @param name push 할 화면 이름
     @return nil
     */
    func pushViewController(storyBoard:String = "Main", name:String, animated:Bool = true) {
        self.navigationController?.pushViewController(getViewController(storyBoard: storyBoard, name: name), animated: animated)
    }
    
    /*
     @description
     - 화면 생성
     @param storyBoard 스토리보드 이름
     @param name 생성하고자 하는 화면 이름
     @return 생성된 화면
     */
    func getViewController(storyBoard:String = "Main",  name:String) -> UIViewController {
        let viewController = UIStoryboard(name: storyBoard, bundle: nil).instantiateViewController(withIdentifier: name)
        
        return viewController
    }
    
    /*
     @description
     - 모달 화면 생성
     @param storyBoard 스토리보드 이름
     @param name 생성하고자 하는 화면 이름
     @param type modal type
     @return 생성된 화면
     */
    func getModalNavigationController(boardName:String = "Modal", name:String, type: UIModalPresentationStyle = .fullScreen) -> UINavigationController {
        let viewController = UIStoryboard(name: boardName, bundle: nil).instantiateViewController(withIdentifier: name)
        let nv:UINavigationController = UINavigationController(rootViewController: viewController)
        nv.modalPresentationStyle = type
//        (nv.viewControllers[0] as! MVModalViewController).parents = self
        
        return nv
    }
    
    /*
     @description
     - 모달 화면 생성
     @param storyBoard 스토리보드 이름
     @param name 생성하고자 하는 화면 이름
     @param type modal type
     @return 생성된 화면
     */
    func getModalViewController(boardName:String = "Modal", name:String, type: UIModalPresentationStyle = .overFullScreen) -> UIViewController {
        let viewController = UIStoryboard(name: boardName, bundle: nil).instantiateViewController(withIdentifier: name)
        viewController.modalPresentationStyle = type
        viewController.definesPresentationContext = false
//        (viewController as! MVModalViewController).parents = self
        
        return viewController
    }
    
    /*
     @description
     - 키보드 숨김 처리
     @param nil
     @return nil
     */
    func initViewWithHideKeyboard() {
        view.endEditing(true)
        view.frame.origin.y = 0
    }
    
    /*
     @description
     - tap 이벤트 처리
     @param nil
     @return nil
     */
    @objc
    func tapView(sender: UITapGestureRecognizer) {
        view.endEditing(true)
        view.frame.origin.y = 0
    }
    
    /// 팝업 생성
    /// - Parameter type: 팝업 타입
    /// - Returns: 생성된 팝업
    public func getAlertVC(type:AlertType) -> UIViewController {

        let viewController = StoryboardHelper.helper.getAVC(name: type.rawValue)
        viewController!.modalPresentationStyle = .overCurrentContext
        viewController!.modalTransitionStyle = .crossDissolve
        
        return viewController!
    }
    
    /// stype01 팝업
    /// - Parameters:
    ///   - message: 표시할 메시지
    ///   - titleString: 버튼 타이틀
    ///   - completion: 버튼 터치 후 실행할 함수
    public func showAVCStyle01(message:String, buttonTitleString:String = "확인", completion: (() -> Void)? = nil) {
        let alert = getAlertVC(type: .style01) as! MessageAVC
        alert.messageString = message
        alert.buttonTitleString = buttonTitleString

        present(alert, animated: true) {
            alert.button.rx.tap.bind {
                self.dismiss(animated: true) {
                    if completion != nil {
                        completion!()
                    }
                }
            }.disposed(by: self.disposeBag)
        }
    }
    
    
    /// style01 팝업
    /// - Parameters:
    ///   - alert: 팝업 객체
    ///   - completion: 버튼 터치 후 실행 함수
    public func showAVCStyle01(alert:MessageAVC, completion: (() -> Void)? = nil) {
        present(alert, animated: true) {
            alert.button.rx.tap.bind {
                self.dismiss(animated: true) {
                    if completion != nil {
                        completion!()
                    }
                }
            }.disposed(by: self.disposeBag)
        }
    }
    
    public func showAVCStyle03(icon:UIImage = "AVCIcon".toImage(), title:String, message:String, buttonTitleString:String = "확인", completion: (() -> Void)? = nil) {
        let alert = getAlertVC(type: .style03) as! IconTitleMessageAVC
        alert.iconImage = icon
        alert.titleString = title
        alert.messageString = message
        alert.buttonTitleString = buttonTitleString

        present(alert, animated: true) {
            alert.button.rx.tap.bind {
                self.dismiss(animated: true) {
                    if completion != nil {
                        completion!()
                    }
                }
            }.disposed(by: self.disposeBag)
        }
    }
}

public class StoryboardHelper: NSObject {
    public static let helper = StoryboardHelper()

    public lazy var storyboard: UIStoryboard! = UIStoryboard(name: "Alert", bundle: Bundle(for: StoryboardHelper.self))

    public func getAVC(name:String) -> UIViewController! {
        return storyboard.instantiateViewController(withIdentifier: name)
    }
    public func rootController() -> UIViewController! {
        return storyboard.instantiateInitialViewController()
    }
}
