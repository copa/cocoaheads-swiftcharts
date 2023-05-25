//
//  ContentView+Extension.swift
//  cocoaheads-swiftcharts
//
//  Created by Gerd Bernhardt on 25.05.23.
//

import Charts
import SwiftUI

extension ContentView {

    // MARK: Aachen

    @ViewBuilder var aachenChartBar: some View {
        GroupBox("Aachen") {
            Chart {
                aachenBarMark
            }
        }.frame(height: 350)
    }

    @ViewBuilder var aachenChartBarLine: some View {
        GroupBox("Aachen") {
            Chart {
                aachenBarMark
                aachenLineMark
            }
        }.frame(height: 350)
    }

    @ViewBuilder var aachenChartBarLinePoint: some View {
        GroupBox("Aachen") {
            Chart {
                aachenBarMark
                aachenLineMark
                aachenPointMark
            }
        }.frame(height: 350)
    }

    @ChartContentBuilder var aachenBarMark: some ChartContent {
        ForEach(ChartData.aachen) { entry in
            BarMark(
                x: .value("Date", entry.date, unit: .month),
                y: .value("Attendees", entry.attendees)
            )
            .foregroundStyle(.orange)
        }
    }

    @ChartContentBuilder var aachenLineMark: some ChartContent {
        ForEach(ChartData.aachen) { entry in
            LineMark(
                x: .value("Day", entry.date, unit: .month),
                y: .value("Attendees", entry.attendees)
            )
            .foregroundStyle(.red)
        }
    }

    @ChartContentBuilder var aachenPointMark: some ChartContent {
        ForEach(ChartData.aachen) { entry in
            PointMark(
                x: .value("Day", entry.date, unit: .month),
                y: .value("Attendees", entry.attendees)
            )
            .foregroundStyle(.red)
        }
    }

    // MARK: Cologne

    @ViewBuilder var cologneChartBar: some View {
        GroupBox("Cologne") {
            Chart {
                cologneBarMark
            }
        }.frame(height: 350)
    }

    @ViewBuilder var cologneChartBarLine: some View {
        GroupBox("Cologne") {
            Chart {
                cologneBarMark
                cologneLineMark
            }
        }.frame(height: 350)
    }

    @ViewBuilder var cologneChartBarLinePoint: some View {
        GroupBox("Cologne") {
            Chart {
                cologneBarMark
                cologneLineMark
                colognePointMark
            }
        }.frame(height: 350)
    }

    @ChartContentBuilder var cologneBarMark: some ChartContent {
        ForEach(ChartData.cologne) { entry in
            BarMark(
                x: .value("Date", entry.date, unit: .month),
                y: .value("Attendees", entry.attendees)
            )
            .foregroundStyle(.orange)
        }
    }

    @ChartContentBuilder var cologneLineMark: some ChartContent {
        ForEach(ChartData.cologne) { entry in
            LineMark(
                x: .value("Day", entry.date, unit: .month),
                y: .value("Attendees", entry.attendees)
            )
            .foregroundStyle(.red)
        }
    }

    @ChartContentBuilder var colognePointMark: some ChartContent {
        ForEach(ChartData.cologne) { entry in
            PointMark(
                x: .value("Day", entry.date, unit: .month),
                y: .value("Attendees", entry.attendees)
            )
            .foregroundStyle(.red)
        }
    }

    // MARK: Series

    @ViewBuilder var seriesChart: some View {
        GroupBox("Sessions") {
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



    @ChartContentBuilder var areaMark: some ChartContent {
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

    @ChartContentBuilder var ruleMark: some ChartContent {
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

    @ChartContentBuilder var series: some ChartContent {
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
