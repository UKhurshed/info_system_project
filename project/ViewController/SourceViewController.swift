//
//  SourceViewController.swift
//  project
//
//  Created by Khurshed Umarov on 08.11.2021.
//

import UIKit

class SourceViewController: UIViewController {
    
    @IBOutlet weak var chooseCategoryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func businessBtn(_ sender: Any) {
        chooseCategoryLabel.text = "Business"
        UserDefaults.standard.set("business", forKey: "category")
        print("Clicked business")
    }
    @IBAction func enterBtn(_ sender: Any) {
        chooseCategoryLabel.text = "Entertainment"
        UserDefaults.standard.set("entertainment", forKey: "category")
        print("Clicked entertainment")
    }
    @IBAction func generalBtn(_ sender: Any) {
        chooseCategoryLabel.text = "General"
        UserDefaults.standard.set("general", forKey: "category")
        print("Clicked general")
    }
    
    @IBAction func healthBtn(_ sender: Any) {
        chooseCategoryLabel.text = "Health"
        UserDefaults.standard.set("health", forKey: "category")
        print("Clicked health")
    }
    @IBAction func scienceBtn(_ sender: Any) {
        chooseCategoryLabel.text = "Science"
        UserDefaults.standard.set("science", forKey: "category")
        print("Clicked science")
    }
    @IBAction func sportsBtn(_ sender: Any) {
        chooseCategoryLabel.text = "Sports"
        UserDefaults.standard.set("sports", forKey: "category")
        print("Clicked sports")
    }
    @IBAction func technologyBtn(_ sender: Any) {
        chooseCategoryLabel.text = "Technology"
        UserDefaults.standard.set("technology", forKey: "category")
        print("Clicked technology")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
}
