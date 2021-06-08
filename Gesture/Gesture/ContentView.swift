//
//  ContentView.swift
//  Gesture
//
//  Created by deng on 2021/6/7.
//

import UIKit

class ContentView: UIView {
    let tableView = UITableView()
    let gestureView = GestureView()

    init() {
        super.init(frame: .zero)
        makeUI()
        gestureView.tap.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func makeUI() {
        addSubview(tableView)
        addSubview(gestureView)

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(TableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "Header")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate ([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        gestureView.translatesAutoresizingMaskIntoConstraints = false
        gestureView.backgroundColor = .blue.withAlphaComponent(0.5)
        NSLayoutConstraint.activate([
            gestureView.topAnchor.constraint(equalTo: topAnchor),
            gestureView.leadingAnchor.constraint(equalTo: leadingAnchor),
            gestureView.bottomAnchor.constraint(equalTo: bottomAnchor),
            gestureView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
}

// MARK: -

extension ContentView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "单元格"
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        32
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header")!
        (view as? TableViewHeaderFooterView)?.tap.delegate = self
        return view
    }
}

// MARK: -

extension ContentView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("\(Self.self) : in hit test")
        if let view = tableView.sectionAtLocation(self.convert(point, to: tableView)) {
            return view
        }
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

// MARK: -

extension ContentView: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        print("\(Self.self) : gestureRecognizer should receive touch (\(gestureRecognizer.name!))")
        return true
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        print("\(Self.self) : gestureRecognizer (\(gestureRecognizer.name!)) (\(otherGestureRecognizer.name ?? "no name"))")
        return true
    }
}
