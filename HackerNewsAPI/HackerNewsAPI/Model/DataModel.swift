//
//  HackerRankNewsModel.swift
//  HackerNewsAPI
//
//  Created by Kein Li on 3/11/24.
//

import Foundation




struct Item: Codable, Hashable {
    
    let id: Int
    let deleted: Bool?
    let type: String
    let by: String?
    let dead: Bool?
    let parent: Int?
    let poll: Int?
    let url: String?
    let score: Int?
    let title: String?
    let parts: [Int]?
    
    let commentCount: Int?
    let creationTime: Date
    let childCommentIDs: [Int]?
    let content: String?
    
    
    // Mark - Computed props
    
    // Computed display time/date prop
    var displayTime : String {
        
        let today = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .weekOfMonth, .hour, .minute, .second], from: creationTime, to: today)

        
        if let day = components.day, day > 0 {
            return "\(String(day)) day(s) ago"
        }
        
        if let hour = components.hour , hour > 0 {
            return "\(String(hour)) hour(s) ago"
        }
            
        if let minute = components.minute, minute > 0{
            return "\(String(minute)) minute(s) ago"
        }
        
        if let second = components.second, second > 0 {
            return "\(String(second)) second(s) ago"
        }
        return ""
    }
    
    var childCommentCount: Int {
        return childCommentIDs?.count ?? 0
    }
    
    
    
    // Used to map JSON keys to custom swift names
    enum CodingKeys: String, CodingKey {
        case id
        case deleted
        case type
        case by
        case dead
        case parent
        case poll
        case url
        case score
        case title
        case parts
        case commentCount = "descendants"
        case creationTime = "time"
        case childCommentIDs = "kids"
        case content = "text"
    }
    
    // Custom init when used for decoder
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.deleted = try container.decodeIfPresent(Bool.self, forKey: .deleted)
        self.type = try container.decode(String.self, forKey: .type)
        self.by = try container.decodeIfPresent(String.self, forKey: .by)
        self.dead = try container.decodeIfPresent(Bool.self, forKey: .dead)
        self.parent = try container.decodeIfPresent(Int.self, forKey: .parent)
        
        self.poll = try container.decodeIfPresent(Int.self, forKey: .poll)
        
        let longUrl = try container.decodeIfPresent(String.self, forKey: .url)
        self.url = longUrl?.replacingOccurrences(of: "https://", with: "")
        
        self.score = try container.decodeIfPresent(Int.self, forKey: .score)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        
        self.parts = try container.decodeIfPresent([Int].self, forKey: .parts)
        self.commentCount = try container.decodeIfPresent(Int.self, forKey: .commentCount)
        
        let epoch_time = try container.decode(Int.self, forKey: .creationTime)
        let date = Date(timeIntervalSince1970: TimeInterval(epoch_time))
        self.creationTime = date
        
        
        self.childCommentIDs = try container.decodeIfPresent([Int].self, forKey: .childCommentIDs)
        self.content = try container.decodeIfPresent(String.self, forKey: .content)
    }
    
    // Item initializer
    init(id: Int, deleted: Bool? = nil, type: String, by: String? = nil, dead: Bool? = nil, parent: Int? = nil, poll: Int? = nil, url: String? = nil, score: Int? = nil, title: String? = nil , parts: [Int]? = nil, commentCount: Int? = nil, creationTime: Double, childCommentIDs: [Int]? = nil, content: String? = nil) {
            self.id = id
            self.deleted = deleted
            self.type = type
            self.by = by
            self.dead = dead
            self.parent = parent
            self.poll = poll
            self.url = url
            self.score = score
            self.title = title
            self.parts = parts
            self.commentCount = commentCount
            
            let date = Date(timeIntervalSince1970: TimeInterval(creationTime))
            self.creationTime = date
            
            self.childCommentIDs = childCommentIDs
            self.content = content
        }
}



