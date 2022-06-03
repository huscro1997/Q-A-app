//
//  ViewController.swift
//  questinApp
//
//  Created by 曾曜澤 on 2022/5/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questonNumLabel: UILabel!
    @IBOutlet weak var questionTextField: UITextView!
    @IBOutlet weak var answerTextField: UITextView!
    @IBOutlet weak var animalPic: UIImageView!
    
    //產生問題
    var questions = [Question]()
    var index = 0
    var numIndex = 0
    let num = ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二", "十三", "十四", "十五"]
    var picIndex = Int.random(in: 0...3)
    let picture = ["1", "3", "5", "6"]
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let question1 = Question(description: "牛小時候叫犢，那兔子、烏龜小時候應如何稱呼？", answer: "兔崽子、龜兒子")
        questions.append(question1)
        let question2 = Question(description: "避孕藥的主要成份是什麼？", answer: "抗生素")
        questions.append(question2)
        let question3 = Question(description: "有一隻狗在沙漠中突然死掉了，請問為什麼？", answer: "因為憋死了")
        questions.append(question3)
        let question4 = Question(description: "天黑黑，猜六種動物？（用台語發音來猜）", answer: "象、馬、鹿、獅、豹、虎")
        questions.append(question4)
        let question5 = Question(description: "哪個數字最懶惰？哪個數字最勤快？", answer: "一不做、二不休")
        questions.append(question5)
        let question6 = Question(description: "第一次世界大戰發生在什麼時候呢？", answer: "亞當和夏娃打架時")
        questions.append(question6)
        let question7 = Question(description: "天花板上有兩隻壁虎，一隻不小心掉了下去，為什麼過不久另一隻也跟著掉了下去呢？", answer: "因為它鼓掌")
        questions.append(question7)
        let question8 = Question(description: "三個人分四顆蘋果，怎麼分最公平？", answer: "打成果汁")
        questions.append(question8)
        let question9 = Question(description: "校有校規，班有班規，動物園有什麼？", answer: "烏龜")
        questions.append(question9)
        let question10 = Question(description: "龜兔賽跑第一百次比賽，請豬來當裁判，請問龜兔誰會贏？", answer: "知道的人是豬")
        questions.append(question10)
        let question11 = Question(description: "一個圓有幾個面？", answer: "兩個(裡面、外面)")
        questions.append(question11)
        let question12 = Question(description: "小明上課時一直和同學講話，為什麼老師不處罰他？", answer: "因為小明是老師")
        questions.append(question12)
        let question13 = Question(description: "你要買甚麼樣的蛋，才不會買到裡面已經孵了小雞的蛋？", answer: "買鴨蛋")
        questions.append(question13)
        let question14 = Question(description: "怎樣使麻雀安靜下來？", answer: "壓一下，因為“鴉雀無聲“")
        questions.append(question14)
        let question15 = Question(description: "為什麼陸地上沒有魚？", answer: "因為陸地上有貓")
        questions.append(question15)
        //隨機出題
        questions.shuffle()
        questionTextField.text = questions[index].description
        //隨機圖片
        animalPic.image = UIImage(named: picture[picIndex])
    }
    @IBAction func next(_ sender: Any) {
        numIndex = ( numIndex + 1 ) % num.count
        questonNumLabel.text = "第\(num[numIndex])題"
        answerTextField.text = ""
        index = index + 1
        if index >= 14 {
            index = 0
        }
        questionTextField.text = questions[index].description
        print(index)
        picIndex = picIndex + 1
        if picIndex == 4{
            picIndex = 0
        }
        animalPic.image = UIImage(named: picture[picIndex])
        print(picIndex)
        
    }
    @IBAction func last(_ sender: Any) {
        numIndex = ( numIndex + num.count - 1 ) % num.count
        index = index - 1
        if index == -1 {
            index = 14
        }
        questonNumLabel.text = "第\(num[numIndex])題"
        questionTextField.text = questions[index].description
        answerTextField.text = ""
        picIndex = picIndex - 1
        if picIndex == -1 {
            picIndex = 3
        }
        animalPic.image = UIImage(named: picture[picIndex])
        print(picIndex)
        
    }
    @IBAction func answer(_ sender: Any) {
        answerTextField.text = "答：\(questions[index].answer)"
    }
    @IBAction func random(_ sender: Any) {
        questions.shuffle()
        questionTextField.text = questions[index].description
        answerTextField.text = ""
        picIndex = picIndex + 1
        if picIndex == 4{
            picIndex = 0
        }
        animalPic.image = UIImage(named: picture[picIndex])
        print(picIndex)
        questonNumLabel.text = "隨機出題"
    }
    

}

