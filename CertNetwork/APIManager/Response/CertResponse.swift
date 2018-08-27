//
//  CertResponse.swift
//  CertNetwork
//
//  Created by Thongpak on 25/8/2561 BE.
//  Copyright © 2561 thongpak. All rights reserved.
//

import Foundation

class CertResponse: BaseResponse {
    var certs = [CertDetail]()
    
    enum codingKeys: String, CodingKey {
        case data
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        if let container = try? decoder.container(keyedBy: codingKeys.self), !container.allKeys.isEmpty {
            certs = try container.decode([CertDetail].self, forKey: .data)
        }
    }
}


class CertDetail: Decodable {
    var desc: String?
    var certCreatorName: String?
    var approveBy: String?
    var issueDate: String?
    var category: String?
    var expireDate: String?
    var certId: String?
    var certCreator: String?
    var certName: String?
}
