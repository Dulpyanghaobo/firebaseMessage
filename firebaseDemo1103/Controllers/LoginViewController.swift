//
//  LoginViewController.swift
//  firebaseDemo1103
//
//  Created by yhb on 2020/11/3.
//

import UIKit
import SnapKit
class LoginViewController: UIViewController {
    
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    private let emailField : UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.returnKeyType = .continue
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.placeholder = "Email Address..."
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        return textField
    }()
    private let passwordFiled : UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.placeholder = "please input password..."
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        textField.isSecureTextEntry = true
        return textField
    }()
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("登录", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return button
    } ()
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置导航栏信息
        title = "登录"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "注册", style: .done, target: self, action: #selector(didTapRegister))
        emailField.delegate = self
        passwordFiled.delegate = self
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordFiled)
        scrollView.addSubview(loginButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        p_setUpUI()
    }
    private func p_setUpUI() {
        scrollView.snp.makeConstraints{(make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0))
        }
        imageView.snp.makeConstraints{(make) in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: view.width/3, height: view.width/3))
            make.top.equalTo(view).offset(UIApplication.statusBarHeight+40)
        }
        emailField.snp.makeConstraints{(make) in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.left.equalTo(view).offset(30)
            make.right.equalTo(view).offset(-30)
            make.height.equalTo(60)
        }
        passwordFiled.snp.makeConstraints{(make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(60)
        }
        loginButton.snp.makeConstraints{(make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordFiled.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.height.equalTo(60)
        }
    }
    @objc private func didTapRegister() {
        let vc = RegisterViewController()
        vc.title = "注册"
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func didTapLogin() {
        emailField.resignFirstResponder()
        passwordFiled.resignFirstResponder()
        guard let email = emailField.text,let password = passwordFiled.text,!email.isEmpty,!password.isEmpty,password.count >= 6 else {
            return alertUserLoginError()
        }
        let vc = ConversationViewController()
        vc.title = "聊天"
        vc.view.backgroundColor = .white
        navigationController?.pushViewController(vc, animated: true)
    }
    func alertUserLoginError () {
        let alert = UIAlertController(title: "error", message: "please re-wirte again", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dissmiss", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
extension LoginViewController :UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            passwordFiled.becomeFirstResponder()
        } else if textField == passwordFiled {
            didTapLogin()
        }
        return true
    }
}
