//
//  DateUtils.swift
//  GameCatalogue
//
//  Created by Rizal Fahlepi on 26/04/22.
//

import Foundation

final class DateUtils {
 
    static func generateDate(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateObj = dateFormatter.date(from: date)
        
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let dateString = dateFormatter.string(from: dateObj ?? Date())
        return dateString
    }
    
}
