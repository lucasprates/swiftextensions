//
//  TestDateExtensions.swift
//  SwiftExtensions
//
//  Created by Lucas on 10/11/2018.
//

import XCTest

class TestDateExtensions: XCTestCase {
    
    let randomDate: Date = Date(timeIntervalSince1970: 1543089651) //Date of Nov 24th 2018 21h +2GMT
    var addedDate:Date = Date(timeIntervalSince1970: 1543233600) //A random date of 11/26/2018 12:00pm (a Monday)

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.addedDate = Date(timeIntervalSince1970: 1543233600) //A random date of 11/26/2018 12:00pm (a Monday)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStartOfDay() {
        //Test the beginning of the day date of a given date
        let dayStart = self.randomDate.startOfDay
        let dayStartHours = Calendar.current.component(.hour, from: dayStart)
        let dayStartMinutes = Calendar.current.component(.minute, from: dayStart)
        let dayStartSeconds = Calendar.current.component(.second, from: dayStart)
        
        XCTAssertTrue((dayStart.compare(self.randomDate) != .orderedSame) && (dayStartHours == dayStartMinutes && dayStartMinutes == dayStartSeconds && dayStartSeconds == 0), "Date should be the start date of \(self.randomDate.description)")
    }

    func testEndOfDay(){
        //Test the ending of the day date of a given date
        let dayEnd = self.randomDate.endOfDay
        let dayEndHours = Calendar.current.component(.hour, from: dayEnd)
        let dayEndMinutes = Calendar.current.component(.minute, from: dayEnd)
        let dayEndSeconds = Calendar.current.component(.second, from: dayEnd)
        
        XCTAssertTrue((dayEnd.compare(self.randomDate) != .orderedSame) && (dayEndHours == 23 && dayEndMinutes == dayEndSeconds && dayEndSeconds == 59), "Date should be the end date of \(self.randomDate.description)")
    }

    func testIsTheWeekDay(){
        //Test if a given date is a specific week day in english form, from the options (Mon, Tue, Wed, Thu, Fri, Sat, Sun)
        let weekDays: Array<Date.Weekday> = [Date.Weekday.monday, Date.Weekday.tuesday, Date.Weekday.wednesday, Date.Weekday.thursday, Date.Weekday.friday, Date.Weekday.saturday, Date.Weekday.sunday]
        
        //check for the correct date
        for i in 0...6 {
            XCTAssertTrue(self.addedDate.isTheWeekDay(weekDayToCheck: weekDays[i]), "Date should have been the correct week for \(self.addedDate.description)")
            self.addedDate.addTimeInterval(Double(86400))
        }
    }
    
    func testToday(){
        //Test today's date, simplified and more visually satfisfying
        let randomPastDate: Date = self.randomDate.addingTimeInterval(Double(-86400))
        XCTAssertTrue(Date.today().compare(Date()) == .orderedSame, "Date of today should have been correctly")
        XCTAssertFalse(Date.today().compare(randomPastDate) == .orderedSame, "Date of today should NOT have been the same as a past date such as  \(randomPastDate.description)")
    }
    
    func testStartOfMonth(){
        //Test the first date of the month of any given date
        let monthStart = self.randomDate.startOfMonth()
        let monthStartDay = Calendar.current.component(.day, from: monthStart)
        let monthStartHours = Calendar.current.component(.hour, from: monthStart)
        let monthStartMinutes = Calendar.current.component(.minute, from: monthStart)
        let monthStartSeconds = Calendar.current.component(.second, from: monthStart)
        
        XCTAssertTrue((monthStart.compare(self.randomDate) != .orderedSame) && (monthStartDay == 1 && monthStartHours == monthStartMinutes && monthStartMinutes == monthStartSeconds && monthStartSeconds == 0), "Date should have beeen the start month related to \(self.randomDate.description)")
    }
    
    func testEndOfMonth() {
        //Test the last date of the month any given date
        let monthEnd = self.randomDate.endOfMonth()
        let monthEndDay = Calendar.current.component(.day, from: monthEnd)
        let monthEndHours = Calendar.current.component(.hour, from: monthEnd)
        let monthEndMinutes = Calendar.current.component(.minute, from: monthEnd)
        let monthEndSeconds = Calendar.current.component(.second, from: monthEnd)
        
        XCTAssertTrue((monthEnd.compare(self.randomDate) != .orderedSame) && (monthEndDay == 30 && monthEndHours == 23 && monthEndMinutes == monthEndSeconds && monthEndSeconds == 59), "Date should have beeen the start month related to \(self.randomDate.description)")
    }
    
    func testNextWeekDay() {
        //Test next weekday, in an enum form
        let weekDays: Array<Date.Weekday> = [Date.Weekday.monday, Date.Weekday.tuesday, Date.Weekday.wednesday, Date.Weekday.thursday, Date.Weekday.friday, Date.Weekday.saturday, Date.Weekday.sunday]
        for i in 0...6{
            XCTAssertTrue(self.addedDate.next(weekDays[i]).isTheWeekDay(weekDayToCheck: weekDays[i]), "The weekday should be the same as the next weekday (\(weekDays[i].rawValue))")
        }
    }
    
    func testPreviousWeekDay() {
        //Test previous weekday, in an enum form
        let weekDays: Array<Date.Weekday> = [Date.Weekday.monday, Date.Weekday.tuesday, Date.Weekday.wednesday, Date.Weekday.thursday, Date.Weekday.friday, Date.Weekday.saturday, Date.Weekday.sunday]
        for i in 0...6{
            XCTAssertTrue(self.addedDate.previous(weekDays[i]).isTheWeekDay(weekDayToCheck: weekDays[i]), "The weekday should be the same as the previous weekday (\(weekDays[i].rawValue))")
        }
    }
    
    func testGetWeekDaysInEnglish() {
        //Test the weekday in english form, from one of the options (monday, tuesday, wednesday, thursday, friday, saturday, sunday)
        let weekDays: Array<Date.Weekday> = [Date.Weekday.sunday, Date.Weekday.monday, Date.Weekday.tuesday, Date.Weekday.wednesday, Date.Weekday.thursday, Date.Weekday.friday, Date.Weekday.saturday]
        
        let weekDaysInEnglish: [String] = self.addedDate.getWeekDaysInEnglish()
        var i: Int = 0
        for weekDayEN in weekDaysInEnglish {
            let weekDayToCompare: Date.Weekday
            switch weekDayEN {
                case "Monday":
                    weekDayToCompare = .monday
                case "Tuesday":
                    weekDayToCompare = .tuesday
                case "Wednesday":
                    weekDayToCompare = .wednesday
                case "Thursday":
                    weekDayToCompare = .thursday
                case "Friday":
                    weekDayToCompare = .friday
                case "Saturday":
                    weekDayToCompare = .saturday
                case "Sunday":
                    weekDayToCompare = .sunday
            default:
                weekDayToCompare = .friday
            }
            XCTAssertTrue(weekDayToCompare == weekDays[i], "WeekDayInEnglish should have been \(weekDayToCompare.rawValue)")
            i+=1
        }
    }
}
