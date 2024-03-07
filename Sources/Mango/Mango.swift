import UIKit

public extension UIView {
    /// 텍스트 형식의 접근성 경험 스냅샷 생성 
    func mangoShot() -> String {
        let descriptions = exposedAccessibleViews().map { element in
            element.accessibilityDescription
        }

        if descriptions.isEmpty {
            return ""
        } else {
            let seperator = "------------------------------------------------------------"
            var description = seperator + "\n"
            description += descriptions.joined(separator: "\n\(seperator)\n")
            description += "\n\(seperator)"
            return description
        }
    }

    // VoiceOver와 같은 보조 기술을 통해 액세스할 수 있는 모든 하위 보기 목록
    func exposedAccessibleViews() -> [UIView] {
        var allCandidate = allSubviews
        allCandidate.insert(self, at: 0)
        return allCandidate.filter { $0.isExposedToAssistiveTech }
    }
}

public extension UIViewController {
    /// 텍스트 형식의 접근성 경험 스냅샷 생성
    func axMangoshot() -> String {
        view.mangoShot()
    }
}

extension UIView {
    /// 뷰 트리의 모든 하위 보기 목록
    var allSubviews: [UIView] {
        return self.subviews.flatMap { [$0] + $0.allSubviews }
    }
}


