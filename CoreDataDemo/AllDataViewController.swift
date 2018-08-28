//
//  AllDataViewController.swift
//  CoreDataDemo
//
//  Created by Rajesh on 28/08/18.
//  Copyright © 2018 Rajesh. All rights reserved.
//

import UIKit
import CoreData

class AllDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var registerArray = [Register]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var dataTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        loadItems()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return registerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell") as! AllDataTableViewCell
        let register = registerArray[indexPath.row]
        cell.id.text = String(register.userid)
        cell.name.text = register.username
        cell.pass.text = register.password
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = registerArray[indexPath.row]
        
        let register = self.storyboard?.instantiateViewController(withIdentifier: "Register") as! RegisterViewController
        
        register.i = index.userid
        register.u = index.username!
        register.p = index.password!
        
//        context.delete(registerArray[indexPath.row])
//        registerArray.remove(at: indexPath.row)
        
        self.navigationController?.pushViewController(register, animated: true)
    }
    
    func loadItems() {
        do {
            let request : NSFetchRequest<Register> = Register.fetchRequest()
            self.registerArray = try context.fetch(request)
            print(self.registerArray)
            self.dataTable.reloadData()
        }catch {
            print("Error Saving: \(error)")
        }
    }

}
