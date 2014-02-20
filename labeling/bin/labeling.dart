import 'dart:io';

void main() {
  File f = new File('labelmaker.txt');
  var lines = f.readAsLinesSync();
  var T = int.parse(lines[0]);
  var lineNo = 1;
  for (var test = 1; test < T; test++) {
    var LN = lines[lineNo++].split(" ");
    var L = " " + LN[0];
    var l = LN[0].length;
    var N = int.parse(LN[1]);
    
    var aggregatedl = 0;
    var lfactor = 0;

    var result="";
    while (N > aggregatedl) {
      if (lfactor > 0) {
        result = "${L[(((N-aggregatedl-1)/lfactor).floor() % l) + 1]}$result";
      } else {
        result = L[((N-1) % l) + 1];
        lfactor = 1;
      }
      lfactor = lfactor*l;
      aggregatedl = aggregatedl + lfactor;
    }

    print("Case #$test: $result");
  }
}
