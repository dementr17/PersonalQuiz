//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 20.12.2021.
//
// 1. Передать сюда массив с ответами
// 2. Определить наиболее часто встречающийся тип животного
// 3. Отобразить результат в соответсвии с этим живтным
// 4. Избавится от кнопки возврата назад на экран результатов
import UIKit

class ResultsViewController: UIViewController {
    
    
    @IBOutlet weak var result: UILabel!
    var answers: [Answer] = []
    var resultQuestions: [Question]!

    var countCat = 0
    var countDog = 0
    var countRabbit = 0
    var countTurtle = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let massiv = answers
        let resQuestion = resultQuestions
        
        for massiv in massiv {
            if massiv.type == .cat {
                countCat += 1
            } else if massiv.type == .dog {
                countDog += 1
            } else if massiv.type == .rabbit {
                countRabbit += 1
            } else if massiv.type == .turtle {
                countTurtle += 1
            }
        }
        
        
        
        
        if countDog > countCat && countDog > countTurtle && countDog > countRabbit {
            let answerDog = resQuestion?.first?.answers.first
            guard let infoDog = answerDog?.type.definition else { return }
            guard let imageDog = answerDog?.type.rawValue else { return }
            result.text = "\(infoDog) \(imageDog)"
        } else  if countCat > countDog && countCat > countTurtle && countCat > countRabbit {
            let answerCat = resQuestion?.first?.answers[1]
            guard let infoCat = answerCat?.type.definition else { return }
            guard let imageCat = answerCat?.type.rawValue else { return }
            result.text = "\(infoCat) \(imageCat)"
        } else  if countTurtle > countDog && countTurtle > countCat && countTurtle > countRabbit {
            let answerTurtle = resQuestion?.first?.answers[2]
            guard let infoTurtle = answerTurtle?.type.definition else { return }
            guard let imageTurtle = answerTurtle?.type.rawValue else { return }
            result.text = "\(infoTurtle) \(imageTurtle)"
        } else  if countRabbit > countDog && countRabbit > countTurtle && countRabbit > countCat {
            let answerRabbit = resQuestion?.first?.answers[3]
            guard let infoRabbit = answerRabbit?.type.definition else { return }
            guard let imageRabbit = answerRabbit?.type.rawValue else { return }
            result.text = "\(infoRabbit) \(imageRabbit)"
        }
        
 
    }
}


