//
//  MoreInfoViewController.swift
//  ShortcutsDemo
//
//  Created by Alessio Roberto on 06/06/2018.
//  Copyright © 2018 Alessio Roberto. All rights reserved.
//

import UIKit

class MoreInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        activitySetup()
    }

    private func activitySetup() {
        // give our activity a unique ID
        let activity = NSUserActivity(activityType: "com.alessioroberto.example.showmoreinfo")

        // give it a title that will be displayed to users
        activity.title = "Show more info"

        // allow Siri to index this and use it for voice-matched queries
        activity.isEligibleForSearch = true
        activity.isEligibleForPrediction = true

        // attach some example information that we can use when loading the app from this activity
        activity.userInfo = ["message": "There're more info!"]

        // give the activity a unique identifier so we can delete it later if we need to
        activity.persistentIdentifier = NSUserActivityPersistentIdentifier("def")

        // make this activity active for the current view controller – this is what Siri will restore when the activity is triggered
        self.userActivity = activity
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
