//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Rajesh on 28/08/18.
//  Copyright © 2018 Rajesh. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var regId : Int = 0
    
    var registerArray = [Register]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loadItems()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
    @IBAction func registerTapped(_ sender: Any) {
        
        let register = self.storyboard?.instantiateViewController(withIdentifier: "Register") as! RegisterViewController
        self.navigationController?.pushViewController(register, animated: true)
        
    }
    
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        
        let user = username.text!
        let pass = password.text!
        
        for i in 0 ..< registerArray.count {
            let u = registerArray[i]
            let p = registerArray[i]
            if u.username == user && p.password == pass {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Alert", message:"Logged In", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style:.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    func saveData() {
        do {
            try self.context.save()
            self.loadItems()
        }catch {
            print("Error Saving: \(error)")
        }
    }
    
    func loadItems() {
        do {
            let request : NSFetchRequest<Register> = Register.fetchRequest()
            self.registerArray = try context.fetch(request)
            //self.listTable.reloadData()
        }catch {
            print("Error Saving: \(error)")
        }
    }

}

