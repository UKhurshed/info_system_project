//
//  SourceViewController.swift
//  project
//
//  Created by Khurshed Umarov on 08.11.2021.
//

import UIKit

/// Screen choosing source for searching by category
class SourceViewController: UIViewController {
    
    /// UILabel for showing selected category
    @IBOutlet weak var chooseCategoryLabel: UILabel!
    
    /// override viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// Business button
    ///
    /// - Parameter sender: button sender
    @IBAction func businessBtn(_ sender: Any) {
        chooseCategoryLabel.text = "Business"
        UserDefaults.standard.set("business", forKey: "category")
        print("Clicked business")
    }
    /// Entertainment button
    /// - Parameter sender: button sender
    @IBAction func enterBtn(_ sender: Any) {
        chooseCategoryLabel.text = "Entertainment"
        UserDefaults.standard.set("entertainment", forKey: "category")
        print("Clicked entertainment")
    }
    /// General button
    /// - Parameter sender: button sender
    @IBAction func generalBtn(_ sender: Any) {
        chooseCategoryLabel.text = "General"
        UserDefaults.standard.set("general", forKey: "category")
        print("Clicked general")
    }
    
    /// Health button
    /// - Parameter sender: button sender
    @IBAction func healthBtn(_ sender: Any) {
        chooseCategoryLabel.text = "Health"
        UserDefaults.standard.set("health", forKey: "category")
        print("Clicked health")
    }
    /// Science button
    /// - Parameter sender: button sender
    @IBAction func scienceBtn(_ sender: Any) {
        chooseCategoryLabel.text = "Science"
        UserDefaults.standard.set("science", forKey: "category")
        print("Clicked science")
    }
    /// Sports button
    /// - Parameter sender: button sender
    @IBAction func sportsBtn(_ sender: Any) {
        chooseCategoryLabel.text = "Sports"
        UserDefaults.standard.set("sports", forKey: "category")
        print("Clicked sports")
    }
    /// Technology button
    /// - Parameter sender: button sender
    @IBAction func technologyBtn(_ sender: Any) {
        chooseCategoryLabel.text = "Technology"
        UserDefaults.standard.set("technology", forKey: "category")
        print("Clicked technology")
    }
    /// override viewWillDisappear
    /// - Parameter animated: bool parametr for animated transition
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
}
