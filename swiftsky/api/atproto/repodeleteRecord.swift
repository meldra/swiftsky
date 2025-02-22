//
//  repodeleteRecord.swift
//  swiftsky
//

import Foundation

struct RepoDeleteRecordInput: Encodable {
  let repo: String
  let collection: String
  let rkey: String
}

func repoDeleteRecord(uri: String, collection: String) async throws -> Bool {
  let aturi = AtUri(uri: uri)
  return try await NetworkManager.shared.fetch(
    endpoint: "com.atproto.repo.deleteRecord", httpMethod: .post,
    authorization: NetworkManager.shared.user.accessJwt,
    params: RepoDeleteRecordInput(
      repo: NetworkManager.shared.did, collection: collection, rkey: aturi.rkey))
}
