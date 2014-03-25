import 'dart:io';

import 'package:unittest/unittest.dart';

solve({N, K, C}) {
  print("$N $K $C");
  print("${4%3}");
  var p = 0;
  while (true) {
    if (N > K) {
      p += N - K; // get rid of empty boxes
      N = K;
    } else {
      var safe = N;
      if (safe >= C) {
        p += C;
        C = 0;
        return p;
      } else {
        C -= safe;
        K -= safe;
        p += safe;
      }
    }
  }
  return p;
}

solveagain({N, K, C}) {
//  print("$N $K $C");
  
  if (C < (K ~/ N) * N) {
    // have enough coins to fill out enough levels 
    // before we reach C.
    return C;
  }
    
  var minPenalty = N;
  var minColumns = 0;
  for (var columns = N; columns >= 1; columns--) {
    var penalty = 
        ((K % columns) > 0? (columns - K % N): 0) + // fill out top row  
        N - columns; // fill out empty columns
    if (penalty < minPenalty) {
      minColumns = columns;
      minPenalty = penalty;
    }
  }
  
//print("minColumns = $minColumns, minPenalty = $minPenalty");
  
  return minPenalty + C;
}

void main() {
  test('Case #1', () => expect(solveagain(N: 3, K: 6, C: 4), 4) );
  test('Case #2', () => expect(solveagain(N: 8, K: 5, C: 2), 5) );
  test('Case #3', () => expect(solveagain(N: 3, K: 4, C: 4), 5) );
  test('Case #4', () => expect(solveagain(N: 1, K: 3, C: 1), 1) );
  test('Case #5', () => expect(solveagain(N: 2, K: 10, C: 9), 9) );
  test('Case #6', () => expect(solveagain(N: 3, K: 7, C: 7), 9) );

  File f = new File('coins_game.txt');
  var lines = f.readAsLinesSync();
  var T = int.parse(lines[0]);
  var lineNo = 1;
  for (var test = 1; test < T; test++) {
    var LN = lines[lineNo++].split(" ");
    var N = int.parse(LN[0]);
    var K = int.parse(LN[1]);
    var C = int.parse(LN[2]);
    print('Case #$test: ${solveagain(N: N, K: K, C:C)}');
  }
}
