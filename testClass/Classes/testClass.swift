
import UIKit
import RxCocoa
import RxSwift
import ExtensionCollection

open class BaseAppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate  {
    var window:UIWindow?
    
    func storyboard(name:String = "Main") -> UIStoryboard {
        let board = UIStoryboard(name: name, bundle: nil)
        return board
    }
}

@available(iOS 11.0, *)
open class BaseVC:UIViewController {
    let disposeBag = DisposeBag()
    
    func showAlert(name:String, message:String, completion: (() -> Void)? = nil) {
        let alert = getAlertVC(name: name) as! BasicAVC
        alert.message = message
        alert.buttonTitleString = "확인"

        present(alert, animated: true) {
            alert.button.rx.tap.bind {
                if completion != nil {
                    completion!()
                }
                else {
                    self.dismiss(animated: true)
                }
            }.disposed(by: self.disposeBag)
        }
    }

    func getAlertVC(boardName:String = "Alert",  name:String, presentation:UIModalPresentationStyle = .overCurrentContext, transition:UIModalTransitionStyle = .crossDissolve) -> UIViewController {
        
        let viewController = UIStoryboard(name: boardName, bundle: nil).instantiateViewController(withIdentifier: name)
        
        viewController.modalPresentationStyle = presentation
        viewController.modalTransitionStyle = transition

        return viewController
    }
}

@available(iOS 11.0, *)
class BasicAVC: SMAVC {

    // MARK: - IBOutlet
    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var button:UIButton!
    
    // MARK: - Variable
    var message:String = ""
    var buttonTitleString:String = "확인"
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func initLayout() {
        super.initLayout()

        button.changeBorder(width: 1, radius: 8, color: .clear)
        
        if message != "" {
            titleLabel.text = message
        }
        
        button.setTitle(buttonTitleString, for: .normal)
    }
    
    override func buttonClicked() {
        super.buttonClicked()
        
        button.rx.tap.bind {
            self.dismiss(animated: true)
        }.disposed(by: disposeBag)
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


@available(iOS 11.0, *)
class SMAVC: MVAlertViewController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
    
    override func initLayout() {
        super.initLayout()
        
//        if popupView != nil {
//            popupView.changeBorder(width: 0, radius: 16, color: .clear)
//        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    func getAlertVC(boardName:String = "Alert",  name:String, presentation:UIModalPresentationStyle = .overCurrentContext, transition:UIModalTransitionStyle = .crossDissolve) -> UIViewController {
        let viewController = UIStoryboard(name: boardName, bundle: nil).instantiateViewController(withIdentifier: name)
        viewController.modalPresentationStyle = presentation
        viewController.modalTransitionStyle = transition
        
        return viewController
    }
}


@available(iOS 11.0, *)
class MVAlertViewController: UIViewController {
    
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
}
