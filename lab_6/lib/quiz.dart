import 'package:lab_6/question.dart';

import 'question.dart';

class Quiz {
  int _questionNo = 0;

  List<Question> _questionbank = [
    Question('Is Mount Kilimanjaro the world’s tallest peak? ', false),
    Question('The capital of Australia is Sydney. ', false),
    Question('The United Kingdom is almost the same size as France. ', false),
    Question('In Scotland, the unicorn is their national animal. .', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question('In a regular deck of cards, all kings have a mustache.', false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The mosquito has a record for killing more people than any other species in written history. ',
        true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
  ];

  void nextQuestion() {
    if (_questionNo < _questionbank.length - 1) {
      _questionNo++;
    }
  }
  String getQuestionText() {
    return _questionbank[_questionNo].questionText;
  }

  bool getCorrectAnswer() {
    return _questionbank[_questionNo].questionAnswer;
  }

  bool isFinished() {
    if (_questionNo >= _questionbank.length-1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNo = 0;
  }
}
