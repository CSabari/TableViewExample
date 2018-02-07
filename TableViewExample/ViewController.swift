//
//  ViewController.swift
//  TableViewExample
//
//  Created by SABA on 07/02/18.
//  Copyright © 2018 com.ios.sample. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for i in 0...1000 {
            data.append("\(i)")
        }
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private var data: [String] = []
    
    // Tableview number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Tableview number of rows in sections
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    // Tableview cellforrow at indexpath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as! CustomTableViewCell //1.
        let text = data[indexPath.row] //2.
        cell.label.text = text //3.
        
        if indexPath.row % 2 == 0 {
            cell.contentView.backgroundColor = UIColor.red
        } else {
            cell.contentView.backgroundColor = UIColor.green
        }
        
        return cell //4.
    }
    
    // Tableview didselectrow at indexpath
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Hello", message: "You have selected row \(indexPath.row).", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok" , style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

