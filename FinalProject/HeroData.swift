//
//  HeroData.swift
//  FinalProject
//
//  Created by Admin on 05/04/2022.
//

import Foundation

struct HeroData: Decodable {
    let id: Int
    let localizedName: String?
    let primaryAttr: String?
    let attackType: String?
    let roles: [String]
    let img: String
    let baseHealth: Int?
    let baseHealthRegen: Double?
    let baseMana: Int?
    let baseManaRegen: Double?
    let baseArmor: Double?
    let baseMr: Int?
    let baseAttackMin: Int?
    let baseAttackMax: Int?
    let baseStr: Int?
    let baseAgi: Int?
    let baseInt: Int?
    let strGain: Double?
    let agiGain: Double?
    let intGain: Double?
    let attackRange: Int?
    let projectileSpeed: Int?
    let attackRate: Double?
    let moveSpeed: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case localizedName = "localized_name"
        case primaryAttr = "primary_attr"
        case attackType = "attack_type"
        case roles
        case img
        case baseHealth = "base_health"
        case baseHealthRegen = "base_health_regen"
        case baseMana = "base_mana"
        case baseManaRegen = "base_mana_regen"
        case baseArmor = "base_armor"
        case baseMr = "base_mr"
        case baseAttackMin = "base_attack_min"
        case baseAttackMax = "base_attack_max"
        case baseStr = "base_str"
        case baseAgi = "base_agi"
        case baseInt = "base_int"
        case strGain = "str_gain"
        case agiGain = "agi_gain"
        case intGain = "intGain"
        case attackRange = "attack_range"
        case projectileSpeed = "projectile_speed"
        case attackRate = "attack_rate"
        case moveSpeed = "move_speed"
    }
}
