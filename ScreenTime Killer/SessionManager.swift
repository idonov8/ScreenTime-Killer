//
//  SessionManager.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 23/08/2024.
//

import Foundation

final class SessionManager: ObservableObject {
    
    enum UserDefaultKeys {
       static let storedCurrentStep = "currentStep"
       static let storedUsageGoalDuration = "usageGoalDuration"
       static let storedUsageGoalDays = "usageGoalDays"
       static let storedGoalSetDate = "usageGoalSetDate"
       static let storedRiskAmount = "riskAmount"
   }

    enum CurrentStep: Int {
        case Step1 = 1
        case Step2 = 2
        case Step3 = 3
        case Step4 = 4
        case Step5 = 5
        case Finished = 6
    }

    @Published private(set) var currentStep: CurrentStep? {
        didSet {
            if let step = currentStep {
                UserDefaults.standard.set(step.rawValue, forKey: UserDefaultKeys.storedCurrentStep)
            } else {
                UserDefaults.standard.removeObject(forKey: UserDefaultKeys.storedCurrentStep)
            }
        }
    }

    @Published var usageGoalDuration: TimeInterval {
        didSet {
            UserDefaults.standard.set(usageGoalDuration, forKey: UserDefaultKeys.storedUsageGoalDuration)
        }
    }

    @Published var usageGoalDays: Int {
        didSet {
            UserDefaults.standard.set(usageGoalDays, forKey: UserDefaultKeys.storedUsageGoalDays)
        }
    }

    @Published var goalSetDate: Date {
        didSet {
            UserDefaults.standard.set(goalSetDate, forKey: UserDefaultKeys.storedGoalSetDate)
        }
    }
    
    @Published var riskAmount: Int {
        didSet {
            UserDefaults.standard.set(riskAmount, forKey: UserDefaultKeys.storedRiskAmount)
        }
    }

    init() {
        // Initialize current step
        if let storedStep = UserDefaults.standard.object(forKey: UserDefaultKeys.storedCurrentStep) as? Int,
           let step = CurrentStep(rawValue: storedStep) {
            self.currentStep = step
        } else {
            self.currentStep = .Step1
        }

        // Initialize usage goal
        self.usageGoalDuration = UserDefaults.standard.double(forKey: UserDefaultKeys.storedUsageGoalDuration)
        self.usageGoalDays = UserDefaults.standard.integer(forKey: UserDefaultKeys.storedUsageGoalDays)

        // Initialize goal set date
        if let date = UserDefaults.standard.object(forKey: UserDefaultKeys.storedGoalSetDate) as? Date {
            self.goalSetDate = date
        } else {
            self.goalSetDate = Date()
        }
        
        // Initialize risk amount
        self.riskAmount = UserDefaults.standard.integer(forKey: UserDefaultKeys.storedRiskAmount)

    }
    
    func initStep() {
        currentStep = .Step1
    }

    func NextStep() {
        switch currentStep {
        case .Step1:
            currentStep = .Step2
        case .Step2:
            currentStep = .Step3
        case .Step3:
            currentStep = .Step4
        case .Step4:
            currentStep = .Step5
        case .Step5:
            currentStep = .Finished
        case .Finished:
            break
        case nil:
            currentStep = .Step1
        }
    }
    
    func PrevStep() {
        switch currentStep {
        case .Step1:
            break
        case .Step2:
            currentStep = .Step1
        case .Step3:
            currentStep = .Step2
        case .Step4:
            currentStep = .Step3
        case .Step5:
            currentStep = .Step4
        case .Finished:
            currentStep = .Step5
        case nil:
            currentStep = .Step1
        }
    }

    func setUsageGoal(duration: TimeInterval, days: Int) {
        self.usageGoalDuration = duration
        self.usageGoalDays = days
        self.goalSetDate = Date()
        saveUsageGoalToAppGroup(duration)
    }

    func saveUsageGoalToAppGroup(_ duration: TimeInterval) {
        // TODO: this is redundant, can be saved to app group using the already in-use UserDefaults
        // Step 1: Get the URL for the shared app group directory
        if let groupURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.screen-time-goal") {
            // Step 2: Append the file name to the directory path
            let fileURL = groupURL.appendingPathComponent("usageGoalData.plist")
            
            // Step 3: Create a dictionary with your data (or just a single value)
            let dataToSave: [String: TimeInterval] = ["usageGoalDuration": duration]
            
            // Step 4: Save the dictionary to the file as a plist
            do {
                let data = try PropertyListEncoder().encode(dataToSave)
                try data.write(to: fileURL)
                print("Successfully saved usageGoalDuration to file.")
            } catch {
                // TODO: handle error
                print("Failed to save usageGoalDuration: \(error)")
            }
        }
    }

    func setRiskAmount(_ amount: Int) {
        self.riskAmount = amount
    }
}
