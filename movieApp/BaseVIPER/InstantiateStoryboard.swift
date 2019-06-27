//
//  InstantiateStoryboard.swift
//  movieApp
//
//  Created by Carlos Torres Sanchez on 6/26/19.
//  Copyright © 2019 Carlos Torres Sanchez. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
  
  func instantiateViewController<T: UIViewController>(ofType _: T.Type, withIdentifier identifier: String? = nil) -> T {
    let identifier = identifier ?? String(describing: T.self)
    return instantiateViewController(withIdentifier: identifier) as! T
  }
  
}
