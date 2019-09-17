//
//  NetworkError.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 16/09/19.
//  Copyright © 2019 Optimize 7. All rights reserved.
//

import Foundation

enum NetworkError: String, Error {
    case parametersNil = "Parameters were nil."
    case encodingFailed = "Parameters encoding failed."
    case missingURL = "URL is nil."
}
