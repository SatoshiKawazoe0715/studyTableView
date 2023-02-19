//
//  ViewController.swift
//  Rearrange
//
//  Created by Satoshi Kawazoe on 2023/02/16.
//

import UIKit

class ViewController: UITableViewController {

    var values = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // (5)
        isEditing = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // (3)
            return values.count
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // (4)
            let value = values[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = value
            return cell
        }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
            // (6)
            return true
        }

        override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
            // (7)
            let itemToMove = values.remove(at: sourceIndexPath.row)
            values.insert(itemToMove, at: destinationIndexPath.row)
        }

        override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
            // (8)
            return .none
        }

        override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
            // (9)
            return false
        }
    
}

