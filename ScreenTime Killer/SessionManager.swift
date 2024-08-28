//
//  SessionManager.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 23/08/2024.
//

import Foundation

final class SessionManager: ObservableObject {
    enum CurrentStep {
        case Step1
        case Step2
        case Step3
        case Step4
        case Step5
        case Finished
    }
    
    
    @Published private(set) var currentStep: CurrentStep?
//    @Published private(set) var goal: Int32?
    
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
