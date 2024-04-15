import 'package:min_max_heap/min_max_heap.dart';
import 'package:slider_puzzle/classes/search_node.dart';

import 'board.dart';

class Solver {
  // Create a priority queue of SearchNodes
  // Each SearchNode represents a game state, including the board, the number of moves made to reach this state, and the previous state
  // The priority of a SearchNode is the sum of the number of moves made and the Manhattan distance of the board
  SearchNode? initialNode;
  SearchNode twinNode;

  Solver(Board initial)
      // Add the initial board to the priority queue with 0 moves made and no previous state
      : initialNode = SearchNode(initial, 0),
        twinNode = SearchNode(initial.twin(), 0) {
    MinMaxHeap<SearchNode> queue = MinMaxHeap<SearchNode>(
      input: [],
      criteria: (node) => node.priority(),
    );
    MinMaxHeap<SearchNode> twinQueue = MinMaxHeap<SearchNode>(
      input: [],
      criteria: (node) => node.priority(),
    );

    queue.add(initialNode!);
    twinQueue.add(twinNode);

    while (queue.isNotEmpty) {
      SearchNode currentNode = queue.removeMin();
      SearchNode twinCurrentNode = twinQueue.removeMin();

      if (currentNode.board.isGoal()) {
        initialNode = currentNode;
        break;
      } else if (twinCurrentNode.board.isGoal()) {
        initialNode = null;
        break;
      }

      currentNode.insertNeighbors(queue, currentNode);
      twinCurrentNode.insertNeighbors(twinQueue, twinCurrentNode);
    }
  }

  // is the initial board solvable? (see below)
  bool isSolvable() {
    // Return whether the initial board is solvable
    return initialNode != null;
  }

  // min number of moves to solve initial board; -1 if unsolvable
  int moves() {
    // If the initial board is unsolvable, return -1
    // Otherwise, return the number of moves made to reach the goal board
    return isSolvable() ? initialNode!.moves : -1;
  }

  // sequence of boards in a shortest solution; null if unsolvable
  List<Board>? solution() {
    // If the initial board is unsolvable, return null
    // Otherwise, return the sequence of boards in a shortest solution
    if (isSolvable()) {
      SearchNode? sequenceNode = initialNode;
      List<Board> solution = [];

      while (sequenceNode != null) {
        solution.insert(0, sequenceNode.getBoard());
        sequenceNode = sequenceNode.previousSearchNode;
      }

      return solution;
    }

    return null;
  }
}
