//
//  AddTripViewController.swift
//  KaterApp
//
//  Created by Kamaldeep Singh on 1/18/19.
//  Copyright © 2019 kamaldeep. All rights reserved.
//

import UIKit
import ReSwift

class AddTripViewController: UIViewController, StoreSubscriber {
	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var addressLabel: UILabel!
	@IBOutlet weak var startLabel: UILabel!
	@IBOutlet weak var endLabel: UILabel!
	@IBOutlet weak var durationLabel: UILabel!
	@IBOutlet weak var vehicleLabel: UILabel!
	@IBOutlet weak var detailsLabel: UILabel!
	@IBOutlet weak var datePicker: UIDatePicker!

	override func viewWillAppear(_ animated: Bool) {
		mainStore.subscribe(self)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		mainStore.unsubscribe(self)
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

		mainStore.dispatch(TripAction.addTrip)
        // Do any additional setup after loading the view.
    }
    
	func newState(state: AppState) {
		guard let trip = state.newTrip else {
			return
		}
		dateLabel.text = trip.date?.description ?? ""
		addressLabel.text = trip.address?.description ?? ""
		startLabel.text = trip.startTime?.description ?? ""
		endLabel.text = trip.endTime?.description ?? ""
		durationLabel.text = trip.duration
		vehicleLabel.text = trip.vehicle?.description ?? ""
		detailsLabel.text = trip.details
	}
	
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddTripViewController {
	@IBAction func dateChanged(_ datePicker: UIDatePicker) {
		mainStore.dispatch(TripAction.setDate(datePicker.date.description))
	}
}

extension AddTripViewController {
	@IBAction func onRequestClicked(_ button: UIButton) {
		guard let tripToAdd = mainStore.state.newTrip else {
			return
		}
		mainStore.dispatch(addTripRequestAction(tripToAdd))
	}
}
