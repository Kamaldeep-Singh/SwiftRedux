//
//  Actions.swift
//  KaterStore
//
//  Created by Kamaldeep Singh on 1/18/19.
//  Copyright © 2019 kamaldeep. All rights reserved.
//

import Foundation

public enum VehicleTransmission: String, Codable {
	case manual
	case automatic
	case unknown = ""
}

public struct Address: Codable {
	let houseNumber: String?
	let streetAddress: String?
	let city: String?
	let province: String?
	let country: String?
	let zipCode: String?
}

public struct Vehicle: Codable {
	let photo: URL?
	let make: String?
	let license: String?
	let transmission: VehicleTransmission?
}

public struct Trip: Codable {
	var id: String?
	var date: Date?
	var address: Address?
	var startTime: Date?
	var endTime: Date?
	var vehicle: Vehicle?
	var details: String?
}

// mark:- 
extension Address {
	var description: String {
		return "\(houseNumber) \(streetAddress) \(city) \(province) \(country) \(zipCode)"
	}
	
	static var empty: Address {
		return Address(
			houseNumber: "",
			streetAddress: "",
			city: "",
			province: "",
			country: "",
			zipCode: ""
		)
	}
}


extension Vehicle {
	var description: String {
		return "\(make) \(license) \(transmission)"
	}

	static var empty: Vehicle {
		return Vehicle(
			photo: URL(string: "http://asd/asd.gif")!,
			make: "",
			license: "",
			transmission: .unknown
		)
	}
}

extension Trip {
	var duration: String {
		return "end time - start time"
	}
	
	static var empty: Trip {
		return Trip(
			id: nil,
			date: nil,
			address: Address.empty,
			startTime: nil,
			endTime: nil,
			vehicle: Vehicle.empty,
			details: ""
		)
	}
}
