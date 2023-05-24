//
//  Data.swift
//  cocoaheads-swiftcharts
//
//  Created by Stephan Partzsch on 24.05.23.
//

import Foundation

struct ChartDataEntry: Identifiable {
    let id = UUID()
    let date: Date
    let attendees: Int
    let withPizza: Bool
}

enum ChartData {
    static let aachen = [
        (date: date(year: 2023, month: 1, day: 12), attendees: 107, withPizza: false),
        (date: date(year: 2023, month: 2, day: 14), attendees: 116, withPizza: false),
        (date: date(year: 2023, month: 3, day: 12), attendees: 123, withPizza: false),
        (date: date(year: 2023, month: 4, day: 14), attendees: 133, withPizza: false),
        (date: date(year: 2023, month: 5, day: 12), attendees: 140, withPizza: false),
        (date: date(year: 2023, month: 6, day: 14), attendees: 147, withPizza: false),
        (date: date(year: 2023, month: 7, day: 12), attendees: 153, withPizza: true),
        (date: date(year: 2023, month: 8, day: 14), attendees: 159, withPizza: false),
        (date: date(year: 2023, month: 9, day: 12), attendees: 164, withPizza: false),
        (date: date(year: 2023, month: 10, day: 14), attendees: 169, withPizza: false),
        (date: date(year: 2023, month: 11, day: 12), attendees: 176, withPizza: true)
    ].map { ChartDataEntry(date: $0.date, attendees: $0.attendees, withPizza: $0.withPizza) }
    
    static let cologne = [
        (date: date(year: 2023, month: 1, day: 22), attendees: 88, withPizza: true),
        (date: date(year: 2023, month: 2, day: 24), attendees: 100, withPizza: true),
        (date: date(year: 2023, month: 3, day: 10), attendees: 83, withPizza: true),
        (date: date(year: 2023, month: 4, day: 16), attendees: 70, withPizza: true),
        (date: date(year: 2023, month: 5, day: 02), attendees: 111, withPizza: true),
        (date: date(year: 2023, month: 6, day: 18), attendees: 128, withPizza: false),
        (date: date(year: 2023, month: 7, day: 19), attendees: 103, withPizza: true),
        (date: date(year: 2023, month: 8, day: 24), attendees: 99, withPizza: true),
        (date: date(year: 2023, month: 9, day: 09), attendees: 121, withPizza: true),
        (date: date(year: 2023, month: 10, day: 11), attendees: 177, withPizza: false),
        (date: date(year: 2023, month: 11, day: 18), attendees: 155, withPizza: true)
    ].map { ChartDataEntry(date: $0.date, attendees: $0.attendees, withPizza: $0.withPizza) }
}


func date(year: Int, month: Int, day: Int) -> Date {
    Calendar.current.date(from: DateComponents(year: year, month: month, day: day)) ?? Date()
}
