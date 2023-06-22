

import 'package:second_project/data/dummy.dart';

import 'package:flutter/material.dart';
import 'package:second_project/start_screen.dart';
import 'package:second_project/question.dart';
import 'package:second_project/results_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    // TODO: implement createState
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
   List<String> _selectedAnswers=[];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }
 void chooseAnswer(String answer){
  _selectedAnswers.add(answer);


  if (_selectedAnswers.length==Questions.length){
     setState(() {
      
      activeScreen='results-Screen';
  });
  }
 }

 void restartQuiz(){
  setState(() {
    _selectedAnswers=[];
    activeScreen='question-screen';
  });
 }

 






  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget =  QuestionsScreen(onSelectAnswer:chooseAnswer,);
    }
     if(activeScreen=='results-Screen'){
      screenWidget=  ResultsScreen(
        chosenAnswers:_selectedAnswers,
        onRestart:restartQuiz);
     }




    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 53, 24, 215),
                Color.fromARGB(255, 109, 136, 208),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
