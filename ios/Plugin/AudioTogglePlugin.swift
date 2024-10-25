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
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setActive(false)
        } catch {
            call.reject("Error switching audio output: \(error.localizedDescription)")
        }
    }
    
    @objc func selectDevice(_ call: CAPPluginCall) {
        let mode = call.getString("device") ?? ""
        let session = AVAudioSession.sharedInstance()

                do {
                    switch mode {
                    case "earpiece":
                        try session.setCategory(.playAndRecord)
                        try session.overrideOutputAudioPort(.none)
                    case "speakerphone", "ringtone":
                        try session.setCategory(.playAndRecord)
                        try session.overrideOutputAudioPort(.speaker)
                    case "normal":
                        try session.setCategory(.soloAmbient)
                    default:
                        break
                    }
                    call.resolve()
                } catch {
                    call.reject("Error switching audio output: \(error.localizedDescription)")
                }
    }
    
    
}
