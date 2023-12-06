class AnswerModel {
  final double value;
  final String imagePath;
  final bool isSelectedPlayerOne;
  final bool isSelectedPlayerTwo;
  const AnswerModel({
    required this.value,
    required this.imagePath,
    this.isSelectedPlayerOne = false,
    this.isSelectedPlayerTwo = false,
  });

  bool get isAlreadySelected => isSelectedPlayerOne || isSelectedPlayerTwo;

  AnswerModel copyWith({
    double? value,
    String? imagePath,
    bool? isSelectedPlayerOne,
    bool? isSelectedPlayerTwo,
  }) {
    return AnswerModel(
      value: value ?? this.value,
      imagePath: imagePath ?? this.imagePath,
      isSelectedPlayerOne: isSelectedPlayerOne ?? this.isSelectedPlayerOne,
      isSelectedPlayerTwo: isSelectedPlayerTwo ?? this.isSelectedPlayerTwo,
    );
  }
}
