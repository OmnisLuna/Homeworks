//
//  contributionСalculation.swift
//  L1_nvleonovich
//
//  Created by nvleonovich on 20/01/2020.
//  Copyright © 2020 nvleonovich. All rights reserved.
//

import Foundation

func findContribution(deposit: Double, percent: Double) {
    var deposit: Double = deposit
    for year in (1..<6) {
        deposit += (deposit * (percent / 100))
        print(year, "-й год: ", deposit)
    }
}
