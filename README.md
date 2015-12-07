# RxViewLifeCycleDemultiplexer
An RxSwift wrapper around [ViewLifeCycleDemultiplexer](https://github.com/pepaslabs/ViewLifeCycleDemultiplexer)

## Example Usage

Here is a minimal usage example.  Create a new "Single View Application" iOS project and replace the contents of `ViewController.swift` with the code below.

First, boilerplate to hook everything up:

```swift
class ViewController: UIViewController, ModalViewLifeCycleProtocol, NavigationViewLifeCycleProtocol
{
    let rxDemux = RxViewLifeCycleDemultiplexer()
    let disposeBag = DisposeBag()
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        rxDemux.viewWillAppear(viewController: self, animated: animated)
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        rxDemux.viewDidAppear(viewController: self, animated: animated)
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        rxDemux.viewWillDisappear(viewController: self, animated: animated)
    }
    
    override func viewDidDisappear(animated: Bool)
    {
        super.viewDidDisappear(animated)
        rxDemux.viewDidDisappear(viewController: self, animated: animated)
    }
}
```

Now, you can subscribe to the view lifecycle events you are interested in:

```swift
    override func viewDidLoad()
    {
        super.viewDidLoad()

        rxDemux.rx_viewDidAppear.subscribeNext { (animated) -> Void in
            debugPrint("rx_viewDidAppear")
        }.addDisposableTo(disposeBag)

        rxDemux.rx_viewDidDisappearBeneathModal.subscribeNext { (animated) -> Void in
            debugPrint("rx_viewDidDisappearBeneathModal")
        }.addDisposableTo(disposeBag)
    }
```
