//
//  ViewController.swift
//  FlomioSDK
//
//  Created by scott@flomio.com on 01/24/2018.
//  Copyright (c) 2018 scott@flomio.com. All rights reserved.
//

import UIKit
import FlomioSDK

class ViewController: UIViewController, FmSessionManagerDelegate {
  
  lazy var flomioSDK : FmSessionManager = FmSessionManager()
  var deviceUid : String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let defaultConfiguration: FmConfiguration = FmConfiguration()
    defaultConfiguration.deviceType = .kFloBlePlus
    defaultConfiguration.transmitPower = .highPower
    defaultConfiguration.scanSound = true
    defaultConfiguration.scanPeriod = 1000
    defaultConfiguration.powerOperation = .autoPollingControl
    defaultConfiguration.allowMultiConnect = false
    flomioSDK = FmSessionManager.init(configuration: defaultConfiguration)
    
    
    flomioSDK.delegate = self
  }
  
  func didFind(_ tag: FmTag!, fromDevice deviceUid: String!) {
    tag.readNdef { (ndefMessage) in
      guard let ndefRecords = ndefMessage?.ndefRecords else { return }
      for case let record as FmNdefRecord in ndefRecords {
        print("NDEF record payload: \(record.payloadString ?? "empty")")
      }
    }
  }
  
  
  func didChangeStatus(_ deviceUid: String!, with configuration: FmConfiguration!, andBatteryLevel batteryLevel: NSNumber!, andCommunicationStatus communicationStatus: CommunicationStatus, withFirmwareRevision firmwareRev: String!, withHardwareRevision hardwareRev: String!) {
    DispatchQueue.main.async {
      guard let thisDeviceUid = deviceUid else { return }
      self.deviceUid = thisDeviceUid;
      print("Device: \(thisDeviceUid)")
    }
  }
  
  func didGetLicenseInfo(_ deviceUid: String!, withStatus isRegistered: Bool) {
    DispatchQueue.main.async {
      if let thisDeviceUid = deviceUid {
        print("Device: \(thisDeviceUid) Registered: \(isRegistered)")
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

