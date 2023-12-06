import "package:manowa_apps/features/game/models/answer_model.dart";

class ConverListAnswerToTicTacToeFunc {
  static List<List<String>> call(List<AnswerModel> listAnswer) {
    List<List<String>> result = [];
    List<String> listTemp = [];
    for (var element in listAnswer) {
      if (element.isAlreadySelected) {
        if (element.isSelectedPlayerOne) {
          listTemp.add('1');
        } else {
          listTemp.add('2');
        }
      } else {
        listTemp.add('.');
      }
    }
    for (int i = 0; i < 10; i++) {
      int start = i * 7;
      int end = start + 7;
      result.add(
        listTemp.sublist(start, end).toList(),
      );
    }
    return result;
  }
}
