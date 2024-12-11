//
//  extensions.swift
//  MovieList
//
//  Created by Ferry jati on 10/12/24.
//

import Foundation
extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
