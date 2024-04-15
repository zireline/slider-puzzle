export "board.dart";

class Board {
  // create a board from an n-by-n array of tiles,
  List<List<int>> tiles;
  int hammingDistance;
  int manhattanDistance;
  List<Board> neighboringBoards;

  // where tiles[row][col] = tile at (row, col)
  // Initialize
  Board(List<List<int>> inputTiles)
      : hammingDistance = 0,
        manhattanDistance = 0,
        neighboringBoards = [],
        tiles = inputTiles {
    for (int i = 0; i < tiles.length; i++) {
      for (int j = 0; j < tiles[i].length; j++) {
        int tile = tiles[i][j];

        if (tile == 0) {
          continue;
        }

        if (tiles[i][j] != 0 && tiles[i][j] != i * tiles.length + j + 1) {
          hammingDistance++;
        }

        List<int> target = findPosition(tile);
        int targetRow = target[0];
        int targetCol = target[1];
        manhattanDistance += (targetRow - i).abs() + (targetCol - j).abs();
      }
    }
  }

  // string representation of this board
  @override
  String toString() {
    // PLS MODIFY
    List<String> stringBuilder = [];

    for (int i = 0; i < dimension(); i++) {
      stringBuilder.add("\n");
      for (int j = 0; j < dimension(); j++) {
        stringBuilder.add(" ${tiles[i][j]}");
      }
    }
    return stringBuilder.join('');
  }

  List<int> findPosition(int tile) {
    int targetRow = ((tile - 1) ~/ dimension());
    int targetCol = (tile - 1) % dimension();
    return [targetRow, targetCol];
  }

  // board dimension n
  int dimension() {
    // PLS MODIFY
    return tiles[0].length;
  }

  // number of tiles out of place
  int hamming() {
    // PLS MODIFY
    return hammingDistance;
  }

  // sum of Manhattan distances between tiles and goal
  int manhattan() {
    // PLS MODIFY
    return manhattanDistance;
  }

  // is this board the goal board?
  bool isGoal() {
    // PLS MODIFY
    return hamming() == 0;
  }

  // does this board equal y?

  bool equals(Board y) {
    bool boolean = true;
    List<List<int>> array2d = tiles;
    List<List<int>> array2d2 = y.tiles;
    if (dimension() != y.dimension()) {
      boolean = false;
      return boolean;
    }

    for (int i = 0; i < array2d.length; i++) {
      for (int j = 0; j < array2d[i].length; j++) {
        if (array2d[i][j] != array2d2[i][j]) {
          boolean = false;
          break;
        }
      }
      if (!boolean) break;
    }
    return boolean;
  }

  // all neighboring boards
  List<Board> neighbors() {
    // PLS MODIFY

    if (neighboringBoards.isNotEmpty) {
      return neighboringBoards;
    } else {
      neighboringBoards = [];
      int zeroI = 0;
      int zeroJ = 0;

      for (int i = 0; i < dimension(); i++) {
        for (int j = 0; j < dimension(); j++) {
          if (tiles[i][j] == 0) {
            zeroI = i;
            zeroJ = j;
            break;
          }
        }
      }

      for (int k = 0; k < 4; k++) {
        int tileI = zeroI;
        int tileJ = zeroJ;

        switch (k) {
          case 0:
            tileI++;
            break;
          case 1:
            tileI--;
            break;
          case 2:
            tileJ++;
            break;
          case 3:
            tileJ--;
            break;
        }

        if (tileI < 0 ||
            tileI >= dimension() ||
            tileJ < 0 ||
            tileJ >= dimension()) continue;

        List<List<int>> neighborTiles = tilesCopy();
        neighborTiles[zeroI][zeroJ] = neighborTiles[tileI][tileJ];
        neighborTiles[tileI][tileJ] = 0;

        Board neighbor = Board(neighborTiles);
        neighboringBoards.add(neighbor);
      }
      return neighboringBoards;
    }
  }

  // a board that is obtained by exchanging any pair of tiles
  Board twin() {
    List<List<int>> twinTiles = tilesCopy();
    if (tiles[0][0] != 0 && tiles[0][1] != 0) {
      twinTiles[0][0] = tiles[0][1];
      twinTiles[0][1] = tiles[0][0];
    } else {
      twinTiles[1][0] = tiles[1][1];
      twinTiles[1][1] = tiles[1][0];
    }
    return Board(twinTiles);
  }

  List<List<int>> tilesCopy() {
    List<List<int>> tilesCopy =
        List.generate(dimension(), (i) => List.filled(dimension(), 0));
    for (int i = 0; i < dimension(); i++) {
      for (int j = 0; j < dimension(); j++) {
        tilesCopy[i][j] = tiles[i][j];
      }
    }
    return tilesCopy;
  }
}
