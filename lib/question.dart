import 'package:flutter/material.dart';
import 'package:second_project/answer_button.dart';
import 'package:second_project/data/dummy.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen  extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer,});

  final void Function(String answer) onSelectAnswer;
 
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();

  }
}
class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

void answerQuestion (String selectedAnswers) {
  widget.onSelectAnswer(selectedAnswers);
  setState(() {
    currentQuestionIndex ++ ;
  });
  
}

  @override
  Widget build(context) {
    final currentQuestion = Questions[currentQuestionIndex];
    
    return   SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  [
        Text(
          currentQuestion.text, 
        style: GoogleFonts.lato(
          color: const Color.fromARGB(255, 196, 166, 247),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
        ),
        const SizedBox(height:  30),
      
      ...currentQuestion.shuffledAnswers.map((answer) {
        return AnswerButton(
          answerText: answer, 
          onTap: () {
            answerQuestion(answer);
          },
          );
      }),
         
          ],),
      )
    );
  }
}
