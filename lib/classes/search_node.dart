import 'package:min_max_heap/min_max_heap.dart'; 
import './board.dart'; 

class SearchNode {
  Board board;
  int moves;
  SearchNode? previousSearchNode;
  int? cachePriority;

  SearchNode(this.board, this.moves);

  int priority() {
    if (cachePriority != null) {
      return cachePriority!;
    }

    final priority = moves + board.manhattan();
    cachePriority = priority;
    return priority;
  }

  bool isGoal() {
    return board.isGoal();
  }

  Board getBoard() {
    return board;
  }

  List<Board> neighbors() {
    return board.neighbors();
  }

  int heuristic() {
    return board.manhattan() + moves;
  }

  bool compare(SearchNode other) {
    return heuristic() < other.heuristic();
  }

  String toStrings() {
    return board.toString();
  }

  void insertNeighbors(MinMaxHeap<SearchNode> queue, SearchNode currentNode) {
    for (final neighbor in currentNode.neighbors()) {
      final previousBoard = currentNode.previousSearchNode?.getBoard();

      if (previousBoard != neighbor) {
        final newMoves = currentNode.moves + 1;
        final node = SearchNode(neighbor, newMoves);
        node.previousSearchNode = currentNode;
        queue.insert(node); 
      }
    }
  }
}
