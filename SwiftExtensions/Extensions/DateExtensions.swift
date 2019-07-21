//
//  DateExtensions.swift
//  SwiftExtensions
//
//  Created by Lucas on 10/11/2018.
//

import UIKit

class DateExtensions: NSObject {
    
}


//Geting other dates related to a spectific date
extension Date {
    
    //Get the beginning of the day date of a given date
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    //Get the last date of the day of a given date
    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }
    
    //Check if a given date is a specific week day in english form, from the options (Mon, Tue, Wed, Thu, Fri, Sat, Sun)
    func isTheWeekDay(weekDayToCheck: Weekday) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "ccc"
        let dateOfWeekString = dateFormatter.string(from: self)
        
        var weekDay: String = ""
        switch weekDayToCheck {
        case .monday:
            weekDay = "Mon"
        case .tuesday:
            weekDay = "Tue"
        case.wednesday:
            weekDay = "Wed"
        case.thursday:
            weekDay = "Thu"
        case.friday:
            weekDay = "Fri"
        case.saturday:
            weekDay = "Sat"
        case.sunday:
            weekDay = "Sun"
        }
        
        if(weekDay == dateOfWeekString) {
            return true
        }
        return false
    }
    
    //Get today's date, simplified and more visually satfisfying
    static func today() -> Date {
        return Date()
    }
    
    //Get the first date of the month of any given date
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    
    //Get the last date of the month any given date
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!.endOfDay
    }
    
    //Get next weekday, in an enum form
    func next(_ weekday: Weekday, considerToday: Bool = false) -> Date {
        return get(.Next,
                   weekday,
                   considerToday: considerToday)
    }
    
    //Get previous weekday, in an enum form
    func previous(_ weekday: Weekday, considerToday: Bool = false) -> Date {
        return get(.Previous, weekday, considerToday: considerToday)
    }
    
    func get(_ direction: SearchDirection, _ weekDay: Weekday, considerToday consider: Bool = false) -> Date{
        let dayName = weekDay.rawValue
        let weekdaysName = getWeekDaysInEnglish().map { $0.lowercased() }
        assert(weekdaysName.contains(dayName), "weekday symbol should be in form \(weekdaysName)")
        
        let searchWeekdayIndex = weekdaysName.index(of: dayName)! + 1
        let calendar = Calendar(identifier: .gregorian)
        
        if consider && calendar.component(.weekday, from: self) == searchWeekdayIndex {
            return self
        }
        
        var nextDateComponent = DateComponents()
        nextDateComponent.weekday = searchWeekdayIndex
        
        let date = calendar.nextDate(after: self, matching: nextDateComponent, matchingPolicy: .nextTime, direction: direction.calendarSearchDirection)
        
        return date!
    }
}

//Auxiliary methods for dates manipulation and displaying
extension Date {
    
    //Gets the weekday in english form, from one of the options (monday, tuesday, wednesday, thursday, friday, saturday, sunday)
    func getWeekDaysInEnglish() -> [String] {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale(identifier: "en_US_POSIX")
        return calendar.weekdaySymbols
    }
    
    enum Weekday: String {
        case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    }
    
    enum SearchDirection {
        case Next
        case Previous
        
        var calendarSearchDirection: Calendar.SearchDirection {
            switch self {
            case .Next:
                return .forward
            case .Previous:
                return .backward
            }
        }
    }
}

extension Date {
    
    //get the elapesed time that passed from the date stored until now
    func elapsedTime() -> TimeInterval {
        return Date().timeIntervalSince1970 - self.timeIntervalSince1970
    }
}
