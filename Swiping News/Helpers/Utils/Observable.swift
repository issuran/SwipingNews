//
//  Observable.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 17/09/19.
//  Copyright © 2019 Optimize 7. All rights reserved.
//

import Foundation

class Observable<T> {
    private var _value: T?
    var didChange: ((T) -> Void)?
    var value: T {
        set {
            _value = newValue
            didChange?(_value!)
        }
        get {
            return _value!
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    deinit {
        _value = nil
        didChange = nil
    }
}
