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
        ScrollView {
            VStack{
                GroupBox("Aachen") {
                    Chart {
                        barMark
                        lineMark
                        pointMark
                    }
                }.frame(height: 350)
                
                GroupBox("Aachen") {
                    Chart {
                        areaMark
                        ruleMark
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
    
    @ChartContentBuilder private var areaMark: some ChartContent {
        let attendees = ChartData.aachen.map({$0.attendees})
        let minValue = attendees.min() ?? 0
        let maxValue = attendees.max() ?? 0
        
        ForEach(ChartData.aachen) { entry in
            LineMark(
                x: .value("Day", entry.date, unit: .month),
                y: .value("Attendees", entry.attendees)
            )
            AreaMark(
                x: .value("Day", entry.date, unit: .month),
                yStart: .value("Attendees min", minValue),
                yEnd: .value("Attendees max", maxValue)
            )
            .opacity(0.3)
        }
        .foregroundStyle(.red)
    }
    
    @ChartContentBuilder private var ruleMark: some ChartContent {
        let attendees = ChartData.aachen.map({$0.attendees})
        let avgValue = attendees.reduce(0, +) / attendees.count
        
        RuleMark(
            y: .value("Attendees Average", avgValue)
        )
        .lineStyle(StrokeStyle(dash: [5]))
        .annotation(position: .top, alignment: .leading) {
            Text("Average: \(avgValue, format: .number)")
                .font(.body)
                .foregroundStyle(.gray)
        }
        .foregroundStyle(.gray)
        .opacity(0.6)
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
