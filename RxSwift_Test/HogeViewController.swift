//
//  HogeViewController.swift
//  RxSwift_Test
//
//  Created by Takafumi Ogaito on 2019/01/24.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HogeViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private var viewModel: HogeViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = HogeViewModel()
        
        viewModel.helloWorldObservable
            .subscribe(onNext: { value in
                print("value = \(value)")
            }).disposed(by: disposeBag)
        
        viewModel.updateItem()
    }

}

class HogeViewModel {
    
    private let helloWorldSubject = PublishSubject<String>()
    
    var helloWorldObservable: Observable<String> {
        return helloWorldSubject.asObservable()
    }
    
    func updateItem() {
        helloWorldSubject.onNext("Hello World!")
        helloWorldSubject.onCompleted()
    }
}
