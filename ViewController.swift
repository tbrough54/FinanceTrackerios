//
//  ViewController.swift
//  FinanceTracker (iOS)
//
//  Created by Thomas Brough on 01/03/2023.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    @@IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UITabBarDelegate {
    
    func tableView( tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UITableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITabBarDelegate {
    
}
