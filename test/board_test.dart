import 'package:slider_puzzle/classes/board.dart';
import 'package:test/test.dart';

void main() {
  group('Board', () {
    test('dimension returns correct value', () {
      var board = Board([
        [1, 2],
        [3, 0]
      ]);
      expect(board.dimension(), 2);
    });

    test('hamming returns correct value', () {
      var board = Board([
        [1, 2],
        [3, 0]
      ]);
      expect(board.hamming(), 0);
    });

    test('isGoal returns correct value', () {
      var board = Board([
        [1, 2],
        [3, 0]
      ]);
      expect(board.isGoal(), true);
    });

    test('equals returns correct value', () {
      var board1 = Board([
        [1, 2],
        [3, 0]
      ]);
      var board2 = Board([
        [1, 2],
        [3, 0]
      ]);
      expect(board1.equals(board2), true);
    });

    test('neighbors returns correct value', () {
      var board = Board([
        [1, 2],
        [3, 0]
      ]);
      expect(board.neighbors().length, 2);
    });

    test('twin returns a valid twin', () {
      var board = Board([
        [1, 2],
        [3, 0]
      ]);
      var twin = board.twin();
      expect(twin.equals(board), false);
    });
  });
}
