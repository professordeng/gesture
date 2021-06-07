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
        addSubview(tableView)
        addSubview(gestureView)

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "Header")
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

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        32
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header")!
        var config = UIBackgroundConfiguration.listPlainHeaderFooter()
        config.backgroundColor = .red.withAlphaComponent(0.5)
        view.backgroundConfiguration = config
        return view
    }
}

// MARK: -

extension ContentView {
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
