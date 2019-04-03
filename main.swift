//
//  main.swift
//  STEP2_Aiden_Judy
//
//  Created by jang gukjin on 03/04/2019.
//  Copyright © 2019 jang gukjin. All rights reserved.
//

import Foundation

// 단위변환에 필요한 상수들
let inch_cm_num : Double = 2.54
let yard_cm_num : Double = 91.44
let m_cm_num : Double = 100

//단위에따라 값 변환하는 함수들
func cmTom(cm: Double) -> Double { return Double(cm) / m_cm_num }
func mTocm(m: Double) -> Double { return Double(m) * m_cm_num }
func cmToinch(cm: Double) -> Double { return Double(cm) * inch_cm_num }
func inchTocm(inch: Double) -> Double { return Double(inch) / inch_cm_num }
func mToinch(m: Double) -> Double { return Double(m) * (inch_cm_num / m_cm_num) }
func inchTom(inch: Double) -> Double { return Double(inch) / (inch_cm_num / m_cm_num) }
func yardTocm(yard: Double) -> Double { return Double(yard) * yard_cm_num }
func cmToyard(cm: Double) -> Double { return Double(cm) / yard_cm_num }
func yardTom(yard: Double) -> Double { return Double(yard) * (yard_cm_num / m_cm_num) }
func mToyard(m: Double) -> Double { return Double(m) / (yard_cm_num / m_cm_num) }

// 입력받아 숫자와 단위를 구분하는 함수
func input(_ `in` : String)->(num : Double, unit : String)?{
    let unit = `in`.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789."))
    //var unit = str.split(separator: " ")
    guard let num = Double(`in`.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789").inverted)) else{
        print("숫자룰 입력하세요!")
        return nil
    }
    return (num, unit)
}

// 단위를 판단하여 값을 계산하는 함수
func unitconverter(_ input_unit : String) -> String{
    let num_and_unit = input(input_unit)
    var units = num_and_unit!.unit.split(separator: " ")
    if units.count==2{ // 변화할 단위와 변화되는 단위가 모두 존재하는 경우
        let from = units[0]
        let to = units[1]
        
        switch (from, to){
        case ("cm", "inch"):
            return String(cmToinch(cm: num_and_unit!.num)) + "inch"
        case ("cm", "m"):
            return String(cmTom(cm: num_and_unit!.num)) + "m"
        case ("cm", "yard"):
            return String(cmToyard(cm: num_and_unit!.num)) + "yard"
        case ("m", "inch"):
            return String(mToinch(m: num_and_unit!.num)) + "inch"
        case ("m","cm"):
            return String(mTocm(m: num_and_unit!.num)) + "cm"
        case ("m", "yard"):
            return String(mToyard(m: num_and_unit!.num)) + "yard"
        case ("inch", "cm"):
            return String(inchTocm(inch: num_and_unit!.num)) + "cm"
        case ("inch", "m"):
            return String(inchTom(inch: num_and_unit!.num)) + "m"
        case ("yard", "cm"):
            return String(yardTocm(yard: num_and_unit!.num)) + "cm"
        case ("yard", "m"):
            return String(yardTom(yard: num_and_unit!.num)) + "m"
        default:
            return "단위를 똑바로 입력하세요"
        }
    }
    else if units.count==1{ // 변화할 단위만 존재하는 경우
        let from = units[0]
        
        switch from{
        case "cm":
            return String(cmTom(cm: num_and_unit!.num)) + "m"
        case "m":
            return String(mTocm(m: num_and_unit!.num)) + "cm"
        case "inch":
            return String(inchTocm(inch: num_and_unit!.num)) + "cm"
        case "yard":
            return String(yardTom(yard: num_and_unit!.num)) + "m"
        default:
            return "단위를 똑바로 입력하세요"
        }
    }
    else { return "단위를 똑바로 입력하세요" }
}

while true {
    print("숫자와 단위 그리고 바꿀 단위를 띄어써서 입력하세요! : ")
    let `in` = readLine()!
    if `in` == "q" || `in` == "Q"{
        print("끝!!")
        break
    }else{
        if input(`in`) != nil {
            print((unitconverter(`in`)))
        }
    }
}
