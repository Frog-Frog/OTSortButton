//
//  ViewController.swift
//  DemoApplication
//
//  Created by Tomosuke Okada on 2017/09/14.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

import UIKit

import OTSortButton

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var sortButtonCollection: [OTSortButton]!
    
    @IBOutlet weak var leftSortButton: OTSortButton!
    @IBOutlet weak var centerSortButton: OTSortButton!
    @IBOutlet weak var rightSortButton: OTSortButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataArray = Array<Dictionary<String, String>>()
    
    var sortedArray = Array<Dictionary<String, String>>()
    
    let cellName = "TableViewCell"
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createSampleData()
        prepareSortButton()
        prepareTableView()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: - SampleData
    func createSampleData() {
        
        var date = Date()
        for _ in 0 ..< 30 {
            
            let randomText = generateRandomString(length: 3)
            let randomNumber = String(Int(arc4random_uniform(100)))
            let dateText = String.from(date: date, format: "MM/dd")
            
            let data = [DataKey.String: randomText,
                        DataKey.Number: randomNumber,
                        DataKey.Date: dateText]
            
            dataArray.append(data)
            
            date = Date.difference(days: 1, from: date) ?? Date()
        }
        
        sortedArray = dataArray
    }
    
    func generateRandomString(length: Int) -> String {
        
        let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let upperBound = UInt32(alphabet.characters.count)
        
        return String((0..<length).map { _ -> Character in
            return alphabet[alphabet.index(alphabet.startIndex, offsetBy: Int(arc4random_uniform(upperBound)))]
        })
    }
    
    
    //MARK: - Prepare
    func prepareSortButton() {
        leftSortButton.sortKey = DataKey.String
        centerSortButton.sortKey = DataKey.Number
        rightSortButton.sortKey = DataKey.Date
    }
    
    func prepareTableView() {
        let nib = UINib(nibName: cellName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellName)
    }
    
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! TableViewCell
        
        cell.data = sortedArray[indexPath.row]
        
        return cell
    }
    
    
    //MARK: - IBAction
    @IBAction func tappedSortButton(_ sender: OTSortButton) {
        
        for sortButton in sortButtonCollection {
            if sortButton == sender {
                
                let dataKey = sortButton.sortKey
                
                switch sortButton.sortType {
                case .none:
                    
                    sortButton.sortType = .ascend
                    
                    if sortButton == centerSortButton {
                        sortedArray = dataArray.sorted(by: { Int($0[dataKey]!)! < Int($1[dataKey]!)! })
                    } else {
                        sortedArray = dataArray.sorted(by: { $0[dataKey]! < $1[dataKey]! })
                    }
                    
                    
                case .ascend:
                
                    sortButton.sortType = .descend
                
                    if sortButton == centerSortButton {
                        sortedArray = dataArray.sorted(by: { Int($0[dataKey]!)! > Int($1[dataKey]!)! })
                    } else {
                        sortedArray = dataArray.sorted(by: { $0[dataKey]! > $1[dataKey]! })
                    }
                    
                
                case .descend:
                    
                    sortButton.sortType = .none
                    
                    sortedArray = dataArray
                    
                }
            } else {
                sortButton.sortType = .none
            }
        }
        
        tableView.reloadData()
    }
}

