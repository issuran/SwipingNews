//
//  Countries.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 31/12/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

enum Countries {
    case Brasil
    case USA
    
    func country() -> String {
        switch self {
        case .Brasil:
            return "br"
        case .USA:
            return "us"
        }
    }
}
