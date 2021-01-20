//
//  Storyboard.swift
//  Beer
//
//  Created by Ian Pablo on 20/01/21.
//

import Foundation
import UIKit

extension UIStoryboard {
  func instantiateViewController<T>(ofType type: T.Type) -> T {
    return instantiateViewController(withIdentifier: String(describing: type)) as! T
  }
}
