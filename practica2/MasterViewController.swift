//
//  MasterViewController.swift
//  practica2
//
//  Created by Luis Roberto Blancas Lemini on 30/05/22.
//

import UIKit

class MasterViewController: UITableViewController {
    
    let items: [String] = ["Excel file","Portable Document File","Photo" ]
    let itemsType: [DestinationType] = [.excel ,.pdf ,.photo]
    var type: DestinationType = .excel

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        type = itemsType[indexPath.row]
        processNavigation(type: type)
    }
    
    private func loadWebView(url: String) {
        let detailViewController = DetailURLViewController(url: url)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }

    
    private func processNavigation(type: DestinationType) {
        switch type {
        case .excel:
            let urlString: String = self.type.urlString
            let url = URL(string: urlString)
            FileDownloader.loadFileAsync(url: url!) { (path, error) in
                guard error == nil else {
                    self.processError(error: error)
                    return
                }
                self.loadWebView(url: urlString)
            }
        case .pdf:
            let urlString: String = self.type.urlString
            let url = URL(string: urlString)
            FileDownloader.loadFileAsync(url: url!) { (path, error) in
                guard error == nil else {
                    self.processError(error: error)
                    return
                }
                self.loadWebView(url: urlString)
            }
        case .photo:
            let urlString: String = self.type.urlString
            let url = URL(string: urlString)
            FileDownloader.loadFileAsync(url: url!) { (path, error) in
                guard error == nil else {
                    self.processError(error: error)
                    return
                }
                self.loadWebView(url: urlString)
            }
        }
    }

    
    private func processError(error: Error?) {
        guard let error = error as? ErrorDownloader else { return }
        switch error {
        case .AlreadyDownloaded:
            presentAlert(title: "File found locally", message: "No data fetched", error: .AlreadyDownloaded)
        case .noInternetConnection:
            presentAlert(title: "No internet connection", message: "Unable to download data", error: .noInternetConnection)
        }
    }
    
    private func presentAlert(title: String, message: String, error: ErrorDownloader) {
        switch error {
        case .noInternetConnection:
            let errorAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            
            errorAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                print("Handle Ok logic here")
            }))
            present(errorAlert, animated: true, completion: nil)
        case .AlreadyDownloaded:
            let errorAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            
            errorAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                self.loadWebView(url: self.type.urlString)
            }))
            present(errorAlert, animated: true, completion: nil)
        }
    }
}
