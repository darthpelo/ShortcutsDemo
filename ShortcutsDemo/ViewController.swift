//
//  ViewController.swift
//  ShortcutsDemo
//
//  Created by Alessio Roberto on 06/06/2018.
//  Copyright © 2018 Alessio Roberto. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    lazy var notificationCenter: NotificationCenter = {
        NotificationCenter.default
    }()

    deinit {
        notificationCenter.removeObserver(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        activitySetup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        notificationCenter.addObserver(self,
                                       selector: #selector(ViewController.enterForegroundOperation),
                                       name: UIApplication.didBecomeActiveNotification,
                                       object: nil)
    }

    @objc func enterForegroundOperation() {
        if let action = UserDefaults.standard.actionState {
            if action == "com.alessioroberto.example.showmoreinfo" {
                self.performSegue(withIdentifier: "ShowMoreInfo", sender: self)
            }
            // Reset state
            UserDefaults.standard.actionState = nil
        }
    }

    private func activitySetup() {
        // give our activity a unique ID
        let activity = NSUserActivity(activityType: "com.alessioroberto.example.showinfo")

        // give it a title that will be displayed to users
        activity.title = "Show the latest info"

        // allow Siri to index this and use it for voice-matched queries
        activity.isEligibleForSearch = true
        activity.isEligibleForPrediction = true

        // attach some example information that we can use when loading the app from this activity
        activity.userInfo = ["message": "Important last info!"]

        // give the activity a unique identifier so we can delete it later if we need to
        activity.persistentIdentifier = NSUserActivityPersistentIdentifier("abc")

        // make this activity active for the current view controller – this is what Siri will restore when the activity is triggered
        self.userActivity = activity
    }
}

