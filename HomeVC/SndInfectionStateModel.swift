//
//  SndInfectionStateModel.swift
//  COVID-19
//
//  Created by 또용이 on 2021/08/21.
//

import Foundation

struct FirstModel: Codable {
    var korea: SecondModel?
    var seoul: SecondModel?
    var busan: SecondModel?
    var daegu: SecondModel?
    var incheon: SecondModel?
    var gwangju: SecondModel?
    var daejeon: SecondModel?
    var ulsan: SecondModel?
    var sejong: SecondModel?
    var gyeonggi: SecondModel?
    var gangwon: SecondModel?
    var chungbuk: SecondModel?
    var chungnam: SecondModel?
    var jeonbuk: SecondModel?
    var jeonnam: SecondModel?
    var gyeongbuk: SecondModel?
    var gyeongnam: SecondModel?
    var jeju: SecondModel?
    var quarantine: SecondModel?

}

struct SecondModel: Codable {
    var countryName: String?
    var newCase: String?
    var totalCase: String?
    var recovered: String?
    var death: String?

}
