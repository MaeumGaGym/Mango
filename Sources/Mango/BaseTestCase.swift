import UIKit
import XCTest

open class BaseTestCase: XCTestCase {
    /// 초기에 주입받아야 할 데이터를 지정합니다
    open func given(_ task: () -> Void) {
        task()
    }

    /// 발생해야 할 이벤트, 또는 메소드 호출등을 실행시킵니다
    open func when(_ task: () -> Void) {
        task()
    }

    /// 결과 값이 기대와 같은지 확인합니다
    open func then(_ task: () -> Void) {
        task()
    }
}
