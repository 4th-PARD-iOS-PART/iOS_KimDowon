import UIKit

class ThirdViewController: UIViewController {
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .gray
        imageView.image = UIImage(named: "DOWNLOAD1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Movies and TV shows that you\ndownload appear here."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let downloadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Find Something to Download", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        
        view.addSubview(iconImageView)
        view.addSubview(messageLabel)
        view.addSubview(downloadButton)
        
        NSLayoutConstraint.activate([
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            iconImageView.widthAnchor.constraint(equalToConstant: 250),
            iconImageView.heightAnchor.constraint(equalToConstant: 250),
            
            messageLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 20),
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            downloadButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 100),
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.widthAnchor.constraint(equalToConstant: 250),
            downloadButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
