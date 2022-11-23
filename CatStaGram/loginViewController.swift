//
//  loginViewController.swift
//  CatStaGram
//
//  Created by sujin on 2022/11/22.
//

import UIKit

class loginViewController: UIViewController {
    
    var email = String()
    var password = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        //값이 있을수도 있고 없을 수도 있어서 디폴트값을 ""로 줌
        self.email = text
        print(text)
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.password = text
        print(text)
    }
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        
    }
    @IBAction func resisterButtonDidTap(_ sender: UIButton) {
        //화면전환
        // 1. 스토리보드 상수를 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // 2. 뷰 컨트롤러 상수를 생성
        let ResisterViewController = storyboard.instantiateViewController(withIdentifier: "resisterVC") as! resisterViewController
        // 3. 화면전환 메소드를 이용해서 화면을 전환
        // 세로전환 self.present(ResisterViewController, animated: true, completion: nil)
        // 가로전환 : 네비게이션 컨트롤러 추가 후 아래 코드 삽입
        self.navigationController?.pushViewController(ResisterViewController, animated: true)
    
        
    }
}
