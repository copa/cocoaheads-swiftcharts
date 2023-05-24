//
//  ContentView.swift
//  cocoaheads-swiftcharts
//
//  Created by Gerd Bernhardt on 24.05.23.
//

import Charts
import SwiftUI

 struct ChartDataEntry: Identifiable {
    let id = UUID()
    let x: Double
    let y: Double
 }

struct ContentView: View {
    var data: [ChartDataEntry] = [
        ChartDataEntry(x: 10.0, y: 20.0),
        ChartDataEntry(x: 20.0, y: 40.0),
        ChartDataEntry(x: 40.0, y: 40.0)
    ]

    var body: some View {
        Chart {
            points
        }
        .padding()
    }

    func date(_ year: Int, _ month: Int, _ day: Int = 1) -> Date {
        Calendar.current.date(from: DateComponents(year: year, month: month, day: day)) ?? Date()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
extension ContentView {
    @ChartContentBuilder private var points: some ChartContent {
        ForEach(data, id: \.id) { value in
            PointMark(
                x: .value("value", value.x),
                y: .value("lactate", value.y)
            )
            .foregroundStyle(by: .value("pointsstyle", "Points"))
            .annotation {
//                Text(verbatim: "\((value.y * lactateModel.yMax).formatted(.number.precision(.fractionLength(2))))")
//                    .font(.footnote)
            }
        }
    }
}
