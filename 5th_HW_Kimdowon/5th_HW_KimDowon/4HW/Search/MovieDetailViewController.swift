//
//  MovieDetailViewController.swift
//  4HW
//
//  Created by 김도원 on 10/22/24.

import UIKit

class movieDetailViewController: UIViewController {
    
    var movieTitle: String?
    var movieImageName: String?
    
    let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
        
        // 영화 제목과 이미지를 설정합니다.
        titleLabel.text = movieTitle
        if let imageName = movieImageName {
            movieImageView.image = UIImage(named: imageName)
        }
    }
    
    func setupViews() {
        view.addSubview(movieImageView)
        view.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            movieImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieImageView.widthAnchor.constraint(equalToConstant: 200),
            movieImageView.heightAnchor.constraint(equalToConstant: 300),
            
            titleLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

