//
//  DestinationType.swift
//  practica2
//
//  Created by Luis Roberto Blancas Lemini on 30/05/22.
//

import Foundation

enum DestinationType {
    case excel
    case pdf
    case photo
    
    var urlString: String {
        switch self {
        case .excel:
            return "http://janzelaznog.com/DDAM/iOS/vim/localidades.xlsx"
        case .pdf:
            return "http://janzelaznog.com/DDAM/iOS/vim/Articles.pdf"
        case .photo:
            return "http://janzelaznog.com/DDAM/iOS/vim/geo_vertical.jpg"
        }
    }
}
