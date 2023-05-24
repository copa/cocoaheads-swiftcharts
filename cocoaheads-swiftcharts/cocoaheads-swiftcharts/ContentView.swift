//
//  ContentView.swift
//  cocoaheads-swiftcharts
//
//  Created by Gerd Bernhardt on 24.05.23.
//

import Charts
import SwiftUI


struct ContentView: View {
    var aachenData = ChartData.Aachen

    var body: some View {
        Chart {
            points
        }
        .padding()
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
