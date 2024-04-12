import "package:slider_puzzle/classes/board.dart";
import 'package:slider_puzzle/classes/solver.dart';
import 'package:slider_puzzle/get_file.dart';

void main(List<String> arguments) {
  String puzzleFileName = arguments[0];
  String filePath = './puzzles/$puzzleFileName';

  List<List<int>> tiles = getFile(filePath);

  Board initial = Board(tiles);

  // solve the puzzle
  Solver solver = Solver(initial);
  
  // print the solution to standard output
  if (!solver.isSolvable()) {
    print('No solution possible');
  } else {
    print('Minimum number of moves = ${solver.moves()}');
    for (Board board in solver.solution()) {
      print(board);
    }
  }
}
