//
//  RegisterViewController.swift
//  CoreDataDemo
//
//  Created by Rajesh on 28/08/18.
//  Copyright © 2018 Rajesh. All rights reserved.
//

import UIKit
import CoreData



class RegisterViewController: UIViewController {
    
    var registerArray = [Register]()
    var regId : Int = 0
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var u : String = ""
    var p : String = ""
    var i : Int32 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        if i > 0 {
            username.text = u
            password.text = p
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func allRegis(_ sender: Any) {
        
        let allRegis = self.storyboard?.instantiateViewController(withIdentifier: "AllRegis") as! AllDataViewController
        self.navigationController?.pushViewController(allRegis, animated: true)
        
    }
    
    @IBAction func registerTapped(_ sender: Any) {
        
        
        if i > 0 {
            for iii in 0 ..< registerArray.count {
                let ii = registerArray[iii]
                let iid = ii.userid
                
                if i == iid {
                    ii.username = username.text!
                    ii.password = password.text!
                }
                
            }
        }else {
            let register = Register(context: self.context)
            if registerArray.count == 0 && i == 0{
                regId = 1
            }else if registerArray.count > 0 && i == 0{
                let regIdValue = registerArray[registerArray.count - 1]
                regId = Int(regIdValue.userid + 1)
            }else {
                regId = Int(i)
            }
            register.userid = Int32(regId)
            register.username = username.text!
            register.password = password.text!
        }
        saveData()
    }
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }


    func saveData() {
        do {
            try self.context.save()
            let login = self.storyboard?.instantiateViewController(withIdentifier: "Login") as! LoginViewController
            self.navigationController?.pushViewController(login, animated: true)
        }catch {
            print("Error Saving: \(error)")
        }
    }
    
    func loadItems() {
        do {
            let request : NSFetchRequest<Register> = Register.fetchRequest()
            self.registerArray = try context.fetch(request)
            print(self.registerArray)
            //self.listTable.reloadData()
        }catch {
            print("Error Saving: \(error)")
        }
    }
}
