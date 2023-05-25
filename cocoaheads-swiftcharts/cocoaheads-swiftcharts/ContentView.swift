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
            VStack {
                aachenChartBar
                // aachenChartBarLine
                // aachenChartBarLinePoint

                cologneChartBar
                // cologneChartBarLine
                // cologneChartBarLinePoint

                aachenAreaChart
                aachenAreaChartMinMax
                aachenAreaChartAverage

                cologneAreaChart
                cologneAreaChartMinMax
                cologneAreaChartAverage

                sessionsChart
                sessionsChartStacked
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
