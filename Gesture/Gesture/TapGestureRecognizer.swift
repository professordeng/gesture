//
//  TapGestureRecognizer.swift
//  Gesture
//
//  Created by deng on 2021/6/7.
//

import UIKit

class TapGestureRecognizer: UITapGestureRecognizer {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        print("\(self.name!) : touch begin")
        super.touchesBegan(touches, with: event)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        print("\(self.name!) : touch moved")
        super.touchesMoved(touches, with: event)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        print("\(self.name!) : touch ended (\(self.state))")
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesCancelled(touches, with: event)
        print("\(self.name!) : touch canceled (\(self.state.rawValue)) ")
    }
}
