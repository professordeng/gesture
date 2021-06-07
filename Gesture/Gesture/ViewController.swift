//
//  ViewController.swift
//  Gesture
//
//  Created by deng on 2021/6/7.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let gestureView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "Header")

        view.addSubview(gestureView)
        gestureView.translatesAutoresizingMaskIntoConstraints = false
        gestureView.backgroundColor = .blue.withAlphaComponent(0.5)
        NSLayoutConstraint.activate([
            gestureView.topAnchor.constraint(equalTo: view.topAnchor),
            gestureView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gestureView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            gestureView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
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
}

