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
        VStack {
            aachenChartBarLinePoint
            cologneChartBarLinePoint
            seriesChart
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
