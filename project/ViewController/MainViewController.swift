//
//  ViewController.swift
//  project
//
//  Created by Khurshed Umarov on 07.11.2021.
//

import UIKit
import SafariServices

/// MainViewController
class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var viewModel = NewsViewModel()
    private let searchVC = UISearchController(searchResultsController: nil)
    private var source = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        searchBar()
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(sourceScreen))
        
    }
    
    /// In "viewDidAppear" we check our UserDefaults does has value for searching category and query
    /// - Parameter animated: bool property
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
        source = UserDefaults.standard.string(forKey: "category") ?? ""
        loadNews(source: source, query: "")
    }
    
    /// Click this button we open SourceViewController for choose category
    @objc func sourceScreen(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "source_vc")
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UserDefaults.standard.removeObject(forKey: "category")
        source = ""
    }
    
    /// We call this function, when opened our MainVewController
    /// - Parameters:
    ///   - source: Find sources that display news of this category. Possible options: business, entertainment, general, health, science, sports, technology.
    ///   - query: Keywords or a phrase to search for.
    private func loadNews(source: String, query: String){
        print("source: \(source)")
        viewModel.fetchNews(source: source, query: query){ [weak self] in
            DispatchQueue.main.async {
                self?.tableView.dataSource = self
                self?.tableView.reloadData()
            }
        }
    }
    
    /// SearchBar controller initialize
    private func searchBar(){
        navigationItem.searchController = searchVC
        searchVC.searchBar.delegate = self
    }
    
    
}

extension MainViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, !text.isEmpty else{
            return
        }
        
        loadNews(source: self.source, query: text.replacingOccurrences(of: " ", with: ""))
        print(text)
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (source.isEmpty) {
            tableView.setEmptyView(title: "You don't choose source", message: "Please choose the source")
            self.searchVC.searchBar.layer.isHidden = true
            return 0
        }else if viewModel.numberOfRowsInSection(section: section) == 0{
            tableView.setEmptyView(title: "Empty data", message: "Please choose another category")
            self.searchVC.searchBar.layer.isHidden = true
            return 0
        }else{
            self.searchVC.searchBar.layer.isHidden = false
            tableView.restore()
            return viewModel.numberOfRowsInSection(section: section)
        }
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        let news = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(news)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let news = viewModel.cellForRowAt(indexPath: indexPath)
        
        guard let url = URL(string: news.url ?? "") else{
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
}
