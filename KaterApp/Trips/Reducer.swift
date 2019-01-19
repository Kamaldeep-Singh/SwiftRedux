//
//  Reducer.swift
//  KaterApp
//
//  Created by Kamaldeep Singh on 1/18/19.
//  Copyright © 2019 kamaldeep. All rights reserved.
//

import Foundation
import ReSwift

public func tripReducer(action: Action, state: AppState?) -> AppState {
	var newState = state ?? AppState(trips: [], newTrip: nil)
	guard let action = action as? TripAction else {
		return newState
	}

	switch action {
	case .listTrips(let trips):
		newState.trips.append(contentsOf: trips)
	case .addTrip:
		newState.newTrip = Trip.empty
	case .setDate(let date):
		newState.newTrip?.date = date
	case .setAddress(let address):
		newState.newTrip?.address = address
	case .setStartTime(let startTime):
		newState.newTrip?.startTime = startTime
	case .setEndTime(let endTime):
		newState.newTrip?.endTime = endTime
	case .setVehicle(let vehicle):
		newState.newTrip?.vehicle = vehicle
	case .addTripDetails(let details):
		newState.newTrip?.details = details
	case .requestDriver(let trip):
		newState.trips.append(trip)
	case .cancel:
		newState.newTrip = nil
	case .added(let trip):
		print(trip)
		newState.newTrip = nil
	}
	return newState
}
