//
//  RootViewController.swift
//  ScanditExample
//
//  Created by TRINHNT12 on 11/7/20.
//

import UIKit
import ScanditBarcodeScanner

class RootViewController: UIViewController {
    
    let scanditView = ScanditView(with: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        scanditView.backgroundColor = .green
        scanditView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        view.addSubview(scanditView)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapButton(_ sender: Any) {
    }
    
}

//extension RootViewController: SBSScanDelegate {
//    func barcodePicker(_ picker: SBSBarcodePicker, didScan session: SBSScanSession) {
//        guard let code = session.newlyRecognizedCodes.first else { return }
//        print("scanned \(code.symbologyName) barcode: \(code.data)")
//    }
//}


class ScanditView: UIView {

    private var licenseKey: String?

    // MARK: - UI

    private var picker: SBSBarcodePicker?

    convenience init(with licenseKey: String) {
        self.init(frame: CGRect.zero)
        self.licenseKey = licenseKey
        configureViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureViews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    private func configureViews() {
        guard let licenseKey = licenseKey else { return }
        SBSLicense.setAppKey(licenseKey)
        // Configure the barcode picker through a scan settings instance by defining which
        // symbologies should be enabled.
        let scanSettings = SBSScanSettings.default()
        // prefer backward facing camera over front-facing cameras.
        scanSettings.cameraFacingPreference = .back
        // Enable symbologies that you want to scan
        scanSettings.setSymbology(.ean13, enabled: true)
        scanSettings.setSymbology(.upc12, enabled: true)
        scanSettings.setSymbology(.qr, enabled: true)
        let picker = SBSBarcodePicker(settings: scanSettings)
        self.picker = picker
        // Set the delegate to receive scan events.
//        picker.scanDelegate = self
        
        picker.view.frame = bounds
        addSubview(picker.view)
        
        // Start scanning process.
        picker.startScanning()
    }
}
