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

    init() {
        if let storedStep = UserDefaults.standard.object(forKey: UserDefaultKeys.storedCurrentStep) as? Int,
           let step = CurrentStep(rawValue: storedStep) {
            self.currentStep = step
        }
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
}
