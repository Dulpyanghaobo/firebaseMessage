//
//  RegisterViewController.swift
//  firebaseDemo1103
//
//  Created by yhb on 2020/11/3.
//

import UIKit

class RegisterViewController: UIViewController {
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    private let lastNameField : UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.returnKeyType = .continue
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.placeholder = "last name..."
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        return textField
    }()
    private let firstNameField : UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.returnKeyType = .continue
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.placeholder = "first name..."
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        return textField
    }()
    private let emailField : UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.returnKeyType = .continue
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.placeholder = "create your Email Address..."
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
        textField.placeholder = "create input password..."
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        textField.isSecureTextEntry = true
        return textField
    }()
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("注册", for: .normal)
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
        title = "注册"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .done, target: self, action: #selector(didTapRegister))
        emailField.delegate = self
        passwordFiled.delegate = self
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(lastNameField)
        scrollView.addSubview(firstNameField)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordFiled)
        scrollView.addSubview(loginButton)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeProfilePic))
//        gesture.numberOfTouchesRequired =
//            gesture.numberOfTouches =
        imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(gesture)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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
        lastNameField.snp.makeConstraints{(make) in
            make.top.equalTo(imageView.snp.bottom).offset(20)
//            make.centerX.equalToSuperview().offset(-40)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-view.width/2-20)
            make.height.equalTo(60)
        }
        firstNameField.snp.makeConstraints{(make) in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(view.width/2+20)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(60)
        }
        emailField.snp.makeConstraints{(make) in
            make.top.equalTo(lastNameField.snp.bottom).offset(20)
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
        let vc = LoginViewController()
        vc.title = "登录"
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func didTapChangeProfilePic() {
     print("change your profile")
    }
    @objc private func didTapLogin() {
        emailField.resignFirstResponder()
        passwordFiled.resignFirstResponder()
        lastNameField.resignFirstResponder()
        firstNameField.resignFirstResponder()
        guard let email = emailField.text,let password = passwordFiled.text,let firstName = firstNameField.text,let lastName = lastNameField.text,!email.isEmpty,!password.isEmpty,!firstName.isEmpty,!lastName.isEmpty,password.count >= 6 else {
            return alertUserLoginError()
        }
        let vc = LoginViewController()
        vc.title = "登录"
        vc.view.backgroundColor = .white
        navigationController?.pushViewController(vc, animated: true)
    }
    func alertUserLoginError () {
        let alert = UIAlertController(title: "error", message: "please re-wirte again", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dissmiss", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
extension RegisterViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            passwordFiled.becomeFirstResponder()
        } else if textField == passwordFiled {
            didTapLogin()
        }
        return true
    }
}
