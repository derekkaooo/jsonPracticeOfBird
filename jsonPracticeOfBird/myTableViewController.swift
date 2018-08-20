//
//  myTableViewController.swift
//  jsonPracticeOfBird
//
//  Created by Derek on 2018/8/15.
//  Copyright © 2018年 Derek. All rights reserved.
//

import UIKit

class myTableViewController: UITableViewController {

    struct AllData:Decodable{
        var Identifier:String
        var MainTitle:String
        var Owner:String
    }
    var birds = [AllData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJson()
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return birds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? birdTableViewCell else {return UITableViewCell()}
        
        cell.nameLabel.text = birds[indexPath.row].MainTitle
        cell.numberLabel.text = birds[indexPath.row].Identifier
        cell.urlLabel.text = birds[indexPath.row].Owner
        
        return cell
    }
        
        func downloadJson(){
            let url = URL(string: "https://collections.culture.tw/getMetadataList.aspx?format=OpenData&TYPEID=A35")
            guard let downloadURL = url else {return}
            
            URLSession.shared.dataTask(with: downloadURL) { (data, response, error) in
                guard let data = data else {return}
                do{
                    let decoder = JSONDecoder()
                    //因為最外面是陣列，所以是[AllData]
                    let classer = try decoder.decode([AllData].self, from: data)
                    self.birds = classer
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                }catch{
                    print("error")
                }
                
                }.resume()
        }
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source



    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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


