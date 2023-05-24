//
//  ContentView.swift
//  cocoaheads-swiftcharts
//
//  Created by Gerd Bernhardt on 24.05.23.
//

import Charts
import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack{
            GroupBox("Aachen") {
                Chart {
                    barMark
                    lineMark
                    pointMark
                }
            }.frame(height: 350)
            
            GroupBox("Series") {
                Chart {
                    series
                }
            }.frame(height: 350)
                .chartXAxis {
                    AxisMarks(values: .stride(by: .month)) { _ in
                        AxisTick()
                        AxisGridLine()
                        AxisValueLabel(format: .dateTime.month(.abbreviated), centered: true)
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    @ChartContentBuilder private var barMark: some ChartContent {
        ForEach(ChartData.aachen) { entry in
            BarMark(
                x: .value("Date", entry.date, unit: .month),
                y: .value("Attendees", entry.attendees)
            )
            .foregroundStyle(.orange)
        }
    }
    
    @ChartContentBuilder private var lineMark: some ChartContent {
        ForEach(ChartData.aachen) { entry in
            LineMark(
                x: .value("Day", entry.date, unit: .month),
                y: .value("Attendees", entry.attendees)
            )
            .foregroundStyle(.red)
        }
    }
    
    @ChartContentBuilder private var pointMark: some ChartContent {
        ForEach(ChartData.aachen) { entry in
            PointMark(
                x: .value("Day", entry.date, unit: .month),
                y: .value("Attendees", entry.attendees)
            )
            .foregroundStyle(.red)
        }
    }
   
    @ChartContentBuilder private var series: some ChartContent {
        ForEach(ChartData.series, id: \.city) { series in
                Plot {
            ForEach(series.data) { entry in
                    BarMark(
                        x: .value("Day", entry.date, unit: .month),
                        y: .value("Attendees", entry.attendees)
                    )
                    .foregroundStyle(by: .value("City", series.city))
                }
            }
            .position(by: .value("City", "series.city"))
        }
    }
}
