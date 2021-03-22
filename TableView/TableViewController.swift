//
//  TableViewController.swift
//  TableView
//
//  Created by Almas Nurzhanov on 17.03.2021.
//

import UIKit

class TableViewController: UITableViewController {

    var arrayNames = ["Ted", "Berney", "Lily", "Marshall", "Robin"]
   
    var arraySurname = ["Mosby", "Stinson", "Aldrins", "Erikson", "Sherbatsky"]
    
    var arrayImages = ["Lily","Lily","Lily","Lily","Lily"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...

        let labelName = cell.viewWithTag(1000) as! UILabel
        labelName.text = arrayNames[indexPath.row]
        
        let labelSurname = cell.viewWithTag(1001) as! UILabel
        labelSurname.text = arraySurname[indexPath.row]
        
        let imageView = cell.viewWithTag(1002) as! UIImageView
        imageView.image = UIImage(named: arrayImages[indexPath.row])
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 73.0
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {//kogda nazhimaem na cell
        
        let DetailVC = (storyboard?.instantiateViewController(identifier: "DetailVC"))! as ViewController
        //ukazat konkretnyi view controller
        
        DetailVC.name = arrayNames[indexPath.row]
        DetailVC.surname = arraySurname[indexPath.row]
        DetailVC.image = arrayImages[indexPath.row]
        
        self.navigationController?.pushViewController(DetailVC, animated: true)
    }
    
    @IBAction func AddNewPerson(_ sender: Any) {
        arrayNames.append("New person name")
        arraySurname.append("New person surname")
        arrayImages.append("Unknown")
        
        tableView.reloadData()//obnovit vse elementy
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            arrayNames.remove(at: indexPath.row)
            arraySurname.remove(at: indexPath.row)
            arrayImages.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
//DZ spisok sdelat i isp bolshe elementov
    
    //kategorii otzyvy i mnogo elementov
    
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
