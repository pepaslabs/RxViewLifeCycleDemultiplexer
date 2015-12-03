//
//  RxViewLifeCycleDemultiplexer.swift
//  See https://github.com/pepaslabs/RxViewLifeCycleDemultiplexer
//
//  Created by Jason Pepas on 11/29/15.
//  Copyright © 2015 Jason Pepas. All rights reserved.
//
//  Released under the terms of the MIT License.
//  See https://opensource.org/licenses/MIT

import UIKit

class RxViewLifeCycleDemultiplexer: ViewLifeCycleDemultiplexer, ModalViewLifeCycleProtocol, NavigationViewLifeCycleProtocol
{
    var rx_viewWillAppear: Observable<Bool> {
        return _viewWillAppearSubject.asObservable()
    }
    
    var rx_viewDidAppear: Observable<Bool> {
        return _viewDidAppearSubject.asObservable()
    }
    
    var rx_viewWillDisappear: Observable<Bool> {
        return _viewWillDisappearSubject.asObservable()
    }
    
    var rx_viewDidDisappear: Observable<Bool> {
        return _viewDidDisappearSubject.asObservable()
    }
    
    // MARK: - ModalViewLifeCycleProtocol observables

    var rx_viewWillGetPresented: Observable<Bool> {
        return _viewWillGetPresentedSubject.asObservable()
    }
    
    var rx_viewDidGetPresented: Observable<Bool> {
        return _viewDidGetPresentedSubject.asObservable()
    }

    var rx_viewWillGetDismissed: Observable<Bool> {
        return _viewWillGetDismissedSubject.asObservable()
    }
    
    var rx_viewDidGetDismissed: Observable<Bool> {
        return _viewDidGetDismissedSubject.asObservable()
    }

    var rx_viewWillDisappearBeneathModal: Observable<Bool> {
        return _viewWillDisappearBeneathModalSubject.asObservable()
    }
    
    var rx_viewDidDisappearBeneathModal: Observable<Bool> {
        return _viewDidDisappearBeneathModalSubject.asObservable()
    }

    var rx_viewWillReappearFromBeneathModal: Observable<Bool> {
        return _viewWillReappearFromBeneathModalSubject.asObservable()
    }

    var rx_viewDidReappearFromBeneathModal: Observable<Bool> {
        return _viewDidReappearFromBeneathModalSubject.asObservable()
    }
    
    // MARK: - NavigationViewLifeCycleProtocol observables
    
    var rx_viewWillGetPushed: Observable<Bool> {
        return _viewWillGetPushedSubject.asObservable()
    }
    
    var rx_viewDidGetPushed: Observable<Bool> {
        return _viewDidGetPushedSubject.asObservable()
    }
    
    var rx_viewWillGetPopped: Observable<Bool> {
        return _viewWillGetPoppedSubject.asObservable()
    }
    
    var rx_viewDidGetPopped: Observable<Bool> {
        return _viewDidGetPoppedSubject.asObservable()
    }

    var rx_viewWillDisappearBeneathNavStack: Observable<Bool> {
        return _viewWillDisappearBeneathNavStackSubject.asObservable()
    }

    var rx_viewDidDisappearBeneathNavStack: Observable<Bool> {
        return _viewDidDisappearBeneathNavStackSubject.asObservable()
    }
    
    var rx_viewWillReappearFromBeneathNavStack: Observable<Bool> {
        return _viewWillReappearFromBeneathNavStackSubject.asObservable()
    }
    
    var rx_viewDidReappearFromBeneathNavStack: Observable<Bool> {
        return _viewDidReappearFromBeneathNavStackSubject.asObservable()
    }
    
    init()
    {
        super.init(modalDelegate: nil, navDelegate: nil)
        modalDelegate = self
        navDelegate = self
    }

    private let _viewWillAppearSubject = PublishSubject<Bool>()
    private let _viewDidAppearSubject = PublishSubject<Bool>()
    private let _viewWillDisappearSubject = PublishSubject<Bool>()
    private let _viewDidDisappearSubject = PublishSubject<Bool>()

    private let _viewWillGetPresentedSubject = PublishSubject<Bool>()
    private let _viewDidGetPresentedSubject = PublishSubject<Bool>()
    private let _viewWillGetDismissedSubject = PublishSubject<Bool>()
    private let _viewDidGetDismissedSubject = PublishSubject<Bool>()
    private let _viewWillDisappearBeneathModalSubject = PublishSubject<Bool>()
    private let _viewDidDisappearBeneathModalSubject = PublishSubject<Bool>()
    private let _viewWillReappearFromBeneathModalSubject = PublishSubject<Bool>()
    private let _viewDidReappearFromBeneathModalSubject = PublishSubject<Bool>()

