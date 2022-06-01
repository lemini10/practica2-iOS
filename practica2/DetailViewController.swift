//
//  DetailViewController.swift
//  practica2
//
//  Created by Luis Roberto Blancas Lemini on 30/05/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    let viewControllerType: DestinationType
    
    init(type: DestinationType) {
        self.viewControllerType = type
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkType()
    }
    
    private func checkType() {
        if isDownloaded() {
            switch viewControllerType {
            case .excel:
                break
            case .pdf:
                break
            case .photo:
                break
            }
        } else {
            switch viewControllerType {
            case .excel:
                break
            case .pdf:
                break
            case .photo:
                let url = URL(string: "http://janzelaznog.com/DDAM/iOS/vim/geo_vertical.jpg")
                FileDownloader.loadFileAsync(url: url!) { (path, error) in
                    print("PDF File downloaded to : \(path!)")
                }
            }
        }
    }
    
    private func isDownloaded() -> Bool {
        switch viewControllerType {
        case .excel:
            break
        case .pdf:
            break
        case .photo:
            let path = "/Users/lrbl/Library/Developer/CoreSimulator/Devices/91316331-3D0E-4327-B4AC-70D65B7D3F7E/data/Containers/Data/Application/40757620-567D-40EA-8030-A9EEB7DA9A6E/Documents/geo_vertical.jpg"
        }
        return false
    }
}
