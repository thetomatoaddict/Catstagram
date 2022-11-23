//
//  resisterViewController.swift
//  CatStaGram
//
//  Created by sujin on 2022/11/22.
//

import UIKit

class resisterViewController: UIViewController {
    // properties : 유효성 검사를 위한 프로퍼티
    
    var isValidEmail = false
    
    var isValidName = false
    
    var isValidNickname = false
    
    var isVaildPassword = false
    
    //textfields

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nickNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
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
            print("email")
        case nameTextField:
            print("name")
        case nickNameTextField:
            print("nickname")
        case passwordTextField:
            print("password")
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

}
