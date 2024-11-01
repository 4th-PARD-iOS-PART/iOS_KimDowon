//
//  ModalViewController.swift
//  6th_HW_Kimdowon
//
//  Created by 김도원 on 11/1/24.
//

import UIKit

class ModalViewController: UIViewController {
    var onSave: ((String, Int, String) -> Void)?
    
    private let nameField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "이름을 입력해 주세요"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let ageField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "나이를 입력해 주세요"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad // 나이는 숫자만 입력
        return textField
    }()
    
    private let partField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "파트를 입력해 주세요"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("추가하기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
    }
    
    private func setUI() {
        view.addSubview(nameField)
        view.addSubview(ageField)
        view.addSubview(partField)
        view.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            
            nameField.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            ageField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 20),
            ageField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ageField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            partField.topAnchor.constraint(equalTo: ageField.bottomAnchor, constant: 20),
            partField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            partField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            addButton.topAnchor.constraint(equalTo: partField.bottomAnchor, constant: 20),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    @objc private func addButtonTapped() {
        guard let name = nameField.text, !name.isEmpty,
              let part = partField.text, !part.isEmpty,
              let ageText = ageField.text, let age = Int(ageText), !ageText.isEmpty
        else {
            // 입력값이 유효하지 않은 경우 에러 메시지 출력
            print("모든 텍스트를 올바르게 입력해 주세요.")
            return
        }
        
        onSave?(name, age, part) // 콜백 호출하여 데이터 전달
        dismiss(animated: true, completion: nil) // 모달 종료
    }
}
