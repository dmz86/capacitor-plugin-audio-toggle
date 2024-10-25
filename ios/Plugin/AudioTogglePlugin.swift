import Foundation
import Capacitor
import AVFoundation

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(AudioTogglePlugin)
public class AudioTogglePlugin: CAPPlugin {
    private let implementation = AudioToggle()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }
    
    @objc func enable(_ call: CAPPluginCall) {
        call.resolve()
    }
    
    @objc func disable(_ call: CAPPluginCall) {
        call.resolve()
    }
    
    @objc func selectDevice(_ call: CAPPluginCall) {
        let value = call.getString("device") ?? ""
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playAndRecord, mode: .default)
            try audioSession.setActive(true)

            // Modifica l'uscita audio
            if (value == "earpiece"){
                try audioSession.overrideOutputAudioPort(.none)
            }else{
                try audioSession.overrideOutputAudioPort(.speaker)
            }
            
            call.resolve()
        } catch {
            call.reject("Error switching audio output: \(error.localizedDescription)")
        }
    }
}
