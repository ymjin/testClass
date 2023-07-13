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

@available(iOS 11.0, *)
class BaseAVC: UIViewController {
    
    // MARK: - IBoutlet
    @IBOutlet var popupView: UIView!
    
    // MARK: - Variable
    var parents:BaseVC!
    let disposeBag = DisposeBag()
    var tag:Int = 0
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buttonClicked()
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Custom Function
    /*
     @description
     - 화면 생성
     @param storyBoard 스토리보드 이름
     @param name 생성하고자 하는 화면 이름
     @return 생성된 화면
     */
    func getViewController(boardName:String = "Alert",  name:String) -> UIViewController {
        let viewController = UIStoryboard(name: boardName, bundle: nil).instantiateViewController(withIdentifier: name)
        
        return viewController
    }
    
    func getAlertVC(boardName:String = "Alert",  name:String, presentation:UIModalPresentationStyle = .overCurrentContext, transition:UIModalTransitionStyle = .crossDissolve) -> UIViewController {
        let viewController = UIStoryboard(name: boardName, bundle: nil).instantiateViewController(withIdentifier: name)
        viewController.modalPresentationStyle = presentation
        viewController.modalTransitionStyle = transition
        
        return viewController
    }
}