//{
//  "about" : "This is a test",
//  "created" : 1173923446,
//  "delay" : 0,
//  "id" : "jl",
//  "karma" : 2937,
//  "submitted" : [ 8265435, 8168423, 8090946, 8090326, 7699907, 7637962, 7596179, 7596163, 7594569, 7562135, 7562111, 7494708, 7494171, 7488093, 7444860, 7327817, 7280290, 7278694, 7097557, 7097546, 7097254, 7052857, 7039484, 6987273, 6649999, 6649706, 6629560, 6609127, 6327951, 6225810, 6111999, 5580079, 5112008, 4907948, 4901821, 4700469, 4678919, 3779193, 3711380, 3701405, 3627981, 3473004, 3473000, 3457006, 3422158, 3136701, 2943046, 2794646, 2482737, 2425640, 2411925, 2408077, 2407992, 2407940, 2278689, 2220295, 2144918, 2144852, 1875323, 1875295, 1857397, 1839737, 1809010, 1788048, 1780681, 1721745, 1676227, 1654023, 1651449, 1641019, 1631985, 1618759, 1522978, 1499641, 1441290, 1440993, 1436440, 1430510, 1430208, 1385525, 1384917, 1370453, 1346118, 1309968, 1305415, 1305037, 1276771, 1270981, 1233287, 1211456, 1210688, 1210682, 1194189, 1193914, 1191653, 1190766, 1190319, 1189925, 1188455, 1188177, 1185884, 1165649, 1164314, 1160048, 1159156, 1158865, 1150900, 1115326, 933897, 924482, 923918, 922804, 922280, 922168, 920332, 919803, 917871, 912867, 910426, 902506, 891171, 807902, 806254, 796618, 786286, 764412, 764325, 642566, 642564, 587821, 575744, 547504, 532055, 521067, 492164, 491979, 383935, 383933, 383930, 383927, 375462, 263479, 258389, 250751, 245140, 243472, 237445, 229393, 226797, 225536, 225483, 225426, 221084, 213940, 213342, 211238, 210099, 210007, 209913, 209908, 209904, 209903, 170904, 165850, 161566, 158388, 158305, 158294, 156235, 151097, 148566, 146948, 136968, 134656, 133455, 129765, 126740, 122101, 122100, 120867, 120492, 115999, 114492, 114304, 111730, 110980, 110451, 108420, 107165, 105150, 104735, 103188, 103187, 99902, 99282, 99122, 98972, 98417, 98416, 98231, 96007, 96005, 95623, 95487, 95475, 95471, 95467, 95326, 95322, 94952, 94681, 94679, 94678, 94420, 94419, 94393, 94149, 94008, 93490, 93489, 92944, 92247, 91713, 90162, 90091, 89844, 89678, 89498, 86953, 86109, 85244, 85195, 85194, 85193, 85192, 84955, 84629, 83902, 82918, 76393, 68677, 61565, 60542, 47745, 47744, 41098, 39153, 38678, 37741, 33469, 12897, 6746, 5252, 4752, 4586, 4289 ]
//}

//
//{
//  "by" : "norvig",
//  "id" : 2921983,
//  "kids" : [ 2922097, 2922429, 2924562, 2922709, 2922573, 2922140, 2922141 ],
//  "parent" : 2921506,
//  "text" : "Aw shucks, guys ... you make me blush with your compliments.<p>Tell you what, Ill make a deal: I'll keep writing if you keep reading. K?",
//  "time" : 1314211127,
//  "type" : "comment"
//}


enum GetCase: String {
    case topStories = "topstories"
    case newStories = "newstories"
    case bestStories = "beststories"
}




// Mark - Mock Data

extension Item {
    static func mockStory() -> Item {
        
        let item = Item(id: 0,
                        deleted: nil,
                        type: "story",
                        by: "test",
                        dead: nil,
                        parent: nil,
                        poll: nil,
                        url: "www.getdropbox.com",
                        score: 111,
                        title: "My YC app: Dropbox - Throw away your USB drive",
                        parts: nil,
                        commentCount: 71,
                        creationTime: 1175714200,
                        childCommentIDs: [1,2],
                        content: nil)
        return item

    }
    
    static func mockComment() -> Item {
        let item = Item(id: 123,
                        deleted: nil,
                        type: "comment",
                        by: "norvig",
                        dead: nil,
                        parent: 2921506,
                        poll: nil,
                        url: nil,
                        score: nil,
                        title: nil,
                        parts: nil,
                        commentCount: nil,
                        creationTime:  1314211127,
                        childCommentIDs: [],
                        content: "Aw shucks, guys ... you make me blush with your compliments.<p>Tell you what, Ill make a deal: I'll keep writing if you keep reading. K?")
        return item
    }
}