    private let _viewWillGetPushedSubject = PublishSubject<Bool>()
    private let _viewDidGetPushedSubject = PublishSubject<Bool>()
    private let _viewWillGetPoppedSubject = PublishSubject<Bool>()
    private let _viewDidGetPoppedSubject = PublishSubject<Bool>()
    private let _viewWillDisappearBeneathNavStackSubject = PublishSubject<Bool>()
    private let _viewDidDisappearBeneathNavStackSubject = PublishSubject<Bool>()
    private let _viewWillReappearFromBeneathNavStackSubject = PublishSubject<Bool>()
    private let _viewDidReappearFromBeneathNavStackSubject = PublishSubject<Bool>()

    override func viewWillAppear(viewController vc: UIViewController, animated: Bool) {
        super.viewWillAppear(viewController: vc, animated: animated)
        _viewWillAppearSubject.on(.Next(animated))
    }
    
    override func viewDidAppear(viewController vc: UIViewController, animated: Bool) {
        super.viewDidAppear(viewController: vc, animated: animated)
        _viewDidAppearSubject.on(.Next(animated))
    }
    
    override func viewWillDisappear(viewController vc: UIViewController, animated: Bool) {
        super.viewWillDisappear(viewController: vc, animated: animated)
        _viewWillDisappearSubject.on(.Next(animated))
    }
    
    override func viewDidDisappear(viewController vc: UIViewController, animated: Bool) {
        super.viewDidDisappear(viewController: vc, animated: animated)
        _viewDidDisappearSubject.on(.Next(animated))
    }
    
    // MARK: - ModalViewLifeCycleProtocol

    func viewWillGetPresented(animated: Bool)
    {
        _viewWillGetPresentedSubject.on(.Next(animated))
    }
    
    func viewDidGetPresented(animated: Bool)
    {
        _viewDidGetPresentedSubject.on(.Next(animated))
    }
    
    func viewWillGetDismissed(animated: Bool)
    {
        _viewWillGetDismissedSubject.on(.Next(animated))
    }
    
    func viewDidGetDismissed(animated: Bool)
    {
        _viewDidGetDismissedSubject.on(.Next(animated))
    }
    
    func viewWillDisappearBeneathModal(animated: Bool)
    {
        _viewWillDisappearBeneathModalSubject.on(.Next(animated))
    }
    
    func viewDidDisappearBeneathModal(animated: Bool)
    {
        _viewDidDisappearBeneathModalSubject.on(.Next(animated))
    }
    
    func viewWillReappearFromBeneathModal(animated: Bool)
    {
        _viewWillReappearFromBeneathModalSubject.on(.Next(animated))
    }
    
    func viewDidReappearFromBeneathModal(animated: Bool)
    {
        _viewDidReappearFromBeneathModalSubject.on(.Next(animated))
    }
    
    // MARK: - NavigationViewLifeCycleProtocol
    
    func viewWillGetPushed(animated: Bool)
    {
        _viewWillGetPushedSubject.on(.Next(animated))
    }
    
    func viewDidGetPushed(animated: Bool)
    {
        _viewDidGetPushedSubject.on(.Next(animated))
    }
    
    func viewWillGetPopped(animated: Bool)
    {
        _viewWillGetPoppedSubject.on(.Next(animated))
    }
    
    func viewDidGetPopped(animated: Bool)
    {
        _viewDidGetPoppedSubject.on(.Next(animated))
    }
    
    func viewWillDisappearBeneathNavStack(animated: Bool)
    {
        _viewWillDisappearBeneathNavStackSubject.on(.Next(animated))
    }
    
    func viewDidDisappearBeneathNavStack(animated: Bool)
    {
        _viewDidDisappearBeneathNavStackSubject.on(.Next(animated))
    }
    
    func viewWillReappearFromBeneathNavStack(animated: Bool)
    {
        _viewWillReappearFromBeneathNavStackSubject.on(.Next(animated))
    }
    
    func viewDidReappearFromBeneathNavStack(animated: Bool)
    {
        _viewDidReappearFromBeneathNavStackSubject.on(.Next(animated))
    }
}
