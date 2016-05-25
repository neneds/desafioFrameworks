//
//  SurveyTask.swift
//  Camelot
//
//  Created by Michel Lopes on 5/17/16.
//  Copyright © 2016 Michel Lopes. All rights reserved.
//

import ResearchKit
public class TarefasDePesquisaUtils {
    static let pesos : [String : [Int]] = ["pergunta0" : [1,2,3,4],
                                    "pergunta1" : [4,3,2,1],
                                    "pergunta2" : [1,2,3,4],
                                    "pergunta3" : [1,2,3,4],
                                    "pergunta4" : [4,3,2,1],
                                    "pergunta5" : [4,3,2,1],
                                    "pergunta6" : [1,2,3,4],
                                    "pergunta7" : [1,2,3,4],
                                    "pergunta8" : [1,2,3,4],
                                    "pergunta9" : [1,2,3,4],
                                    "pergunta10" : [4,3,2,1],
                                    "pergunta11" : [4,3,2,1],
                                    "pergunta12" : [1,2,3,4],
                                    "pergunta13" : [4,3,2,1],
                                    "pergunta14" : [1,2,3,4],
                                    "pergunta15" : [4,3,2,1],
                                    "pergunta16" : [4,3,2,1],
                                    "pergunta17" : [4,3,2,1],
                                    "pergunta18" : [1,2,3,4],
                                    "pergunta19" : [4,3,2,1]
    ]
    class func valorPorPeso(stepIdentifier: String, responseValue: Int) -> Int{
        if let valoresPeso = pesos[stepIdentifier] {
            return valoresPeso[responseValue]
        }
        return 0
    }
}
public var TarefasDePesquisa: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    
    ///Instruções
    let instrucao = ORKInstructionStep(identifier: "Instrucoes")
    instrucao.title = "Pesquisa sobre depressāo"
    instrucao.text = "Após informar o seu nome, responda para cada questāo apenas uma alternativa"
    steps += [instrucao]
    
    
    
    ///
    let nameAnswerFormat = ORKTextAnswerFormat(maximumLength: 20)
    nameAnswerFormat.multipleLines = false
    let nameQuestionStepTitle = "Qual é o seu nome:?"
    let nameQuestionStep = ORKQuestionStep(identifier: "QuestionStep", title: nameQuestionStepTitle, answer: nameAnswerFormat)
    steps += [nameQuestionStep]
    
    
    
//    ///Pesquisa
//    let tituloDaQuestao = "Eu faço as coisas devagar"
//    let opcoes = [
//        ORKTextChoice(text: "Nunca", value: 0),
//        ORKTextChoice(text: "Raramente", value: 1),
//        ORKTextChoice(text: "Um Pouco", value: 2),
//        ORKTextChoice(text: "Moderadamente", value: 3),
//        ORKTextChoice(text: "Bastante", value: 4),
//        ORKTextChoice(text: "Bastante", value: 5)
//    ]
//    let formatoDerResposta: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: opcoes)
//    let perguntaProblemaDoUsuario = ORKQuestionStep(identifier: "perguntaProblemaDoUsuario", title: tituloDaQuestao, answer: formatoDerResposta)
//    steps += [perguntaProblemaDoUsuario]
    
    func createQuestions(question: String, index : Int)->ORKQuestionStep{
        
        let opcoes = [
            ORKTextChoice(text: "Pouco tempo", value: 0),
            ORKTextChoice(text: "Algum tempo", value: 1),
            ORKTextChoice(text: "Boa parte do tempo", value: 2),
            ORKTextChoice(text: "Maioria do tempo", value: 3)
     
        ]
        let formatoDerResposta: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: opcoes)
        let perguntaProblemaDoUsuario = ORKQuestionStep(identifier: "pergunta"+"\(index)", title: question, answer: formatoDerResposta)
        return perguntaProblemaDoUsuario
    }
    
//    let perguntas : [String] = ["Sinto-me desanimado(a), deprimido(a) e triste", "A manhã é o momento do dia em que me sinto melhor"]
    let perguntas : [String] = ["Sinto-me desanimado(a), deprimido(a) e triste",
                                "A manhã é o momento do dia em que me sinto melhor",
                                "Tenho crises de choro, ou sinto vontade de chorar",
                                "Tenho dificuldade em dormir descansado (a) durante a noite",
                                "Continuo a alimentar-me da mesma forma como me alimentava no passado",
                                "Ainda sinto prazer com o sexo",
                                "Apercebi-me de que estou a perder peso",
                                "Tenho prisão de ventre",
                                "O meu coração está mais acelerado que o habitual",
                                "Canso-me sem motivo aparente",
                                "Sinto-me tão lúcido(a) como anteriormente",
                                "Tenho tanta facilidade em fazer as coisas como anteriormente",
                                "Sinto-me agitado(a) e não consigo ficar parado(a)",
                                "Sinto-me optimista e esperançoso(a) em relação ao futuro",
                                "Sinto-me mais irritável que o habitual",
                                "Sinto facilidade em tomar decisões",
                                "Sinto-me útil e necessário(a)",
                                "Sinto ter uma vida bastante completa",
                                "Sinto que os outros ficariam melhor se morresse",
                                "Continuo a ter prazer nas coisas de que sempre gostei"]
    

    
    for (index,item) in perguntas.enumerate(){
        steps += [createQuestions(item, index: index)]
    }
    
    
    
    
    
    
//    ///
//    let colorQuestionStepTitle = "What is your favorite color?"
//    let colorTuples = [
//        (UIImage(named: "red")!, "Red"),
//        (UIImage(named: "orange")!, "Orange"),
//        (UIImage(named: "yellow")!, "Yellow"),
//        (UIImage(named: "green")!, "Green"),
//        (UIImage(named: "blue")!, "Blue"),
//        (UIImage(named: "purple")!, "Purple")
//    ]
//    let imageChoices : [ORKImageChoice] = colorTuples.map {
//        return ORKImageChoice(normalImage: $0.0, selectedImage: nil, text: $0.1, value: $0.1)
//    }
//    let colorAnswerFormat: ORKImageChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithImageChoices(imageChoices)
//    let colorQuestionStep = ORKQuestionStep(identifier: "ImageChoiceQuestionStep", title: colorQuestionStepTitle, answer: colorAnswerFormat)
//    steps += [colorQuestionStep]
    
    
    ///
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Right. Off you go!"
    summaryStep.text = "That was easy!"
    steps += [summaryStep]
    
    return ORKOrderedTask(identifier: "TarefasDePesquisa", steps: steps)
}