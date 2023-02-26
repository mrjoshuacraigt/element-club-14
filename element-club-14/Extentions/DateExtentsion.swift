//
//  DateExtentsion.swift
//  element-club-14
//
//  Created by Joshua Taylor on 2/26/23.
//

import Foundation

extension Date {

    func isEqual(to date: Date, toGranularity component: Calendar.Component, in calendar: Calendar = .current) -> Bool {
        calendar.isDate(self, equalTo: date, toGranularity: component)
    }

    func isInSameYear(as date: Date) -> Bool { isEqual(to: date, toGranularity: .year) }
    func isInSameMonth(as date: Date) -> Bool { isEqual(to: date, toGranularity: .month) }
    func isInSameWeek(as date: Date) -> Bool { isEqual(to: date, toGranularity: .weekOfYear) }

    func isInSameDay(as date: Date) -> Bool { Calendar.current.isDate(self, inSameDayAs: date) }

    var isInThisYear:  Bool { isInSameYear(as: Date()) }
    var isInThisMonth: Bool { isInSameMonth(as: Date()) }
    var isInThisWeek:  Bool { isInSameWeek(as: Date()) }

    var isInYesterday: Bool { Calendar.current.isDateInYesterday(self) }
    var isInToday:     Bool { Calendar.current.isDateInToday(self) }
    var isInTomorrow:  Bool { Calendar.current.isDateInTomorrow(self) }

    var isInTheFuture: Bool { self > Date() }
    var isInThePast:   Bool { self < Date() }
    
    
   static func getSummaryDateTime(dateTimeFrom1907: String) -> String {
       
       guard let timeDate = TimeInterval(dateTimeFrom1907) else {
           return "Invalid Input"
       }
       
       let dateTime = Date(timeIntervalSince1970: TimeInterval(timeDate))
       
       if (dateTime.isInYesterday) {
           return "Yesterday"
       }
       
       
       let dateFormatterGet = DateFormatter()
       dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
       
          if (dateTime.isInToday) {
              //Format 10:33 AM
              dateFormatterGet.dateFormat = "HH:mm a"
          }  else if (dateTime.isInThisYear) {
              // Feb 24
              dateFormatterGet.dateFormat = "MMM dd"
          } else {
              // Feb 2011
              dateFormatterGet.dateFormat = "MMM YYYY"
          }
       
       return dateFormatterGet.string(from: dateTime)
    }
}
