//
//  ViewController.swift
//  Log In Demo
//
//  Created by Rob Percival on 04/07/2016.
//  Copyright © 2016 Appfish. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {


    @IBAction func logOut(_ sender: AnyObject) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate // UIApplication.shared().delegate as! AppDelegate is now UIApplication.shared.delegate as! AppDelegate

        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        do {
            
            let results = try context.fetch(request)

            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    context.delete(result)
                    
                    do {
                        
                        try context.save()
                        
                    } catch {
                        
                        print("Individual delete failed")
                        
                    }
                    
                }
                
                label.alpha = 0
                
                logOutButton.alpha = 0
                
                logInButton.setTitle("Login", for: [])
                
                isLoggedIn = false
                
                textField.alpha = 1
                
            }
            
        } catch {
            
            print("Delete failed")
            
        }
    }
    
    @IBOutlet var logOutButton: UIButton!
    
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var logInButton: UIButton!
    
    var isLoggedIn = false
    
    @IBAction func logIn(_ sender: AnyObject) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate // UIApplication.shared().delegate as! AppDelegate is now UIApplication.shared.delegate as! AppDelegate

        
        let context = appDelegate.persistentContainer.viewContext
        
        if isLoggedIn {
            
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            
            do {
                
                let results = try context.fetch(request)
                
                if results.count > 0 {
                    
                    for result in results as! [NSManagedObject] {
                        
                        result.setValue(textField.text, forKey: "name")
                        
                        do {
                            
                            try context.save()
                            
                        } catch {
                            
                            print("Update username save failed")
                            
                        }
                        
                    }
                    
                 label.text = "Hi there " + textField.text! + "!"
                    
                }
                
            } catch {
                
                print("Update username failed")
                
            }
            
            
        } else {
        
            let newValue = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
            newValue.setValue(textField.text, forKey: "name")
        
            do {
            
                try context.save()
            
                logInButton.setTitle("Update username", for: [])
            
                label.alpha = 1
            
                label.text = "Hi there " + textField.text! + "!"
            
                isLoggedIn = true
                
                logOutButton.alpha = 1
            
            } catch {
            
                print("Failed to save")
            
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate // UIApplication.shared().delegate as! AppDelegate is now UIApplication.shared.delegate as! AppDelegate

        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(request)
            
            for result in results as! [NSManagedObject] {
                
                if let username = result.value(forKey: "name") as? String {
                    
                    logInButton.setTitle("Update username", for: [])
                    
                    logOutButton.alpha = 1
                    
                    label.alpha = 1
                    
                    label.text = "Hi there " + username + "!"
                    
                }
                
            }
            
            
        } catch {
            
            print("Request failed")
            
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

