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
    }
    
    var sections = [Section]()
    
    var friendsMassive =  [
        Friend(name: "Vlad Miller", imageFriends: UIImage(named: "Глаза1")!),
        Friend(name: "Viktor Funduk", imageFriends: UIImage(named: "1111")!),
        Friend(name: "Skala Jony", imageFriends: UIImage(named: "Jony")!),
        Friend(name: "Ben Ten", imageFriends: UIImage(named: "Ben")!),
        Friend(name: "Jessica Alba", imageFriends: UIImage(named: "Jessica")!),
        Friend(name: "Антошка Картошка", imageFriends: UIImage(named: "Cat")!),
        Friend(name: "Николай Погребняк", imageFriends: UIImage(named: "reneg")!),
        Friend(name: "Станислав Копченый", imageFriends: UIImage(named: "duck")!),
        Friend(name: "Виталий Негодяев", imageFriends: UIImage(named: "timon")!),
        Friend(name: "Hello Word", imageFriends: UIImage(named: "man")!),
        Friend(name: "Life is Strange", imageFriends: UIImage(named: "wolf")!),
        Friend(name: "Petr 1 2", imageFriends: UIImage(named: "Jessica")!)
    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var nameFriend = [String]()
        for i in friendsMassive{
            nameFriend.append(i.name)
        }
        //Сортировка
        let groupedDictionary = Dictionary(grouping: nameFriend, by: {String($0.prefix(1))})
        
        //print(groupedDictionary)
        let keys = groupedDictionary.keys.sorted()
        //print(keys)
        
        sections = keys.map{ Section(letter: $0, names: groupedDictionary[$0]!.sorted()) }
        self.tableView.reloadData()
        //print(sections)
        //Сортировка
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        
    }
        
        

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sections[section].names.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as? FriendsCell else {
            preconditionFailure("нет связи FriendsCell")
        }
        let section = sections[indexPath.section]
        let friend = section.names[indexPath.row]//id
        cell.friendNameLabel.text = friend// имя
        //картинка
        for i in friendsMassive{
            if i.name == friend{
                cell.imageFriendView.image = i.imageFriends
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].letter
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections.compactMap{$0.letter.uppercased()}
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
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        let section = sections[indexPath.section]
//        let nameFriend = section.names[indexPath.row]
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            sections.remove(at: indexPath.row)
//            print("Удален друг: " + nameFriend + " ((((")
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }

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
            
            
            let section = sections[indexPath.section] // id элемента
            let titleFriendName = section.names[indexPath.row]
            let destinationViewController = segue.destination as? FriendCollectionController //определение куда передаем инфу
            destinationViewController?.collectionFriendName = titleFriendName
            //картинка
            for i in friendsMassive{
                if i.name == titleFriendName{
                    destinationViewController?.collectionFriendImage = i.imageFriends
                }
            }
        }
    }
    

}

