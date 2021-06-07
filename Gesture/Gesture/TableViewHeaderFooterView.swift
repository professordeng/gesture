//
//  TableViewHeaderFooterView.swift
//  Gesture
//
//  Created by deng on 2021/6/7.
//

import UIKit

class TableViewHeaderFooterView: UITableViewHeaderFooterView {
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        let tap = TapGestureRecognizer(target: self, action: #selector(singleTapGesture))
        tap.name = "\(Self.self) tapGestureRecognizer"
        tap.delegate = self
        self.addGestureRecognizer(tap)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TableViewHeaderFooterView: UIGestureRecognizerDelegate {
    @objc func singleTapGesture() {
        self.backgroundConfiguration?.backgroundColor = .random.withAlphaComponent(0.5)
    }

    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        print("\(Self.self) : gestureRecognizer should begin (\(gestureRecognizer.name!))")
        return true
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        print("\(Self.self) : gestureRecognizer should receive touch (\(gestureRecognizer.name!))")
        return true
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        print("\(Self.self) : gestureRecognizer (\(gestureRecognizer.name!)) (\(otherGestureRecognizer.name ?? "no name"))")
        return true
    }
}

// MARK: -

extension TableViewHeaderFooterView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("\(Self.self) : in hit test")
        let view = super.hitTest(point, with: event)
        print("\(Self.self) : out hit test")
        return view
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let isInside = super.point(inside: point, with: event)
        print("\(Self.self) : point inside (\(isInside))")
        return isInside
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("\(Self.self) : touch begin")
        super.touchesBegan(touches, with: event)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("\(Self.self) : touch moved")
        super.touchesMoved(touches, with: event)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("\(Self.self) : touch ended")
        super.touchesEnded(touches, with: event)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("\(Self.self) : touch canceled")
        super.touchesCancelled(touches, with: event)
    }
}
