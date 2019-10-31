//
//  ViewController.swift
//  CollapsedTableViewCell
//
//  Created by Suresh Shiga on 30/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

enum Images:String {
    case minus = "minus"
    case plus = "plus"
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var titleArray = ["The standard Lorem Ipsum passage, used since the 1500s","1914 translation by H. Rackham","1914 translation by H. Rackham","Where can I get some?","Where does it come from?","Why do we use it?","What is Lorem Ipsum","1914 translation by H. Rackham"]
    
    var expandArray = ["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.","It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum","Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. ","Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia","Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of  (The Extremes of Good and Evil) by Cicero"," written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, comes from a line in section 1.10.32.","It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."," The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here,"]
    
    var duplicateArr = [String]()
    
    var selectedIndex:Int = -1
    var isExpand:Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.estimatedRowHeight = 1000
        self.tableView.rowHeight = UITableView.automaticDimension
        
        addDuplicateObjects()
    }

    func addDuplicateObjects()  {
        duplicateArr = [String]()
        for _ in 0..<titleArray.count {
            duplicateArr.append("false")
        }
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isExpand == true && selectedIndex == indexPath.row {
            return UITableView.automaticDimension
        }
        return 67
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandableCell", for: indexPath) as! ExpandableCell
        let titleString:String = titleArray[indexPath.row]
        let expandString:String = expandArray[indexPath.row]
        
        cell.titleLabel.text       = titleString
        cell.expandLabel.text = expandString
        
        if duplicateArr[indexPath.row] == "false" {
            cell.expandImage.image = UIImage(named: Images.plus.rawValue)
        } else {
            cell.expandImage.image = UIImage(named: Images.minus.rawValue)
        }
        
   return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if selectedIndex == indexPath.row  {
            if self.isExpand == false {
            isExpand = true
                addDuplicateObjects()
                duplicateArr[indexPath.row] = "true"
            } else {
                isExpand = false
                addDuplicateObjects()
                duplicateArr[indexPath.row] = "false"
            }
        } else {
            isExpand = true
            addDuplicateObjects()
            duplicateArr[indexPath.row] = "true"
        }
        selectedIndex = indexPath.row
//self.tableView.reloadRows(at: [indexPath], with: .automatic)
        self.tableView.reloadSections([0], with: .fade)
        
       
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)  {
        let cell = tableView.cellForRow(at: indexPath) as! ExpandableCell
        cell.expandImage.image = UIImage(named: Images.plus.rawValue)
    }
}




