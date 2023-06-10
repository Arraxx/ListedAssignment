//
//  ApiResponse.swift
//  Listed_assignment
//
//  Created by Aman Kumar on 08/06/23.
//

import Foundation

struct APIResponse: Codable {
    let status: Bool
    let statusCode: Int
    let message: String
    let supportWhatsappNumber: String
    let extraIncome: Float
    let totalLinks: Int
    let totalClicks: Int
    let todayClicks: Int
    let topSource: String
    let topLocation: String
    let startTime: String
    let linksCreatedToday: Int
    let appliedCampaign: Int
    let data: APIResponseData

    private enum CodingKeys: String, CodingKey {
        case status, statusCode, message, startTime, data
        case totalLinks = "total_links"
        case extraIncome = "extra_income"
        case totalClicks = "total_clicks"
        case todayClicks = "today_clicks"
        case topSource = "top_source"
        case topLocation = "top_location"
        case linksCreatedToday = "links_created_today"
        case appliedCampaign = "applied_campaign"
        case supportWhatsappNumber = "support_whatsapp_number"
    }
}

struct APIResponseData: Codable {
    let recentLinks: [Link]
    let topLinks: [Link]
    let overallURLChart: [String: Int]
    
    private enum CodingKeys: String, CodingKey {
        case recentLinks = "recent_links"
        case topLinks = "top_links"
        case overallURLChart = "overall_url_chart"
    }
}

struct Link: Codable {
    let urlID: Int
    let webLink: String
    let smartLink: String
    let title: String
    let totalClicks: Int
    let originalImage: String
    let thumbnail: String?
    let timesAgo: String
    let createdAt: String
    let domainID: String
    let urlPrefix: String?
    let urlSuffix: String
    let app: String

    private enum CodingKeys: String, CodingKey {
        case urlID = "url_id"
        case webLink = "web_link"
        case smartLink = "smart_link"
        case totalClicks = "total_clicks"
        case originalImage = "original_image"
        case timesAgo = "times_ago"
        case createdAt = "created_at"
        case domainID = "domain_id"
        case urlPrefix = "url_prefix"
        case urlSuffix = "url_suffix"
        case title, thumbnail, app
    }
}
