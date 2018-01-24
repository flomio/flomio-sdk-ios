//
//  ViewController.swift
//  FlomioSDK
//
//  Created by scott@flomio.com on 01/24/2018.
//  Copyright (c) 2018 scott@flomio.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FmSessionManagerDelegate {

    lazy var flomioMW : FmSessionManager = FmSessionManager()
    var deviceUuid : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultConfiguration: FmConfiguration = FmConfiguration()
        defaultConfiguration.deviceType = DeviceType.kFloBlePlus
        defaultConfiguration.transmitPower = TransmitPower.highPower
        defaultConfiguration.scanSound = true
        defaultConfiguration.scanPeriod = 1000
        defaultConfiguration.powerOperation = PowerOperation.autoPollingControl
        defaultConfiguration.allowMultiConnect = false
        flomioMW = FmSessionManager.init(configuration: defaultConfiguration)
        flomioMW.delegate = self
    }
    
    func didFind(_ tag: FmTag!, fromDevice deviceId: String!) {
        self.flomioMW.readNdef(deviceId) { (ndefMessage) in
            guard let ndefRecords = ndefMessage?.ndefRecords else { return }
            for case let record as NdefRecord in ndefRecords {
                print("NDEF record payload: \(record.payloadString ?? "empty")")
            }
        }
    }

    
    func didChangeStatus(_ deviceUuid: String!, with configuration: FmConfiguration!, andBatteryLevel batteryLevel: NSNumber!, andCommunicationStatus communicationStatus: CommunicationStatus, withFirmwareRevision firmwareRev: String!, withHardwareRevision hardwareRev: String!) {
        DispatchQueue.main.async {
            guard let thisDeviceUuid = deviceUuid else { return }
            self.deviceUuid = thisDeviceUuid;
            print("Device: \(thisDeviceUuid)")
        }
    }
    
    func didGetLicenseInfo(_ deviceUuid: String!, withStatus isRegistered: Bool) {
        DispatchQueue.main.async {
            if let thisDeviceUuid = deviceUuid {
                print("Device: \(thisDeviceUuid) Registered: \(isRegistered)")
            }
        }
    }
    
    func didChange(_ status: CardStatus, fromDevice device: String!) {
        switch status {
        case .present:
            print("tag tapped")
        case .notPresent:
            print("tag removed")
        default:
            break
        }
    }
    
    func didReceiveReaderError(_ error: Error!) {
        DispatchQueue.main.async {
            print("Error: \(error)")
        }
    }

}

