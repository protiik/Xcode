//
//  FriendsTableViewController.swift
//  loginForm
//
//  Created by prot on 10/02/2020.
//  Copyright © 2020 prot. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController{
    
    struct Section {
        let letter: String
        let names: [String]
        let image: [String]
    }
    var sections = [Section]()
    
    var friendsMassive =  [
        Friend(name: "Vlad Miller", imageFriends: UIImage(named: "Глаза1")!),
        Friend(name: "Viktor Funduk", imageFriends: UIImage(named: "1111")!),
        Friend(name: "Skala Jony", imageFriends: UIImage(named: "Jony")!),
        Friend(name: "Ben Ten", imageFriends: UIImage(named: "Ben")!),
        Friend(name: "Jessica Alba", imageFriends: UIImage(named: "Jessica")!)
    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        /*var imageFriend = [String]()
        var nameFriend = [String]()
        for i in friendsMassive{
            nameFriend.append(i.name)
            imageFriend.append(i.imageFriends:)
        }
        //Сортировка
        let groupedDictionary = Dictionary(grouping: nameFriend, by: {String($0.prefix(1))})
        print(groupedDictionary)
        let keys = groupedDictionary.keys.sorted()
        
        sections = keys.map{ Section(letter: $0, names: groupedDictionary[$0]!.sorted(), image: imageFriend[$0])) }
        self.tableView.reloadData()
        print(sections)
        //Сортировка*/
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        
    }
        
        

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friendsMassive.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as? FriendsCell else {
            preconditionFailure("нет связи FriendsCell")
        }
        
        let friend = friendsMassive[indexPath.row] //id
        cell.friendNameLabel.text = friend.name // имя
        cell.imageFriendView.image = friend.imageFriends
        //cell.imageFriendView.image = friend.imageFriends //картинка
        
        
        return cell
    }
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    //функция удаления эллементов
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let nameFriend = friendsMassive[indexPath.row]
        if editingStyle == .delete {
            // Delete the row from the data source
            friendsMassive.remove(at: indexPath.row)
            print("Удален друг: " + nameFriend.name + " ((((")
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //Иницилизация при переходе с индификатором
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "Show Friends",
            let indexPath = tableView.indexPathForSelectedRow {
            let titleFriendName = friendsMassive[indexPath.row] // id элемента
            let destinationViewController = segue.destination as? FriendCollectionController //определение куда передаме инфу
            destinationViewController?.collectionFriendName = titleFriendName.name
            destinationViewController?.collectionFriendImage = titleFriendName.imageFriends
        }
    }
    

}
