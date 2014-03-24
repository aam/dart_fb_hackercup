
import 'package:unittest/unittest.dart';

solve({N, K, C}) {
  print("$N $K $C");
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

void main() {
  print("Hello, World!");
  
//  test('Case #1', () => expect(solve(N: 3, K: 6, C: 4), 4) );
//  test('Case #2', () => expect(solve(N: 8, K: 5, C: 2), 5) );
  test('Case #3', () => expect(solve(N: 3, K: 4, C: 4), 5) );
//  test('Case #4', () => expect(solve(N: 1, K: 3, C: 1), 1) );
//  test('Case #5', () => expect(solve(N: 2, K: 10, C: 9), 9) );
    
}
