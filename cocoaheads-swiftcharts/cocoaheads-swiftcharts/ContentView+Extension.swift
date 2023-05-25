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
        GroupBox("Aachen Attendees") {
            Chart {
                aachenBarMark
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }
        }
        .frame(height: 350)
    }

    @ViewBuilder var aachenChartBarLine: some View {
        GroupBox("Aachen Attendees") {
            Chart {
                aachenBarMark
                aachenLineMark
            }
        }.frame(height: 350)
    }

    @ViewBuilder var aachenChartBarLinePoint: some View {
        GroupBox("Aachen Attendees") {
            Chart {
                aachenBarMark
                aachenLineMark
                aachenPointMark
            }
        }

        .frame(height: 350)
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
            .interpolationMethod(.linear)
            .foregroundStyle(.red)
        }
    }

    @ChartContentBuilder var aachenPointMark: some ChartContent {
        ForEach(ChartData.aachen) { entry in
            PointMark(
                x: .value("Day", entry.date, unit: .month),
                y: .value("Attendees", entry.attendees)
            )
//            .symbol() {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 10, height: 10)
//            }
            .symbolSize(1.0)
            .foregroundStyle(.red)
        }
    }

    @ViewBuilder var aachenAreaChart: some View {
        let yellowGradient = LinearGradient(
            gradient: Gradient (
                colors: [
                    .yellow.opacity(0.75),
                    .yellow.opacity(0.5),
                    .yellow.opacity(0.025),
                ]
            ),
            startPoint: .top,
            endPoint: .bottom
        )
        GroupBox("Aachen Attendees") {
            Chart {
                ForEach(ChartData.aachen) { entry in
                    LineMark(
                        x: .value("Day", entry.date, unit: .month),
                        y: .value("Attendees", entry.attendees)
                    ).foregroundStyle(.yellow)

                    AreaMark(
                        x: .value("Day", entry.date, unit: .month),
                        y: .value("Attendees", entry.attendees)
                    ).foregroundStyle(yellowGradient)
                }
            }
        }
        .frame(height: 350)
    }

    @ViewBuilder var aachenAreaChartMinMax: some View {
        let data = ChartData.aachen
        let attendees = data.map({ $0.attendees })
        let minValue = attendees.min() ?? 0
        let maxValue = attendees.max() ?? 0

        GroupBox("Aachen Attendees Min/Max") {
            Chart {
                ForEach(data) { entry in
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
                    .foregroundStyle(.red)
                }
            }
        }
        .frame(height: 350)
    }

    @ViewBuilder var aachenAreaChartAverage: some View {
        let curGradient = LinearGradient(
            gradient: Gradient (
                colors: [
                    .yellow.opacity(0.75),
                    .yellow.opacity(0.5),
                    .yellow.opacity(0.025),
                ]
            ),
            startPoint: .top,
            endPoint: .bottom
        )

        let data = ChartData.aachen
        let attendees = data.map({ $0.attendees })
        let avgValue = attendees.reduce(0, +) / attendees.count

        GroupBox("Aachen Attendees Average") {
            Chart {
                ForEach(data) { entry in
                    LineMark(
                        x: .value("Day", entry.date, unit: .month),
                        y: .value("Attendees", entry.attendees)
                    ).foregroundStyle(.yellow)

                    AreaMark(
                        x: .value("Day", entry.date, unit: .month),
                        y: .value("Attendees", entry.attendees)
                    ).foregroundStyle(curGradient)
                }

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
        }
        .frame(height: 350)
    }

    // MARK: Cologne

    @ViewBuilder var cologneChartBar: some View {
        GroupBox("Cologne Attendees") {
            Chart {
                cologneBarMark
            }
        }.frame(height: 350)
    }

    @ViewBuilder var cologneChartBarLine: some View {
        GroupBox("Cologne Attendees") {
            Chart {
                cologneBarMark
                cologneLineMark
            }
        }.frame(height: 350)
    }

    @ViewBuilder var cologneChartBarLinePoint: some View {
        GroupBox("Cologne Attendees") {
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

    @ViewBuilder var cologneAreaChart: some View {
        let curGradient = LinearGradient(
            gradient: Gradient (
                colors: [
                    .purple.opacity(0.75),
                    .purple.opacity(0.5),
                    .purple.opacity(0.025),
                ]
            ),
            startPoint: .top,
            endPoint: .bottom
        )
        GroupBox("Cologne Attendees") {
            Chart {
                ForEach(ChartData.cologne) { entry in
                    LineMark(
                        x: .value("Day", entry.date, unit: .month),
                        y: .value("Attendees", entry.attendees)
                    ).foregroundStyle(.yellow)

                    AreaMark(
                        x: .value("Day", entry.date, unit: .month),
                        y: .value("Attendees", entry.attendees)
                    ).foregroundStyle(curGradient)
                }
            }
        }
        .frame(height: 350)
    }

    @ViewBuilder var cologneAreaChartMinMax: some View {
        let data = ChartData.cologne
        let attendees = data.map({ $0.attendees })
        let minValue = attendees.min() ?? 0
        let maxValue = attendees.max() ?? 0

        GroupBox("Aachen Attendees Min/Max") {
            Chart {
                ForEach(data) { entry in
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
                    .foregroundStyle(.red)
                }
            }
        }
        .frame(height: 350)
    }

    // MARK: Sessions

    @ViewBuilder var sessionsChart: some View {
        GroupBox("Sessions by City") {
            Chart {
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
                    .position(by: .value("City", series.city), axis: .vertical)
                }
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

    @ViewBuilder var sessionsChartStacked: some View {
        GroupBox("Sessions by City stacked") {
            Chart {
                ForEach(ChartData.series, id: \.city) { series in
                    Plot {
                        ForEach(series.data) { entry in
                            BarMark(
                                x: .value("Attendees", entry.attendees),
                                y: .value("Day", entry.date, unit: .month)
                            )
                            .foregroundStyle(by: .value("City", series.city))
                        }
                        .position(by: .value("City", series.city), axis: .horizontal)
                    }
                }
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .month)) { _ in
                    AxisTick()
                    AxisGridLine()
                    AxisValueLabel(format: .dateTime.month(.abbreviated), centered: true)
                }
            }
        }
        .frame(height: 350)
    }
}

@ViewBuilder var cologneAreaChartAverage: some View {
    let curGradient = LinearGradient(
        gradient: Gradient (
            colors: [
                .yellow.opacity(0.75),
                .yellow.opacity(0.5),
                .yellow.opacity(0.025),
            ]
        ),
        startPoint: .top,
        endPoint: .bottom
    )

    let data = ChartData.cologne
    let attendees = data.map({$0.attendees})
    let avgValue = attendees.reduce(0, +) / attendees.count

    GroupBox("Cologne Attendees Average") {
        Chart {
            ForEach(data) { entry in
                LineMark(
                    x: .value("Day", entry.date, unit: .month),
                    y: .value("Attendees", entry.attendees)
                ).foregroundStyle(.yellow)

                AreaMark(
                    x: .value("Day", entry.date, unit: .month),
                    y: .value("Attendees", entry.attendees)
                ).foregroundStyle(curGradient)
            }

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
    }
    .frame(height: 350)
}
