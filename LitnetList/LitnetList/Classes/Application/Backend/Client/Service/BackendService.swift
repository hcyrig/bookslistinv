//
//  BackendService.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import Foundation

class BackendService {
  
  let client: HttpClient
  
  var accessToken: String? { return SessionService.getToken() }
  
  init(client: HttpClient) {
    
    self.client = client
    
    self.addAccessToken()
  }
  
  private func addAccessToken() {
    if let token = accessToken { client.addHeader("Authorization", value: "Basic \(token)") }
  }
  
  var clientDecoder: DecoderValue { return client.decoder }
  
  func reloadAccessToken() { addAccessToken() }
}
