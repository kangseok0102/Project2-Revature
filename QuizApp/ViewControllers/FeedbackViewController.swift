//
//  FeedbackViewController.swift
//  QuizApp
//
//  Created by Kangseok Lee on 5/12/21.
//

import UIKit
import Speech

class FeedbackViewController: UIViewController, SFSpeechRecognizerDelegate {
    
    
    @IBOutlet weak var lb: UILabel!
    
    let audioEng = AVAudioEngine()
    let speechRecog = SFSpeechRecognizer()
    let req = SFSpeechAudioBufferRecognitionRequest()
    var rTask : SFSpeechRecognitionTask!
    var isStart = false
    
    
    func startSpeechRecog(){
        let nd = audioEng.inputNode
        let recordF = nd.outputFormat(forBus: 0)
        
        nd.installTap(onBus: 0, bufferSize: 1024, format: recordF) {(buffer, _) in
            self.req.append(buffer)
        }
        
        audioEng.prepare()
        do{
            try audioEng.start()
        }
        catch let err{
            print(err)
        }
        
        rTask = speechRecog?.recognitionTask(with: req, resultHandler: {(resp, error) in
            guard let resps = resp else{
                if error != nil {
                    print(error.debugDescription)
                }else{
                    print("problem in response")
                }
                return
            }
            let msg = resp?.bestTranscription.formattedString
            print(msg)
            self.lb.text = msg
            
            var lastStr = ""
            for seg in resp!.bestTranscription.segments{
                
                let indexTo = msg!.index(msg!.startIndex, offsetBy: seg.substringRange.location)
                lastStr = String(msg![indexTo...])
            }
        })
    }
    
    func cancelSpeechRecog(){
        rTask.finish()
        rTask.cancel()
        rTask = nil
        
        req.endAudio()
        audioEng.stop()
        
        if audioEng.inputNode.numberOfInputs > 0{
            audioEng.inputNode.removeTap(onBus: 0)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func StartBttn(_ sender: Any) {
        
        isStart = !isStart
        if isStart{
            startSpeechRecog()
            (sender as AnyObject).setTitle("Stop", for: .normal)
        }
        else{
            cancelSpeechRecog()
            (sender as AnyObject).setTitle("Start", for: .normal)
        }
    
    }

    @IBAction func submitAndSaveFeedback(_ sender: Any) {
        DatabaseHelper.inst.updateFeedback(username: LogInViewController.username, feedback: lb.text!)
    }
    
}
    

