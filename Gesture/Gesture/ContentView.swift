//
//  ContentView.swift
//  Gesture
//
//  Created by deng on 2021/6/7.
//

import UIKit

class ContentView: UIView {
    let tableView = UITableView()
    let gestureView = UIView()

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

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("hitTest withEvent : 进入 Content View")
        let view = super.hitTest(point, with: event)
        print("hitTest withEvent : 离开 Content View \(String(describing: view))")
        return view
    }
}


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
