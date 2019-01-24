//
//  ViewController.swift
//  RxSwift_Test
//
//  Created by Takafumi Ogaito on 2019/01/24.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let helloWorldSubject = PublishSubject<String>()
        
        helloWorldSubject
            .subscribe(onNext: { (message) in
                print("onNext: \(message)")
            }, onCompleted: {
                print("onCompleted")
            }) {
                print("onDisposed")
        }.disposed(by: disposeBag)
        
        helloWorldSubject.onNext("Hello World!")
        helloWorldSubject.onNext("Hello World!!")
        helloWorldSubject.onNext("Hello World!!!")
        helloWorldSubject.onCompleted()
    }


}

