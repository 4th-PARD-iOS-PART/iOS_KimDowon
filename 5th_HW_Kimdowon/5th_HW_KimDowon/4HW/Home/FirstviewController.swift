import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    private let tableViewUI: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        tableView.backgroundColor = .black
        return tableView
    }()
    func numberOfSections(in tableView: UITableView) -> Int {
        return MockData.modeling.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else {
            return UITableViewCell()
        }
        cell.items = MockData.modeling[indexPath.section]
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.textColor = .white
        headerLabel.font = UIFont.boldSystemFont(ofSize: 20)
        headerView.backgroundColor = .black
        
        switch section {
        case 0: headerLabel.text = "Popular on Netflix"
        case 1: headerLabel.text = "Trending Now"
        case 2: headerLabel.text = "Top 10 in Nigeria Today"
        default: headerLabel.text = "My lists"
        }
        
        headerView.addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            headerLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
        
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationController?.setNavigationBarHidden(true, animated: false)
        tableViewUI.dataSource = self
        tableViewUI.delegate = self
        tableViewUI.register(DemoCell.self, forCellReuseIdentifier: "Cell")
        setUI()
    }
    
    func setUI() {
        let scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()
        
        let contentView: UIView = {
            let contentView = UIView()
            contentView.translatesAutoresizingMaskIntoConstraints = false
            return contentView
        }()
        
        let netflixLogoImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: "netflix_logo")
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
        let tvShowsLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "TV Shows"
            label.textColor = .white
            label.font = .systemFont(ofSize: 20)
            return label
        }()
        
        let moviesLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Movies"
            label.textColor = .white
            label.font = .systemFont(ofSize: 20)
            return label
        }()
        
        let myListsLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "My Lists"
            label.textColor = .white
            label.font = .systemFont(ofSize: 20)
            return label
        }()
        
        let backgroundImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: "Crimecity")
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
        
        let myListButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("My list", for: .normal)
            button.setImage(UIImage(systemName: "plus"), for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.tintColor = .white
            return button
        }()
        let playbutton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Play", for: .normal)
            button.setImage(UIImage(systemName: "play"), for: .normal)
            button.backgroundColor = .lightGray
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 10
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
            return button
        }()
        let infobutton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("info", for: .normal)
            button.setImage(UIImage(systemName: "information"), for: .normal)
            return button
        }()
        let firsttitle: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Popular on Netflix"
            label.font = UIFont.systemFont(ofSize: 100, weight: .bold)
            label.textColor = .white
            return label
        }()
        let secondtitle: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Trending Now"
            label.font = UIFont.systemFont(ofSize: 100, weight: .bold)
            label.textColor = .white
            return label
        }()
        let thirdtitle: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Top 10 in Nigeria Today"
            label.font = UIFont.systemFont(ofSize: 100, weight: .bold)
            label.textColor = .white
            return label
        }()
        let forthtitle: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "My list"
            label.font = UIFont.systemFont(ofSize: 100, weight: .bold)
            label.textColor = .white
            return label
        }()
        let fifthtitle: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "African Movies"
            label.font = UIFont.systemFont(ofSize: 100, weight: .bold)
            label.textColor = .white
            return label
        }()
        let sixthtitle: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Nollywood movies & TV"
            label.font = UIFont.systemFont(ofSize: 100, weight: .bold)
            label.textColor = .white
            return label
        }()

        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(netflixLogoImageView)
        contentView.addSubview(tvShowsLabel)
        contentView.addSubview(moviesLabel)
        contentView.addSubview(myListsLabel)
        contentView.addSubview(myListButton)
        contentView.addSubview(playbutton)
        contentView.addSubview(infobutton)
        contentView.addSubview(tableViewUI)
       

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor, constant: 0),

            backgroundImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            backgroundImageView.heightAnchor.constraint(equalTo: backgroundImageView.widthAnchor, multiplier: 9.0/16.0),

            netflixLogoImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 16),
            netflixLogoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            netflixLogoImageView.widthAnchor.constraint(equalToConstant: 50),
            netflixLogoImageView.heightAnchor.constraint(equalToConstant: 50),
            
            tvShowsLabel.centerYAnchor.constraint(equalTo: netflixLogoImageView.centerYAnchor),
            tvShowsLabel.leadingAnchor.constraint(equalTo: netflixLogoImageView.trailingAnchor, constant: 16),
            
            moviesLabel.centerYAnchor.constraint(equalTo: netflixLogoImageView.centerYAnchor),
            moviesLabel.leadingAnchor.constraint(equalTo: tvShowsLabel.trailingAnchor, constant: 30),
            
            myListsLabel.centerYAnchor.constraint(equalTo: netflixLogoImageView.centerYAnchor),
            myListsLabel.leadingAnchor.constraint(equalTo: moviesLabel.trailingAnchor, constant: 30),
            
            myListButton.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 20),
            myListButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            
            playbutton.centerYAnchor.constraint(equalTo: myListButton.centerYAnchor),
            playbutton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            playbutton.heightAnchor.constraint(equalToConstant: 50),
            playbutton.widthAnchor.constraint(equalToConstant: 150),
            
            infobutton.centerYAnchor.constraint(equalTo: myListButton.centerYAnchor),
            infobutton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            
            tableViewUI.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 200),
            tableViewUI.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableViewUI.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableViewUI.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            

        ])

    }
    
    
    }



class CollectionTableViewCell: UITableViewCell {
    static let identifier = "CollectionTableViewCell"
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 120, height: 180)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .black
        return collectionView
    }()
    
    var items: [MockDataItem] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionCell")
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath)
        

        let imageView = UIImageView(image: UIImage(named: items[indexPath.row].name))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        cell.contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor)
        ])
        
        return cell
    }
}
