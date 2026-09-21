import 'dart:io';

String getUserName(String user) {
  stdout.write('Enter $user name: ');
  String? name = stdin.readLineSync();
  return name == null || name.trim().isEmpty ? user : name.trim();
}

String? checkMove(String? input, List<String> choices) {
  String move = input?.trim().toLowerCase() ?? '';
  if (choices.contains(move)) {
    return move;
  }
  return null;
}

String askMove(String name, List<String> choices) {
  while (true) {
    stdout.write('$name, enter move (rock/paper/scissors): ');
    String? input = stdin.readLineSync();
    String? move = checkMove(input, choices);

    if (move != null) {
      return move;
    }
    print('Invalid move. Please try again.');
  }
}

String? checkWinner(String firstMove, String secondMove) {
  if (firstMove == secondMove) {
    return null;
  }

  if ((firstMove == 'rock' && secondMove == 'scissors') ||
      (firstMove == 'paper' && secondMove == 'rock') ||
      (firstMove == 'scissors' && secondMove == 'paper')) {
    return 'First User';
  }

  return 'Second User';
}

void main() {
  print('===== ROCK, PAPER, SCISSORS =====');

  List<String> choices = ['rock', 'paper', 'scissors'];

  String firstUser = getUserName('First User');
  String secondUser = getUserName('Second User');

  int firstScore = 0;
  int secondScore = 0;
  int round = 1;
  String playAgain;

  do {
    print('\n--- Round $round ---');

    String firstMove = askMove(firstUser, choices);

    for (int i = 0; i < 30; i++) {
      print('');
    }

    String secondMove = askMove(secondUser, choices);

    print('$firstUser chose $firstMove.');
    print('$secondUser chose $secondMove.');

    String? winner = checkWinner(firstMove, secondMove);

    if (winner == 'First User') {
      firstScore++;
      print('Result: $firstUser wins!');
    } else if (winner == 'Second User') {
      secondScore++;
      print('Result: $secondUser wins!');
    } else {
      print('Result: ${winner ?? "It\'s a draw!"}');
    }
    print('Score: $firstUser $firstScore - $secondUser $secondScore');

    stdout.write('Play again? (y/n): ');
    String? answer = stdin.readLineSync();
    playAgain = answer?.trim().toLowerCase() ?? 'n';

    round++;
  } while (playAgain == 'y');

  print('\n===== FINAL SCORE =====');
  print('$firstUser: $firstScore');
  print('$secondUser: $secondScore');

  if (firstScore > secondScore) {
    print('Overall winner: $firstUser');
  } else if (secondScore > firstScore) {
    print('Overall winner: $secondUser');
  } else {
    print('Overall result: It\'s a draw!');
  }
}