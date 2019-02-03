//
//  TableViewController.swift
//  UITableViewSwipeActions
//
//  Created by Toomas Vahter on 29/01/2019.
//  Copyright © 2019 Augmented Code. All rights reserved.
//

import UIKit

final class TableViewController: UITableViewController {
    
    // MARK: Test Content
    
    enum Item: String, CaseIterable {
        case iconAction = "Icon"
        case leadingAction = "Leading action"
        case leadingDestructiveAction = "Leading destructive action"
        case tooManyLeadingActions = "Too many leading actions"
        case multipleTrailingActions = "Multiple trailing actions"
        case trailingAction = "Trailing action"
        case trailingTableViewDefaultAction = "Trailing table view default action"
        case trailingDestructiveAction = "Trailing destructive action"
    }
    
    let content = Item.allCases.sorted(by: { $0.rawValue < $1.rawValue })
    
    // MARK: Table View Data Source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = content[indexPath.row].rawValue
        return cell
    }
    
    // MARK: Handling Swipe Actions
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let item = content[indexPath.item]
        switch item {
        case .leadingAction:
            let action = UIContextualAction(style: .normal, title: item.rawValue, handler: { [weak self] (action, view, block) in
                self?.showAlert(item.rawValue)
            })
            return UISwipeActionsConfiguration(actions: [action])
        case .leadingDestructiveAction:
            let action = UIContextualAction(style: .destructive, title: item.rawValue, handler: { [weak self] (action, view, block) in
                self?.showAlert(item.rawValue)
            })
            return UISwipeActionsConfiguration(actions: [action])
        case .tooManyLeadingActions:
            let action1 = UIContextualAction(style: .normal, title: "Action1", handler: { [weak self] (action, view, block) in
                self?.showAlert("Action1")
            })
            let action2 = UIContextualAction(style: .normal, title: "Action2", handler: { [weak self] (action, view, block) in
                self?.showAlert("Action2")
            })
            let action3 = UIContextualAction(style: .normal, title: "Action3", handler: { [weak self] (action, view, block) in
                self?.showAlert("Action3")
            })
            let action4 = UIContextualAction(style: .normal, title: "Action4", handler: { [weak self] (action, view, block) in
                self?.showAlert("Action4")
            })
            let action5 = UIContextualAction(style: .normal, title: "Action5", handler: { [weak self] (action, view, block) in
                self?.showAlert("Action5")
            })
            return UISwipeActionsConfiguration(actions: [action1, action2, action3, action4, action5])
        default:
            return nil // nil means default actions
        }
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let item = content[indexPath.item]
        switch item {
        case .iconAction:
            let action = UIContextualAction(style: .normal, title: item.rawValue, handler: { [weak self] (action, view, block) in
                self?.showAlert(item.rawValue)
            })
            action.backgroundColor = UIColor(hue: 0.11, saturation: 0.56, brightness: 0.48, alpha: 1.0)
            action.image = UIImage(named: "Icon")
            return UISwipeActionsConfiguration(actions: [action])
        case .multipleTrailingActions:
            let action1 = UIContextualAction(style: .normal, title: "Action1", handler: { [weak self] (action, view, block) in
                self?.showAlert("Action1")
            })
            action1.backgroundColor = UIColor(hue: 0.56, saturation: 0.56, brightness: 0.55, alpha: 1.0)
            let action2 = UIContextualAction(style: .normal, title: "Action2", handler: { [weak self] (action, view, block) in
                self?.showAlert("Action2")
            })
            action2.backgroundColor = UIColor(hue: 0.35, saturation: 0.33, brightness: 0.55, alpha: 1.0)
            return UISwipeActionsConfiguration(actions: [action1, action2])
        case .trailingAction:
            let action = UIContextualAction(style: .normal, title: item.rawValue, handler: { [weak self] (action, view, block) in
                self?.showAlert(item.rawValue)
            })
            return UISwipeActionsConfiguration(actions: [action])
        case .trailingDestructiveAction:
            let action = UIContextualAction(style: .destructive, title: item.rawValue, handler: { [weak self] (action, view, block) in
                self?.showAlert(item.rawValue)
            })
            return UISwipeActionsConfiguration(actions: [action])
        case .trailingTableViewDefaultAction:
            return nil
        case .leadingAction, .leadingDestructiveAction, .tooManyLeadingActions:
            return UISwipeActionsConfiguration(actions: []) // when returning nil, default actions are shown
        }
    }
    
    private func showAlert(_ title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

