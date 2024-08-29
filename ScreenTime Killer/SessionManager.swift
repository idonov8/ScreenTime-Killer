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
        static let storedHours = "usageGoalHours"
        static let storedMinutes = "usageGoalMinutes"
        static let storedDays = "usageGoalDays"
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

    @Published var hours: Int {
        didSet {
            UserDefaults.standard.set(hours, forKey: UserDefaultKeys.storedHours)
        }
    }

    @Published var minutes: Int {
        didSet {
            UserDefaults.standard.set(minutes, forKey: UserDefaultKeys.storedMinutes)
        }
    }

    @Published var days: Int {
        didSet {
            UserDefaults.standard.set(days, forKey: UserDefaultKeys.storedDays)
        }
    }

    @Published var goalSetDate: Date {
        didSet {
            UserDefaults.standard.set(goalSetDate, forKey: UserDefaultKeys.storedGoalSetDate)
        }
    }
    
    @Published var riskAmount: Double {
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

        // Initialize usage goal data
        self.hours = UserDefaults.standard.integer(forKey: UserDefaultKeys.storedHours)
        self.minutes = UserDefaults.standard.integer(forKey: UserDefaultKeys.storedMinutes)
        self.days = UserDefaults.standard.integer(forKey: UserDefaultKeys.storedDays)

        // Initialize goal set date
        if let date = UserDefaults.standard.object(forKey: UserDefaultKeys.storedGoalSetDate) as? Date {
            self.goalSetDate = date
        } else {
            self.goalSetDate = Date()
        }
        
        // Initialize risk amount
        self.riskAmount = UserDefaults.standard.double(forKey: UserDefaultKeys.storedRiskAmount)

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

    func setUsageGoal(hours: Int, minutes: Int, days: Int) {
        self.hours = hours
        self.minutes = minutes
        self.days = days
        self.goalSetDate = Date()
    }
    
    func setRiskAmount(_ amount: Double) {
        self.riskAmount = amount
    }
}
