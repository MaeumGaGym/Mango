import Foundation
import UIKit

extension UIAccessibilityTraits {
    var descripion: String {
        guard isStandardTraits else { return "" }

        var traits: [String] = []

        if contains(.button) {
            traits.append("button")
        }

        if contains(.link) {
            traits.append("link")
        }

        if contains(.image) {
            traits.append("image")
        }

        if contains(.searchField) {
            traits.append("searchField")
        }

        if contains(.keyboardKey) {
            traits.append("keyboardKey")
        }

        if contains(.staticText) {
            traits.append("staticText")
        }

        if contains(.header) {
            traits.append("header")
        }

        if #available(iOS 10.0, *) {
            if self.contains(.tabBar) {
                traits.append("tabBar")
            }
        }

        if contains(.summaryElement) {
            traits.append("summaryElement")
        }

        if contains(.selected) {
            traits.append("selected")
        }

        if contains(.notEnabled) {
            traits.append("notEnabled")
        }

        if contains(.adjustable) {
            traits.append("adjustable")
        }

        if contains(.allowsDirectInteraction) {
            traits.append("allowsDirectInteraction")
        }

        if contains(.updatesFrequently) {
            traits.append("updatesFrequently")
        }

        if contains(.causesPageTurn) {
            traits.append("causesPageTurn")
        }

        if contains(.playsSound) {
            traits.append("playsSound")
        }

        if contains(.startsMediaSession) {
            traits.append("startsMediaSession")
        }

        return traits.joined(separator: ", ")
    }

    var isStandardTraits: Bool {
        var standardAccessibilityTraits = UIAccessibilityTraits(arrayLiteral: [
            .adjustable, // 슬라이더
            .allowsDirectInteraction, // 다음 페이지 스크롤 여부
            .button, // 버튼 역할
            .causesPageTurn,
            .header, // 섹션 헤더를 나타내며, 주로 테이블 뷰나 컬렉션 뷰에서 사용
            .image, // 이미지 (UIIMageView)
            .keyboardKey, // 키보드
            .link, // 링크 역할
            .none, // 아무 접근성 특성도 없는 상태
            .notEnabled, // 사용하지 않음
            .playsSound, // 소리 재생
            .selected, // 선택된 상태
            .staticText, // 정적 테스트
            .searchField, // 검색 필드 역할
            .summaryElement, // 요약 요소
            .startsMediaSession, // 동영상 재생, 오디오 녹음
            .updatesFrequently, // 알람 보내기
        ])

        if #available(iOS 10, *) {
            standardAccessibilityTraits.insert(.tabBar)
        }
        return isStrictSubset(of: standardAccessibilityTraits)
    }
}
