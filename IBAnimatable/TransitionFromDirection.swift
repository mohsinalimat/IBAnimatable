//
//  Copyright © 2016 Jake Lin. All rights reserved.
//

import UIKit

/**
TransitionFromDirection: convert from direction to CATransition Subtype used in `CATransition`
*/
public enum TransitionFromDirection {
  case Left
  case Right
  case Top
  case Bottom
  case Forward
  case Backward
  
  var stringValue: String {
    switch self {
    case .Left:
      return kCATransitionFromLeft
    case .Right:
      return kCATransitionFromRight
    case .Top:
      // The actual transition direction is oposite, need to reverse
      return kCATransitionFromBottom
    case .Bottom:
      // The actual transition direction is oposite, need to reverse
      return kCATransitionFromTop
    default:
      return ""
    }
  }
  
  var isHorizontal: Bool {
    return self == .Left || self == .Right
  }
}
