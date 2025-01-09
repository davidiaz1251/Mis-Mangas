//
//  Model.swift
//  Mis Mangas
//
//  Created by luis david diaz ramirez on 21/12/24.
//

import Foundation

struct Manga: Identifiable, Hashable {
    enum Theme: String, CaseIterable {
        case gore = "Gore"
        case military = "Military"
        case mythology = "Mythology"
        case psychological = "Psychological"
        case historical = "Historical"
        case samurai = "Samurai"
        case romanticSubtext = "Romantic Subtext"
        case school = "School"
        case adultCast = "Adult Cast"
        case parody = "Parody"
        case superPower = "Super Power"
        case teamSports = "Team Sports"
        case delinquents = "Delinquents"
        case workplace = "Workplace"
        case survival = "Survival"
        case childcare = "Childcare"
        case iyashikei = "Iyashikei"
        case reincarnation = "Reincarnation"
        case showbiz = "Showbiz"
        case anthropomorphic = "Anthropomorphic"
        case lovePolygon = "Love Polygon"
        case music = "Music"
        case mecha = "Mecha"
        case combatSports = "Combat Sports"
        case isekai = "Isekai"
        case gagHumor = "Gag Humor"
        case crossdressing = "Crossdressing"
        case reverseHarem = "Reverse Harem"
        case martialArts = "Martial Arts"
        case visualArts = "Visual Arts"
        case harem = "Harem"
        case otakuCulture = "Otaku Culture"
        case timeTravel = "Time Travel"
        case videoGame = "Video Game"
        case strategyGame = "Strategy Game"
        case vampire = "Vampire"
        case mahouShoujo = "Mahou Shoujo"
        case highStakesGame = "High Stakes Game"
        case cgdct = "CGDCT"
        case organizedCrime = "Organized Crime"
        case detective = "Detective"
        case performingArts = "Performing Arts"
        case medical = "Medical"
        case space = "Space"
        case memoir = "Memoir"
        case villainess = "Villainess"
        case racing = "Racing"
        case pets = "Pets"
        case magicalSexShift = "Magical Sex Shift"
        case educational = "Educational"
        case idolsFemale = "Idols (Female)"
        case idolsMale = "Idols (Male)"
    }
    
    enum Genre: String, CaseIterable {
        case action = "Action"
        case adventure = "Adventure"
        case awardWinning = "Award Winning"
        case drama = "Drama"
        case fantasy = "Fantasy"
        case horror = "Horror"
        case supernatural = "Supernatural"
        case mystery = "Mystery"
        case sliceOfLife = "Slice of Life"
        case comedy = "Comedy"
        case sciFi = "Sci-Fi"
        case suspense = "Suspense"
        case sports = "Sports"
        case ecchi = "Ecchi"
        case romance = "Romance"
        case girlsLove = "Girls Love"
        case boysLove = "Boys Love"
        case gourmet = "Gourmet"
        case erotica = "Erotica"
        case hentai = "Hentai"
        case avantGarde = "Avant Garde"
    }
    
    enum Demographic: String, CaseIterable {
        case seinen = "Seinen"
        case shounen = "Shounen"
        case shoujo = "Shoujo"
        case josei = "Josei"
        case kids = "Kids"
    }
    
    struct Author: Hashable {
        let lastName: String
        let firstName: String
        let id: UUID
        let role: String
    }
    
    let id: Int
    let title: String
    let titleEnglish: String?
    let titleJapanese: String
    let url: URL?
    let startDate: Date
    let endDate: Date?
    let chapters: Int?
    let volumes: Int?
    let score: Double
    let status: String
    let mainPicture: URL?
    let sypnosis: String
    let background: String?
    let themes: [Theme]
    let authors: [Author]
    let genres: [Genre]
    let demographics: [Demographic]
}
