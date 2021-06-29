//
//  ApiRouter.swift
//  SwensonTask
//
//  Created by Mohamed Eldewaik on 28/06/2021.
//

import Alamofire



enum APIRouter: URLRequestConvertible {
        
    static func baseURL() -> URL {
        return URL(string: "http://data.fixer.io/api/")!
    }
    
    /*==========================================================================================*/
    
    case getAllCounntries
    
    /*==========================================================================================*/
    
    var method: HTTPMethod {
        switch self {
        case .getAllCounntries: return .get
        }
    }
    
    /*==========================================================================================*/
    
    var path: URL {
        let base = APIRouter.baseURL()
        switch self {
        case .getAllCounntries: return base.appendingPathComponent("latest")
        }
    }
    
    /*==========================================================================================*/
    
    func asURLRequest() throws -> URLRequest {
        var params = Parameters()
        var urlRequest = URLRequest(url: path)
        urlRequest.httpMethod = method.rawValue
                
        switch self {
        case .getAllCounntries:
            params["access_key"] = Constants.AppSetting.accessApiKey
            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
        }
        return urlRequest
    }
}
