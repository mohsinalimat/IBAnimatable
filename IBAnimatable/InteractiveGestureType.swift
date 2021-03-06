//
//  Created by Jake Lin on 3/3/16.
//  Copyright © 2016 Jake Lin. All rights reserved.
//

import Foundation

/**
 The interactive gesture type
 */
public enum InteractiveGestureType {
  case Default          // Will use the default interactive gesture type from `AnimatedTransitioning`
  case Pan(fromDirection: GestureDirection)
  case ScreenEdgePan(fromDirection: GestureDirection)
  case Pinch(direction: GestureDirection)
  
  var stringValue: String {
    return String(self)
  }
  
  static func fromString(interactiveGestureType: String) -> InteractiveGestureType? {
    if interactiveGestureType.hasPrefix("Default") {
      return .Default
    } else if interactiveGestureType.hasPrefix("Pan") || interactiveGestureType.hasPrefix("ScreenEdgePan") ||
      interactiveGestureType.hasPrefix("Pinch") {
      return fromStringWithDirection(interactiveGestureType)
    }
    return nil
  }
}

// MARK: - InteractiveGestureType from string

private extension InteractiveGestureType {
  static func cleanInteractiveGestureType(interactiveGestureType: String) -> String {
    let range = interactiveGestureType.rangeOfString("(")
    let interactiveGestureType = interactiveGestureType.stringByReplacingOccurrencesOfString(" ", withString: "")
      .lowercaseString
      .substringFromIndex(range?.startIndex ?? interactiveGestureType.endIndex)
    return interactiveGestureType
  }
  
  static func fromStringWithDirection(interactiveGestureType: String) -> InteractiveGestureType? {
    let gestureDirectionString = cleanInteractiveGestureType(interactiveGestureType).capitalizedString
    
    guard let direction = GestureDirection(rawValue: gestureDirectionString) else {
      return nil
    }
    
    if interactiveGestureType.hasPrefix("Pan") {
      return .Pan(fromDirection: direction)
    } else if interactiveGestureType.hasPrefix("ScreenEdgePan") {
      return .ScreenEdgePan(fromDirection: direction)
    } else if interactiveGestureType.hasPrefix("Pinch") {
      return .Pinch(direction: direction)
    }
    
    return nil
  }

}
