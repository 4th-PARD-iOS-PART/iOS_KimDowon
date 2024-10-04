import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search for a show, movie, genre, etc."
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.barTintColor = .black
        
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = .lightGray
            textField.textColor = .white
            textField.attributedPlaceholder = NSAttributedString(
                string: "Search for a show, movie, genre, etc.",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
            )
        }
        return searchBar
    }()

    
    let topSearchesLabel: UILabel = {
        let label = UILabel()
        label.text = "Top Searches"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    let movies = [
        ("마약왕", "drugking"),
        ("엑시트", "Exit"),
        ("옥자", "okja"),
        ("조커", "Joker"),
        ("미나리", "minari"),
        ("신세계", "newworld"),
        ("서울의 봄", "springofseoul")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        tableView.rowHeight = 120
    }
    
    func setupViews() {
        view.backgroundColor = .black
        view.addSubview(searchBar)
        view.addSubview(topSearchesLabel)
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        tableView.separatorStyle = .none
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            topSearchesLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16),
            topSearchesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            tableView.topAnchor.constraint(equalTo: topSearchesLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // TableView DataSource and Delegate methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movie = movies[indexPath.row]
        cell.movieTitleLabel.text = movie.0
        cell.movieImageView.image = UIImage(named: movie.1)
        cell.backgroundColor = .darkGray
        return cell
    }
}

// Custom TableView Cell
class MovieCell: UITableViewCell {
    
    let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let playButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "PLAY 1"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(movieImageView)
        addSubview(movieTitleLabel)
        addSubview(playButton)
        
        NSLayoutConstraint.activate([
            movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            movieImageView.widthAnchor.constraint(equalToConstant: 160),
            movieImageView.heightAnchor.constraint(equalToConstant: 120),
            
            movieTitleLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 16),
            movieTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            playButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            playButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            playButton.widthAnchor.constraint(equalToConstant: 40),
            playButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
