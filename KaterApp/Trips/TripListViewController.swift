////
////  TripListViewController.swift
////  KaterApp
////
////  Created by Kamaldeep Singh on 1/19/19.
////  Copyright © 2019 kamaldeep. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//class TripListViewController: UIViewController, UITableViewDelegate, StoreSubscriber {
//	@IBOutlet weak var dateLabel: UILabel!
//	
//	override func viewWillAppear(_ animated: Bool) {
//		mainStore.subscribe(self)
//	}
//	
//	override func viewWillDisappear(_ animated: Bool) {
//		mainStore.unsubscribe(self)
//	}
//	
//	override func viewDidLoad() {
//		super.viewDidLoad()
//		
//		mainStore.dispatch(TripAction.addTrip)
//		// Do any additional setup after loading the view.
//	}
//	
//	func newState(state: AppState) {
//		guard let trips = state.trips else {
//			return
//		}
//	}
//	
//	
//	/*
//	// MARK: - Navigation
//	
//	// In a storyboard-based application, you will often want to do a little preparation before navigation
//	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//	// Get the new view controller using segue.destination.
//	// Pass the selected object to the new view controller.
//	}
//	*/
//	
//}
//
//extension AddTripViewController {
//	@IBAction func dateChanged(_ datePicker: UIDatePicker) {
//		mainStore.dispatch(TripAction.setDate(datePicker.date.description))
//	}
//}
//
//extension AddTripViewController {
//	@IBAction func onRequestClicked(_ button: UIButton) {
//		guard let tripToAdd = mainStore.state.newTrip else {
//			return
//		}
//		mainStore.dispatch(addTripRequestAction(tripToAdd))
//	}
//}
