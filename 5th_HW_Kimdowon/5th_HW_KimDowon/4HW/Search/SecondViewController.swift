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
    
    // 셀 선택 시 DetailViewController로 모달로 이동
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = movies[indexPath.row]
        let detailViewController = MovieDetailViewController()
        detailViewController.movieTitle = selectedMovie.0
        detailViewController.movieImageName = selectedMovie.1
        
        // 모달로 표시
        detailViewController.modalPresentationStyle = .fullScreen // 전체 화면으로 표시
        present(detailViewController, animated: true, completion: nil) // self.present 대신 present 사용
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

// Detail View Controller
class MovieDetailViewController: UIViewController {

    var movieTitle: String?
    var movieImageName: String?
    
    let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray // Placeholder background color
        return imageView
    }()
    
    let playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "play-large"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "S5:E10 Nothing Remains The Same\nHearts flip as Heather weds Tarek. Jason and Mary grapple with being ghosted. Go solo or take the next step: The agents face life-changing decisions."
        return label
    }()
    
    let netflixLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logos_netflix-icon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let seriesImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "SERIES")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let metadataImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "video metadata bar")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let playButtonLarge: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Image"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.setTitle("   Play", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let downloadButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "download"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 5
        button.setTitle(" Download", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        return button
    }()
    
    let rateImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Vector 1 (Stroke)")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let myListImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "plus")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let shareImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Vector 2 (Stroke)")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let episodeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Frame 3")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let exiticon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "video control buttons")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let TVshareImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tvshare")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
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
        view.addSubview(playButton)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(netflixLogo)
        view.addSubview(seriesImage)
        view.addSubview(metadataImage)
        view.addSubview(playButtonLarge)
        view.addSubview(downloadButton)
        view.addSubview(rateImage)
        view.addSubview(myListImage)
        view.addSubview(shareImage)
        view.addSubview(episodeImage)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // 영화 이미지뷰
            movieImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            movieImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            movieImageView.heightAnchor.constraint(equalToConstant: 200),
            
            // 플레이 버튼
            playButton.centerXAnchor.constraint(equalTo: movieImageView.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: movieImageView.centerYAnchor),
            playButton.widthAnchor.constraint(equalToConstant: 50),
            playButton.heightAnchor.constraint(equalToConstant: 50),
            
            // 타이틀
            titleLabel.topAnchor.constraint(equalTo: netflixLogo.bottomAnchor, constant: 5),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            // 설명 텍스트
//            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
//            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            // Netflix 로고
            netflixLogo.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 16),
            netflixLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            // Series 이미지
            seriesImage.leadingAnchor.constraint(equalTo: netflixLogo.trailingAnchor, constant: 8),
            seriesImage.centerYAnchor.constraint(equalTo: netflixLogo.centerYAnchor),
            
            // 메타데이터 이미지
            metadataImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            metadataImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            metadataImage.widthAnchor.constraint(equalToConstant: 190),
            metadataImage.heightAnchor.constraint(equalToConstant: 15),
            
            // 큰 Play 버튼
            playButtonLarge.topAnchor.constraint(equalTo: metadataImage.bottomAnchor, constant: 16),
            playButtonLarge.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButtonLarge.widthAnchor.constraint(equalToConstant: 100),
            playButtonLarge.heightAnchor.constraint(equalToConstant: 40),
            playButtonLarge.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            playButtonLarge.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Download 버튼
            downloadButton.topAnchor.constraint(equalTo: playButtonLarge.bottomAnchor, constant: 8),
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.widthAnchor.constraint(equalToConstant: 100),
            downloadButton.heightAnchor.constraint(equalToConstant: 40),
            downloadButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            downloadButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Rate 이미지
            rateImage.topAnchor.constraint(equalTo: downloadButton.bottomAnchor, constant: 16),
            rateImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            // My List 이미지
            myListImage.leadingAnchor.constraint(equalTo: rateImage.trailingAnchor, constant: 16),
            myListImage.centerYAnchor.constraint(equalTo: rateImage.centerYAnchor),
            
            // Share 이미지
            shareImage.leadingAnchor.constraint(equalTo: myListImage.trailingAnchor, constant: 16),
            shareImage.centerYAnchor.constraint(equalTo: myListImage.centerYAnchor),
            
            // Episode 이미지
            episodeImage.topAnchor.constraint(equalTo: shareImage.bottomAnchor, constant: 16),
            episodeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            episodeImage.widthAnchor.constraint(equalToConstant: 200),
            episodeImage.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
