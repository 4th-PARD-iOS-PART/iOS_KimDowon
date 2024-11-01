//
//  ViewController.swift
//  6th_HW_Kimdowon
//
//  Created by 김도원 on 10/28/24.
//

import UIKit

// 사용자 정보를 위한 구조체 정의
struct MemberInformation: Codable {
    let name: String
    let part: String
    let age: Int
}

class ViewController: UIViewController {
    
    var members: [MemberInformation] = []  // 테이블 뷰에 표시할 멤버 정보 리스트
    let baseURL = "http://ec2-13-209-3-68.ap-northeast-2.compute.amazonaws.com:8080"
    var selectedIndex: Int?
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell") // 기본 셀 사용
        return table
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "URL Session"
        label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("추가하기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(headerLabel)
        view.addSubview(addButton)
        setUI()
        
        tableView.dataSource = self  // 테이블 뷰의 데이터 소스 연결
        tableView.delegate = self    // 테이블 뷰의 델리게이트 연결
        addButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func setUI() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            addButton.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func buttonTapped() {
        let modalVC = ModalViewController()
        modalVC.onSave = { [weak self] name, age, part in
            let member = MemberInformation(name: name, part: part, age: age) // 변경된 부분
            self?.members.append(member)
            self?.tableView.reloadData()
        }
        modalVC.modalPresentationStyle = .formSheet
        present(modalVC, animated: true)
    }
}

// 테이블 뷰 데이터 소스 및 델리게이트 구현
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let member = members[indexPath.row]
        cell.textLabel?.text = "\(member.name) - \(member.part) - \(member.age)"
        return cell
    }
}
