//
//  EndpointType.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 31/12/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit

protocol EndpointType {
    var baseURL: URL { get }
    var path: String { get }
}
