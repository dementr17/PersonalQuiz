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
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var definationLabel: UILabel!

    
    var answers: [Answer] = []
    var resultQuestions: [Question]!
    var massivAnimal: [Int] = []

    var count = 0
    var maxCount = 3
    var countCat = 0
    var countDog = 0
    var countRabbit = 0
    var countTurtle = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        let logoutBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: .none)
        self.navigationItem.leftBarButtonItem  = logoutBarButtonItem
        
        let answersAnimal = answers
        let modelQuestion = resultQuestions.first
        
        scoringPoints(plentyAnimal: answersAnimal)
        selectionWinner(closure: (modelQuestion))
    }
    
}

extension ResultsViewController {
    
    private func scoringPoints(plentyAnimal: [Answer]) {
        for typeAnswer in plentyAnimal {
            if typeAnswer.type == .cat {
                countCat += 1
            } else if typeAnswer.type == .dog {
                countDog += 1
            } else if typeAnswer.type == .rabbit {
                countRabbit += 1
            } else if typeAnswer.type == .turtle {
                countTurtle += 1
            }
        }
    }
    
    private func conclutionsResult(model: Question?) {
        let animal = model?.answers[count].type
        guard let infoAnimal = animal?.definition else { return }
        guard let imageAnimal = animal?.rawValue else { return }
        typeLabel.text = "Вы - \(imageAnimal)!"
        definationLabel.text = infoAnimal
    }
    
    private func selectionWinner(closure: (Question?) ) {
        let massivAnimal = [countDog, countCat, countRabbit, countTurtle]
        for _ in 0...3 {
            count = 0
            if massivAnimal.firstIndex(of: maxCount) == 0 {
                conclutionsResult(model: closure)
                break
            } else if massivAnimal.firstIndex(of: maxCount) == 1 {
                count += 1
                conclutionsResult(model: closure)
                break
            } else if massivAnimal.firstIndex(of: maxCount) == 2 {
                count += 2
                conclutionsResult(model: closure)
                break
            } else if massivAnimal.firstIndex(of: maxCount) == 3 {
                count += 3
                conclutionsResult(model: closure)
                break
            }
            maxCount -= 1
        }
    }
}

//        if
//            countDog >= countCat &&
//            countDog >= countTurtle &&
//            countDog >= countRabbit
//        {
//            conclutionsResult(model: closure)
//            //print(count)
//        } else  if
//            countCat >= countDog &&
//            countCat >= countTurtle &&
//            countCat >= countRabbit
//        {
//            count += 1
//            conclutionsResult(model: closure)
//            //print(count)
//        } else  if
//            countTurtle >= countDog &&
//            countTurtle >= countCat &&
//            countTurtle >= countRabbit
//        {
//            count += 1
//            conclutionsResult(model: closure)
//            //print(count)
//        } else  if
//            countRabbit >= countDog &&
//            countRabbit >= countTurtle &&
//            countRabbit >= countCat
//        {
//            count += 1
//            conclutionsResult(model: closure)
//            //print(count)
//        }
