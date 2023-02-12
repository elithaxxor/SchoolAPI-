//
//  Bluetooth.swift
//  SchoolAPI
//
//  Created by Adel Al-Aali on 2/11/23.
//

import Foundation
import CoreBluetooth


// MARK: Need to add permissions to info.plist
class BluetoothViewModel : NSObject, ObservableObject {

    
    private var centralManager: CBCentralManager?
    private var perhpherals : [CBPeripheral] = []
    @Published var perhpheralName : [String] = []
    
    override init() {
        super.init()
        self.centralManager = CBCentralManager(delegate: self, queue: .main)
        
    }
}

extension BluetoothViewModel : CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            print("[+] B/T Powered on.. ")
            self.centralManager?.scanForPeripherals(withServices: nil)
        }
        if central.isScanning {
            print("[!] Scanning.. ")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if(!perhpherals.contains(peripheral)) {
            print("[!] Adding perphial... \(peripheral.name)")
            self.perhpherals.append(peripheral)
            self.perhpheralName.append(peripheral.name ?? "unknown devivce")
        }
    }
    
    
}
