//
//  Actions.swift
//  KaterApp
//
//  Created by Kamaldeep Singh on 1/18/19.
//  Copyright © 2019 kamaldeep. All rights reserved.
//

import Foundation
import ReSwift
import ReSwiftThunk

// UI Actions
public enum TripAction: Action {
	case listTrips([Trip])
	case addTrip
	case setDate(Date)
	case setAddress(Address)
	case setStartTime(Date)
	case setEndTime(Date)
	case setVehicle(Vehicle)
	case addTripDetails(String)
	case requestDriver(Trip)
	case cancel
	case added(Trip)
}

// Network Actions
public func fetch<T: Codable>(_ request: URLRequest, completion: ((T) -> Void)?) {
	URLSession.shared.dataTask(with: request) { (data, res, err) in
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .deferredToDate
		guard let data = data,
			let jsonObj = try? decoder.decode(T.self, from: data) else {
				return
		}
		completion?(jsonObj)
	}.resume()
}

public func addTripRequestAction(_ trip: Trip) -> Thunk<AppState> {
	return Thunk<AppState> { dispatch, getState in
		var req = URLRequest(url: URL(string: "http://localhost:2334/add")!)
		req.httpBody = try? JSONEncoder().encode(trip)
		req.httpMethod = "POST"
		req.addValue("application/json", forHTTPHeaderField: "Content-Type")
		fetch(req) {
			dispatch(TripAction.added($0))
		}
	}
}
