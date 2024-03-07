import Foundation
import UIKit

extension UIResponder {
    @objc
    var isExposedToAssistiveTech: Bool {
        if shouldForceExposeToAssistiveTech || isAccessibilityElement {
            if allItemsInResponderChain.contains(where: { $0.isExposedToAssistiveTech }) == true {
                return false
            } else {
                return true
            }
        } else {
            return false
        }
    }

    private var hasBlockingElementInResponderChain: Bool {
        allItemsInResponderChain.contains(where: { item in
            item.isExposedToAssistiveTech || (item as? UIView)?.isHidden == true
        })
    }

    /// bool 값은 요소가 보조 기술에 노출되었음을 나타냅니다
    /// ' is Accessibility Element'가 거짓인 경우에도
    ///
    /// 표준 UIKit Controlst는 '숨겨진' 값이 사실일 때 보조 기술에 노출되지 않습니다
    var shouldForceExposeToAssistiveTech: Bool {
        guard let view = self as? UIView else { return false }
        return view.isStandardUIKitControl && view.isHidden == false
    }

    /// 부울 값은 요소가 표준 UIKit Control임을 나타냅니다
    ///
    /// 표준 UIKit Controlst는 'isAccessibilityElement' 값이 거짓이어도 Assistive Technology에 노출됩니다
    var isStandardUIKitControl: Bool {
        (self is UIProgressView) ||
            (self is UILabel) ||
            (self is UIButton) ||
            (self is UISlider) ||
            (self is UISwitch) ||
            (self is UITextView) ||
            (self is UIActivityIndicatorView) ||
            (self is UIStepper) ||
            (self is UISegmentedControl) ||
            (self is UITextField)
    }

    var allItemsInResponderChain: [UIResponder] {
        var chain = [UIResponder]()
        var nextResponder = next
        while nextResponder != nil {
            chain.append(nextResponder!)
            nextResponder = nextResponder?.next
        }
        return chain
    }
}

extension UIView {
    @objc override var isExposedToAssistiveTech: Bool {
        if isHidden {
            return false
        } else if allItemsInResponderChain.compactMap({ $0 as? UIView }).contains(where: { $0.isHidden }) {
            return false
        } else {
            return super.isExposedToAssistiveTech
        }
    }
}
