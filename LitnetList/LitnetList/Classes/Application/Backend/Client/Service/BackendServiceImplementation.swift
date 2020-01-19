//
//  BackendServiceImplementation.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

class BackendServiceImplementation: BackendService {
  
  let service = SessionService()
  
  init() {
    
    SessionService.saveToken(
      service.reequiresModel.LSecBundleApplicationRequires.Transportt)
    
    let httpClient = AlamofireHttpClient(
      baseUrl: URL(string: service.reequiresModel.LSecBundleApplicationRequires.Transportp)!,
      decoder: DictionaryDecoder())
    
    super.init(client: httpClient)
  }
  
  func params(userToken: String) -> [String: String] {
    return addVersion(addDebug(sign(addToken(addDevice(addApp([:])), userToken: userToken), userToken: userToken)))
  }
  
  private func addApp(_ params: [String: String]) -> [String: String] {
    var params = params
    params["app"] = UIDevice.osTypeMark
    return params
  }
  
  private func addDevice(_ params: [String: String]) -> [String: String] {
    var params = params
    params["device_id"] = UIDevice.identifier
    return params
  }
  
  private func addToken(_ params: [String: String], userToken: String) -> [String: String] {
    var params = params
    params["user_token"] = userToken
    return params
  }
  
  private func sign(_ params: [String: String], userToken: String) -> [String: String] {
    var params = params
    params["sign"] = String.MD5Hex(string: [UIDevice.identifier, service.reequiresModel.LSecBundleApplicationRequires.Transportc, userToken].joined(separator: ""))
    return params
  }
  
  private func addDebug(_ params: [String: String]) -> [String: String] {
    var params = params
    params["debug"] = "1"
    return params
  }
  
  private func addVersion(_ params: [String: String]) -> [String: String] {
    var params = params
    params["version"] = "50"
    return params
  }
  
  func decodeData(data: Data) -> Data? {
    return try? AES(keyString: service.reequiresModel.LSecBundleApplicationRequires.Transportc).decrypt(data)
  }
}
