//
//  GestureView.swift
//  Gesture
//
//  Created by deng on 2021/6/7.
//

import UIKit

class GestureView: UIView {
    init() {
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GestureView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("hit test : in \(self)")
        let view = super.hitTest(point, with: event)
        print("hit test : out \(self)")
        return view
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let isInside = super.point(inside: point, with: event)
        print("point inside (\(isInside)) : \(self)")
        return isInside
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch begin : \(self)")
        super.touchesBegan(touches, with: event)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch moved : \(self)")
        super.touchesMoved(touches, with: event)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch ended : \(self)")
        super.touchesEnded(touches, with: event)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch canceled : \(self)")
        super.touchesCancelled(touches, with: event)
    }
}
