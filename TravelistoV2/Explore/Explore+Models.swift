//
//  Explore+Models.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/28/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import Foundation


struct ExploreBaseModel : Codable {
    let place : TravelistoPlace
    let placesOfInterest : [[TravelistoPlace]]
    let restuarants : [[TravelistoPlace]]
}

struct TravelistoPlace : Codable {
    let detail : SygicPlaceDetail
    let images : [PixabayImage]
    let wikipedia : String
}

enum Level : String {
    case continent, country, state, region, county, city, town, village, settlement, locality,
    neighbourhood, archipelago, island, poi
}

struct SygicPlaceDetail : Codable {
    let id : String
    let level : String
    let rating : Double
    let ratingLocal : Double
    
    struct Location : Codable {
        let lat : Double
        let lng : Double
    }
    
    let location : Location
    
    struct Boundingbox : Codable {
        let south : Double
        let west : Double
        let north : Double
        let east : Double
    }
    
    let boundingBox : Boundingbox?
    let name : String
    let nameSuffix : String?
    let url : URL?
    let duration : Int?
    let marker : String
    let categories : [String]
    let parentIds : [String]
    let perex : String?
    let customerRating : Float?
    let starRating : Double?
    let starRatingUnofficial : Double?
    let thumbnailUrl : URL?
    let area : Int
    let address : String?
    let admission : String?
    let email : String?
    let openingHours : String?
    let isDeleted : Bool
    
    struct Description : Codable {
        let text : String
        let provider : String?
        let translationProvider : String?
        let link : String?
        let isTranslated : Bool
        
        private enum CodingKeys : String, CodingKey {
            case text
            case provider
            case translationProvider = "translation_provider"
            case link
            case isTranslated = "is_translated"
        }
    }
    
    let description : Description
    let mediaCount : Int
    
    struct MainMedia : Codable {
        
        struct Usage : Codable {
            let square : String
            let videoPreview : String?
            let portrait : String
            let landscape : String
            
            private enum CodingKeys : String, CodingKey {
                case square
                case videoPreview = "video_preview"
                case portrait
                case landscape
            }
        }
        
        let usage : Usage
        
        struct Media : Codable {
            
            struct Original : Codable {
                let size : Int?
                let width : Int?
                let height : Int?
            }
            let original : Original
            let suitability : [String]
            let urlTemplate : String?
            let createdAt : String?
            struct Source : Codable {
                let provider : String
                let name : String?
                let externalId : String?
                private enum CodingKeys : String, CodingKey {
                    case provider
                    case name
                    case externalId = "external_id"
                }
            }
            let source : Source
            let type : String
            let createdBy : String?
            let url : URL?
            let quadkey : String?
            struct Attribution : Codable {
                let titleUrl : URL?
                let license : String?
                let other : String?
                let authorUrl : URL?
                let author : String?
                let title : String?
                let licenseUrl : URL?
                private enum CodingKeys : String, CodingKey {
                    case titleUrl = "title_url"
                    case license
                    case other
                    case authorUrl = "author_url"
                    case author
                    case title
                    case licenseUrl = "license_url"
                }
            }
            let attribution : Attribution
            let location : Location?
            let id : String
            
            private enum CodingKeys : String, CodingKey {
                case original
                case suitability
                case urlTemplate = "url_template"
                case createdAt = "created_at"
                case source
                case type
                case createdBy = "created_by"
                case url
                case quadkey
                case attribution
                case location
                case id
            }
        }
        
        let media : [Media]
    }
    
    let mainMedia : MainMedia?
    
    struct Reference : Codable {
        let id : Int
        let title : String
        let type : String
        let languageID : String?
        let url : String?
        let supplier : String?
        let priority : Int
        let currency : String?
        let price : Double?
        let flags : [String]
        
        private enum CodingKeys : String, CodingKey {
            case id
            case title
            case type
            case languageID = "language_id"
            case url
            case supplier
            case priority
            case currency
            case price
            case flags
        }
    }
    
    let references : [Reference]
    
    struct ExternalID : Codable {
        let id : String
        let type : String
        let languageID : String?
        private enum CodingKeys : String, CodingKey {
            case id
            case type
            case languageID = "language_id"
        }
    }
    
    let externalIds : [ExternalID]
    let collectionCount : Int
    
    private enum CodingKeys : String, CodingKey {
        case id
        case level
        case rating
        case ratingLocal = "rating_local"
        case location
        case boundingBox = "bounding_box"
        case name
        case nameSuffix = "name_suffix"
        case url
        case duration
        case marker
        case categories
        case parentIds = "parent_ids"
        case perex
        case customerRating = "customer_rating"
        case starRating = "star_rating"
        case starRatingUnofficial = "star_rating_unofficial"
        case thumbnailUrl = "thumbnail_url"
        case area
        case address
        case admission
        case email
        case openingHours = "opening_hours"
        case isDeleted  = "is_deleted"
        case description
        case mediaCount = "media_count"
        case mainMedia = "main_media"
        case references
        case externalIds = "external_ids"
        case collectionCount = "collection_count"
    }
    
}

struct PixabayImage : Codable {
    let largeImageURL : URL?
    let webformatHeight : Int
    let webformatWidth : Int
    let likes : Int
    let imageWidth : Int
    let id : Int
    let userID : Int
    let views : Int
    let comments : Int
    let pageURL : URL?
    let imageHeight : Int
    let webformatURL : URL?
    let type : String
    let previewHeight : Int
    let downloads : Int
    let favorites : Int
    let imageSize : Int
    let previewWidth : Int
    let previewURL : URL?
    
    private enum CodingKeys : String, CodingKey {
        case largeImageURL
        case webformatHeight
        case webformatWidth
        case likes
        case imageWidth
        case id
        case userID = "user_id"
        case views
        case comments
        case pageURL
        case imageHeight
        case webformatURL
        case type
        case previewHeight
        case downloads
        case favorites
        case imageSize
        case previewWidth
        case previewURL
    }
}



















