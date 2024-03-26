import 'dart:io';

List<List<int>> getFile(String filepath) {
  List<String> puzzleLines = File(filepath).readAsLinesSync();
  int puzzleSize = int.parse(puzzleLines[0]);
  List<List<int>> tiles =
      List.generate(puzzleSize, (_) => List<int>.filled(puzzleSize, 0));

  for (int rowIndex = 0; rowIndex < puzzleLines.length; rowIndex++) {
    if (rowIndex == 0) {
      continue;
    }

    List<int> numbersInRow = puzzleLines[rowIndex]
        .split(' ')
        .map((stringNumber) => int.tryParse(stringNumber))
        .where((number) => number != null)
        .map((number) => number!)
        .toList();

    if (numbersInRow.isEmpty) {
      continue;
    }

    tiles[rowIndex - 1] = numbersInRow;
  }

  return tiles;
}
