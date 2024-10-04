import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    func setTabBar() {
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        let vc3 = UINavigationController()
        let vc4 = UINavigationController(rootViewController: ThirdViewController())
        let vc5 = UINavigationController()
        
        self.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        self.tabBar.tintColor = .white
        self.tabBar.backgroundColor = .gray
        
        
        guard let tabBarItems = self.tabBar.items else {return}
        tabBarItems[0].image = UIImage(named: "home")
        tabBarItems[1].image = UIImage(named: "magnifier")
        tabBarItems[2].image = UIImage(named: "gallery")
        tabBarItems[3].image = UIImage(named: "download")
        tabBarItems[4].image = UIImage(named: "menu")
        tabBarItems[0].title = "Home"
        tabBarItems[1].title = "Search"
        tabBarItems[2].title = "Comming Soon"
        tabBarItems[3].title = "Downloads"
        tabBarItems[4].title = "More"
    }


}

