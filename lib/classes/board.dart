class Board {
  // create a board from an n-by-n array of tiles,
  // where tiles[row][col] = tile at (row, col)
  Board(List<List<int>> tiles) {
    // Initialize
  }

  // string representation of this board
  @override
  String toString() {
    // PLS MODIFY
    return '';
  }

  // board dimension n
  int dimension() {
    // PLS MODIFY
    return 0;
  }

  // number of tiles out of place
  int hamming() {
    // PLS MODIFY
    return 0;
  }

  // sum of Manhattan distances between tiles and goal
  int manhattan() {
    // PLS MODIFY
    return 0;
  }

  // is this board the goal board?
  bool isGoal() {
    // PLS MODIFY
    return false;
  }

  // does this board equal y?

  bool equals(Board y) {
    // PLS MODIFY
    return false;
  }

  // all neighboring boards
  List<Board> neighbors() {
    // PLS MODIFY
    return [];
  }

  // a board that is obtained by exchanging any pair of tiles
  Board twin() {
    // PLS MODIFY
    return Board([]);
  }
}
