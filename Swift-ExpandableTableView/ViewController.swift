//
//  ViewController.swift
//  Swift-ExpandableTableView
//
//  Created by narendra. vadde on 09/10/20.
//  Copyright © 2020 narendra. vadde. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var cellsData = [CellData]()
    
    var isExpanded = false
    var selectedIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib1 = UINib(nibName: "ExpandableCell", bundle: nil)
        tableView?.register(nib1, forCellReuseIdentifier: "ExpandableCell")
        let nib2 = UINib(nibName: "SelectableCell", bundle: nil)
        tableView?.register(nib2, forCellReuseIdentifier: "SelectableCell")
        getData()
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    
    func getData() {
        cellsData.append(CellData(isOpened: false, title: "Ahmad Pasrad", image: "down", sectionData: [SectionData(title: "present"), SectionData(title: "Called in Sick"), SectionData(title: "Urgent Leave"), SectionData(title: "Time Off"), SectionData(title: "Working on Machines"), SectionData(title: "Absent")]))
        cellsData.append(CellData(isOpened: false, title: "Ahmad Pasrad", image: "down", sectionData: [SectionData(title: "present"), SectionData(title: "Called in Sick"), SectionData(title: "Urgent Leave"), SectionData(title: "Time Off"), SectionData(title: "Working on Machines"), SectionData(title: "Absent")]))
        cellsData.append(CellData(isOpened: false, title: "Ahmad Pasrad", image: "down", sectionData: [SectionData(title: "present"), SectionData(title: "Called in Sick"), SectionData(title: "Urgent Leave"), SectionData(title: "Time Off"), SectionData(title: "Working on Machines"), SectionData(title: "Absent")]))
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellsData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cellsData[section].isOpened == true {
            return cellsData[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandableCell") as! ExpandableCell
            cell.titleLabel.text = cellsData[indexPath.section].title
            
            cell.expandedImage.image = UIImage(named: cellsData[indexPath.section].isOpened ? "up" : "down")
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectableCell") as! SelectableCell
            cell.titleLabel.text = cellsData[indexPath.section].sectionData[indexPath.row - 1].title
            
            if(cellsData[indexPath.section].sectionData[indexPath.row - 1].isSelected) {
                cell.CheckboxImage.image = UIImage(named: "check")
                print(cellsData[indexPath.section].sectionData[indexPath.row - 1].title)
            } else {
                cell.CheckboxImage.image = UIImage(named: "uncheck")
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if cellsData[indexPath.section].isOpened == true {
                cellsData[indexPath.section].isOpened = false
                let sections = IndexSet(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            } else {
                cellsData[indexPath.section].isOpened = true
                let sections = IndexSet(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }
        }
        
        //Using to select rows with data
        if indexPath.row != 0 {
            if let selected = selectedIndex {
                cellsData[indexPath.section].sectionData[selected - 1].isSelected = false
                selectedIndex = indexPath.row
                cellsData[indexPath.section].sectionData[indexPath.row - 1].isSelected = true
                tableView.reloadData()
            }else {
                selectedIndex = indexPath.row
                cellsData[indexPath.section].sectionData[indexPath.row - 1].isSelected = true
                tableView.reloadData()
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

