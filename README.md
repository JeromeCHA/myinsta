# myinsta

This project is a sample of my own vision of iOS architecture (VIPER + Rx + Moya). I used Instagram API. You will find the test account down below.

### Developed in
* Swift 3
* iOS 9.0+

### In this project, I used
* [VIPER Architecture](https://www.objc.io/issues/13-architecture/viper/)
![viper](https://cdn-images-1.medium.com/max/800/1*0pN3BNTXfwKbf08lhwutag.png)

With the VIPER architecture, we need to init all piece of blocks before calling the ViewController. That is the reason why, everything is done in the router. That means, if you need to call a ViewController, you have to call the router.

Here is an example :

```swift
// in my HomeRouter.swift

var homeViewController : HomeViewController?

func getInitViewController() -> HomeViewController? {
    self.homeViewController = super.getUIViewControllerFromStoryboard(storyboardName: Constantes.Storyboards.kMain, viewControllerName: Constantes.ViewControllers.kHome) as? HomeViewController
    self.initViper()
    return self.homeViewController
}

fileprivate func initViper() {
    let presenter = HomePresenter()
    let getMediaRecentInteractor = GetMediaRecentInteractor()
    
    presenter.router = self
    presenter.viewDelegate = self.homeViewController
    presenter.getMediaRecentInteractor = getMediaRecentInteractor
    
    self.homeViewController?.presenter = presenter
}
```

And later :

```swift
// if you want to go to the Home, Do in your
if let homeViewController = HomeRouter().getInitViewController() {
  self.currentViewController.present(homeViewController, animated: true, completion: nil)
}
```

* [RxSwift](http://reactivex.io/)

In this architecture, I used VIPER and RX. Therefore, each interactor will create an observable, and the observer is the presenter.
This will avoir multiple callback/delegate.

* [Alamofire](https://github.com/Alamofire/Alamofire)
* [Moya](https://github.com/Moya/Moya)
* [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper)

### Account for testing / ! \ Please use this account / ! \
* login: jeromechatest
* password : jeromechatest1234

### Features in this app
* Get recents media
* Get user profile datas
* 3d touch to preview pictures

### Notes
* This project doesn't handle instagram video yet
* In this project I used a GlobalRouter to avoid duplicated codes to managed redirects
* I used a GlobalViewController too in order to manage a custom navigation bar
