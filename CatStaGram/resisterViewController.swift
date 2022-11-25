//
//  resisterViewController.swift
//  CatStaGram
//
//  Created by sujin on 2022/11/22.
//

import UIKit

class resisterViewController: UIViewController {
    // properties : 유효성 검사를 위한 프로퍼티
    
    var isValidEmail = false {
        didSet { //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    var isValidName = false{
        didSet { //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    var isValidNickname = false{
        didSet { //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    var isValidPassword = false{
        didSet { //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    //textfields

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nickNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    // life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()

    }
    
    
    // actions
    
    @objc
    func textFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            self.isValidEmail = text.isValidEmail()
        case nameTextField:
            self.isValidName = text.count > 2
        case nickNameTextField:
            self.isValidNickname = text.count > 2
        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
        default:
            fatalError("Missing Textfield...")
        }
        
    }

    
    
    // helper - textfields 아웃렛들과 textFieldEditingChanged 액션을 연결해줍니다
    private func setupTextField() {
        emailTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        nameTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        nickNameTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
    }
    //사용자가 입력한 회원정보를 확인하고 ui업데이트
    private func validateUserInfo() {
        if isValidEmail
            && isValidName
            && isValidNickname
            && isValidPassword {
            
            self.signUpBtn.isEnabled = true
            UIView.animate(withDuration: 0.33) {
            self.signUpBtn.backgroundColor = UIColor(named: "facebookColor")
            }
        } else {
            self.signUpBtn.isEnabled = false
            UIView.animate(withDuration: 0.33) {
            self.signUpBtn.backgroundColor = UIColor(named: "disabledButtonColor")
            }
            
        }
    }
}


// 정규표현식 유효성검사 로직

extension String {
    //대문자, 소문자, 특수문자, 숫자 포함하여 8자 이상일 때 -> true
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
        
    }
    //이메일 양식 맞으면 -> true
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%=-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}

