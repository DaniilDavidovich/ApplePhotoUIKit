
import UIKit

class TabBarController: UITabBarController {
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
        setupTabBarViewControllers()
    }
    
    // MARK: - Setup
    func setupTabBarController() {
        tabBar.tintColor = .systemBlue
        
        // for transmitions to tabBarController
        if #available(iOS 15.0, *) {
            let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
    
    func setupTabBarViewControllers() {
        let libraryViewController = UINavigationController(rootViewController: LibraryTabBarItem())
        let iconForLibrary = UITabBarItem(title: "Library", image: UIImage(systemName: "photo.on.rectangle"), selectedImage: UIImage(systemName: "photo.on.rectangle"))
        libraryViewController.tabBarItem = iconForLibrary
        
        let forYouViewController = UINavigationController(rootViewController:ForYouTabBarItem())
        let iconForForYou = UITabBarItem(title: "For You", image: UIImage(systemName: "heart.text.square.fill"), selectedImage: UIImage(systemName: "heart.text.square.fill"))
        forYouViewController.tabBarItem = iconForForYou
        
        let albumsViewController = UINavigationController(rootViewController: AlbumsTabBorItem())
        let iconForForAlbums = UITabBarItem(title: "Albums", image: UIImage(systemName: "rectangle.stack.fill"), selectedImage: UIImage(systemName: "rectangle.stack.fill"))
        albumsViewController.tabBarItem = iconForForAlbums
        
        let searchViewController = UINavigationController(rootViewController:SearchTabBarItem())
        let iconForForSearch = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        searchViewController.tabBarItem = iconForForSearch
        
        let conrollers = [libraryViewController, forYouViewController, albumsViewController, searchViewController]
        self.setViewControllers(conrollers, animated: true)
    }
}
