//
//  ViewController.swift
//  UserDefault
//
//  Created by JunHeeJo on 3/1/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func saveUserDefaults(_ sender: Any) {
        let beePeach: Person = Person(name: "BeePeach", age: 20)
        let encoder: JSONEncoder = JSONEncoder()
        if let encodededBeePeach = try? encoder.encode(beePeach) {
            UserDefaults.standard.set(encodededBeePeach, forKey: "beepeach")
            print("Save")
        }
    }
    
    @IBAction func readUserDefaults(_ sender: Any) {
        let decoder: JSONDecoder = JSONDecoder()
        if let result = UserDefaults.standard.object(forKey: "beepeach") as? Data,
           let decodedBeePeach = try? decoder.decode(Person.self, from: result) {
            resultLabel.text = "\(decodedBeePeach)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

