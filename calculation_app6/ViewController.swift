//
//  ViewController.swift
//  calculation_app6
//
//  Created by 荘司実祐 on 2024/02/18.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var questionLabel: UILabel!
    
    @IBOutlet private weak var answerSlider: UISlider!
    @IBOutlet private weak var miniValueLabel: UILabel!
    @IBOutlet private weak var maxValueLabel: UILabel!
    
    var answerValue:Int = 0
    var minimumValue:Int = 1
    var maximumValue:Int = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateSlider()
        
        let randomFloat = Int.random(in: 0..<100)
        questionLabel.text = "\(randomFloat)"
    }
    func updateSlider() {
        answerSlider.minimumValue = Float(minimumValue)
        answerSlider.maximumValue = Float(maximumValue)
        answerSlider.value = Float(maximumValue / 2)
        
        miniValueLabel.text = "\(minimumValue)"
        maxValueLabel.text = "\(maximumValue)"
    }
    
    @IBAction private func judgeButton(_ sender: UIButton) {
        let sliderValue = Int(answerSlider.value)
        let labelText = questionLabel.text ?? ""
        print("Slider Value: \(sliderValue), Label Text \(labelText)")
        
        var judge:String = ""
        if sliderValue == Int(labelText) {
            judge = "あたり！"
        }else{
            judge = "はずれ！"
        }
        let message:String = "\(judge)\nあなたの値:\(sliderValue)\n"
        
        let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        
        // "再挑戦" ボタンが押されたときの処理を追加
        alert.addAction(UIAlertAction(title: "再挑戦", style: .default) { (action) in
            // ラベルに表示する文字列を設定する
            let randomValue = Int.random(in: self.minimumValue...self.maximumValue)
            self.questionLabel.text = "\(randomValue)"
        })
        
        // UIAlertControllerを表示
        present(alert, animated: true, completion: nil)
    }
    @IBAction private func sliderChanged(_ sender: UISlider) {
        let sliderValue = Int(sender.value)
        print("Slider Value Changed: \(sliderValue)")
    }
    
}
    


