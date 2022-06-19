import 'dart:math';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'gamebutton.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool twopl = false;
  int xcount = 0;
  int ocount = 0;
  late int xcountsave;
  late int ocountsave;
  Color xomessage = Colors.red;
  double l = 0, r = 0, t = 0, b = 0;

  //pop//
  bool p1win = false;
  bool p2win = false;
  bool tied = false;

  //pop//
  Random random = Random();
  bool turn = true;
  int zher = 0;

  List<int> machineindex = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  var player1 = [];
  var player2 = [];
  List listButton = <GameButton>[
    GameButton(1),
    GameButton(2),
    GameButton(3),
    GameButton(4),
    GameButton(5),
    GameButton(6),
    GameButton(7),
    GameButton(8),
    GameButton(9)
  ];
  void reset() {
    for (int i = 0; i < 9; i++) {
      listButton[i].str = '';
      listButton[i].enabled = true;
      listButton[i].clr = Colors.black26;
      l = 0;
      r = 0;
      t = 0;
      b = 0;
      // listButton[a].clr2 = Colors.transparent;
    }
    xcount = 0;
    ocount = 0;
    turn = true;
    p2win = false;
    p1win = false;
    tied = false;
    machineindex = [0, 1, 2, 3, 4, 5, 6, 7, 8];
    player1 = [];
    player2 = [];
    xomessage = Colors.red;
  }

  void player22(a) {
    listButton[a].str = 'O';
    listButton[a].enabled = false;
    listButton[a].clr = Colors.blue;
    // listButton[a].clr2 = Colors.blue;
    player2.add(a);
    machineindex.remove(a);
  }

  bool checkWinner(var player) {
    if (player.contains(0) && player.contains(1) && player.contains(2)) {
      l = 0.1;
      r = 0.9;
      t = 0.15;
      b = 0.15;
      return true;
    }
    if (player.contains(3) && player.contains(4) && player.contains(5)) {
      l = 0.1;
      r = 0.9;
      t = 0.44;
      b = 0.44;
      return true;
    }
    if (player.contains(6) && player.contains(7) && player.contains(8)) {
      l = 0.1;
      r = 0.9;
      t = 0.72;
      b = 0.72;
      return true;
    }
    if (player.contains(0) && player.contains(3) && player.contains(6)) {
      l = 0.174;
      r = 0.174;
      t = 0.089;
      b = 0.79;
      return true;
    }
    if (player.contains(1) && player.contains(4) && player.contains(7)) {
      l = 1 / 2;
      r = 1 / 2;
      t = 0.089;
      b = 0.79;
      return true;
    }
    if (player.contains(2) && player.contains(5) && player.contains(8)) {
      l = 0.83;
      r = 0.83;
      t = 0.089;
      b = 0.79;
      return true;
    }
    if (player.contains(0) && player.contains(4) && player.contains(8)) {
      l = 0.9;
      r = 0.1;
      t = 0.08;
      b = 0.8;
      return true;
    }
    if (player.contains(2) && player.contains(4) && player.contains(6)) {
      l = 0.9;
      r = 0.1;
      t = 0.8;
      b = 0.08;
      return true;
    }
    return false;
  }

  bool checkNull() {
    for (int i = 0; i < 9; i++) {
      if (listButton[i].enabled) return false;
    }
    return true;
  }

  void playGame(int index) {
    // player 1
    if (turn) {
      listButton[index].str = 'X';
      listButton[index].enabled = false;
      listButton[index].clr = Colors.red;
      player1.add(index);
      machineindex.remove(index);
      if (twopl) {
        turn = false;
      }
    }
    if (checkWinner(player1)) {
      for (int i = 0; i < 9; i++) {
        listButton[i].enabled = false;
        listButton[i].clr = Colors.red;
      }
      //kima yrb7 p1 yb9a mktob dalet x
      turn = true;
      p1win = true;
      xcount++;
      return;
    }
    // check Null
    if (!checkWinner(player2) && !checkWinner(player1) && checkNull()) {
      tied = true;
      return;
    }
    // player 2
    // var allPlayedButtons = new List.from(player1)..addAll(player2);
    if (machineindex.isNotEmpty && !twopl) {
      //win
      //line 1
      if (player2.contains(0) && player2.contains(1) && !player1.contains(2)) {
        player22(2);
      } else if (player2.contains(0) &&
          player2.contains(2) &&
          !player1.contains(1)) {
        player22(1);
      } else if (player2.contains(1) &&
          player2.contains(2) &&
          !player1.contains(0)) {
        player22(0);
      }
      //line 2
      else if (player2.contains(3) &&
          player2.contains(4) &&
          !player1.contains(5)) {
        player22(5);
      } else if (player2.contains(3) &&
          player2.contains(5) &&
          !player1.contains(4)) {
        player22(4);
      } else if (player2.contains(4) &&
          player2.contains(5) &&
          !player1.contains(3)) {
        player22(3);
      }
      //line 3
      else if (player2.contains(6) &&
          player2.contains(7) &&
          !player1.contains(8)) {
        player22(8);
      } else if (player2.contains(7) &&
          player2.contains(8) &&
          !player1.contains(6)) {
        player22(6);
      } else if (player2.contains(6) &&
          player2.contains(8) &&
          !player1.contains(7)) {
        player22(7);
      }
      //column 1
      else if (player2.contains(0) &&
          player2.contains(3) &&
          !player1.contains(6)) {
        player22(6);
      } else if (player2.contains(3) &&
          player2.contains(6) &&
          !player1.contains(0)) {
        player22(0);
      } else if (player2.contains(0) &&
          player2.contains(6) &&
          !player1.contains(3)) {
        player22(3);
      }
      //column 2
      else if (player2.contains(1) &&
          player2.contains(4) &&
          !player1.contains(7)) {
        player22(7);
      } else if (player2.contains(4) &&
          player2.contains(7) &&
          !player1.contains(1)) {
        player22(1);
      } else if (player2.contains(1) &&
          player2.contains(7) &&
          !player1.contains(4)) {
        player22(4);
      }
      //column 3
      else if (player2.contains(2) &&
          player2.contains(5) &&
          !player1.contains(8)) {
        player22(8);
      } else if (player2.contains(5) &&
          player2.contains(8) &&
          !player1.contains(2)) {
        player22(2);
      } else if (player2.contains(2) &&
          player2.contains(8) &&
          !player1.contains(5)) {
        player22(5);
      }
      //nos1
      else if (player2.contains(0) &&
          player2.contains(4) &&
          !player1.contains(8)) {
        player22(8);
      } else if (player2.contains(4) &&
          player2.contains(8) &&
          !player1.contains(0)) {
        player22(0);
      } else if (player2.contains(0) &&
          player2.contains(8) &&
          !player1.contains(4)) {
        player22(4);
      }
      //nos 2
      else if (player2.contains(2) &&
          player2.contains(4) &&
          !player1.contains(6)) {
        player22(6);
      } else if (player2.contains(2) &&
          player2.contains(6) &&
          !player1.contains(4)) {
        player22(4);
      } else if (player2.contains(4) &&
          player2.contains(6) &&
          !player1.contains(2)) {
        player22(2);
      }
      //nul
      //line 1
      else if (player1.contains(0) &&
          player1.contains(1) &&
          !player2.contains(2)) {
        player22(2);
      } else if (player1.contains(0) &&
          player1.contains(2) &&
          !player2.contains(1)) {
        player22(1);
      } else if (player1.contains(1) &&
          player1.contains(2) &&
          !player2.contains(0)) {
        player22(0);
      }
      //line 2
      else if (player1.contains(3) &&
          player1.contains(4) &&
          !player2.contains(5)) {
        player22(5);
      } else if (player1.contains(3) &&
          player1.contains(5) &&
          !player2.contains(4)) {
        player22(4);
      } else if (player1.contains(4) &&
          player1.contains(5) &&
          !player2.contains(3)) {
        player22(3);
      }
      //line 3
      else if (player1.contains(6) &&
          player1.contains(7) &&
          !player2.contains(8)) {
        player22(8);
      } else if (player1.contains(7) &&
          player1.contains(8) &&
          !player2.contains(6)) {
        player22(6);
      } else if (player1.contains(6) &&
          player1.contains(8) &&
          !player2.contains(7)) {
        player22(7);
      }
      //column 1
      else if (player1.contains(0) &&
          player1.contains(3) &&
          !player2.contains(6)) {
        player22(6);
      } else if (player1.contains(3) &&
          player1.contains(6) &&
          !player2.contains(0)) {
        player22(0);
      } else if (player1.contains(0) &&
          player1.contains(6) &&
          !player2.contains(3)) {
        player22(3);
      }
      //column 2
      else if (player1.contains(1) &&
          player1.contains(4) &&
          !player2.contains(7)) {
        player22(7);
      } else if (player1.contains(4) &&
          player1.contains(7) &&
          !player2.contains(1)) {
        player22(1);
      } else if (player1.contains(1) &&
          player1.contains(7) &&
          !player2.contains(4)) {
        player22(4);
      }
      //column 3
      else if (player1.contains(2) &&
          player1.contains(5) &&
          !player2.contains(8)) {
        player22(8);
      } else if (player1.contains(5) &&
          player1.contains(8) &&
          !player2.contains(2)) {
        player22(2);
      } else if (player1.contains(2) &&
          player1.contains(8) &&
          !player2.contains(5)) {
        player22(5);
      }
      //nos1
      else if (player1.contains(0) &&
          player1.contains(4) &&
          !player2.contains(8)) {
        player22(8);
      } else if (player1.contains(4) &&
          player1.contains(8) &&
          !player2.contains(0)) {
        player22(0);
      } else if (player1.contains(0) &&
          player1.contains(8) &&
          !player2.contains(4)) {
        player22(4);
      }
      //nos 2
      else if (player1.contains(2) &&
          player1.contains(4) &&
          !player2.contains(6)) {
        player22(6);
      } else if (player1.contains(2) &&
          player1.contains(6) &&
          !player2.contains(4)) {
        player22(4);
      } else if (player1.contains(4) &&
          player1.contains(6) &&
          !player2.contains(2)) {
        player22(2);
      } else {
        zher = machineindex[random.nextInt(machineindex.length)];
        player22(zher);
      }
    }
    //hadi kima y3odo two player
    if (listButton[index].enabled && !turn) {
      listButton[index].str = 'O';
      listButton[index].enabled = false;
      listButton[index].clr = Colors.blue;
      player2.add(index);
      turn = true;
    }
    if (checkWinner(player2)) {
      for (int i = 0; i < 9; i++) {
        listButton[i].enabled = false;
        listButton[i].clr = Colors.blue;
      }
      //3la jal kima y3od contre machif wtrb7 matetbedelch  flakher wtwali o turn
      twopl ? turn = false : turn = true;
      p2win = true;
      ocount++;
      return;
    }
    // bh nb9a nbdl color t3 x w o f kol parti
    if (twopl) {
      if (xomessage == Colors.red) {
        xomessage = Colors.blue;
      } else {
        xomessage = Colors.red;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Expanded(
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xff246ee9)),
                child: Center(
                  child: CheckboxListTile(
                      secondary: const Icon(
                        Icons.group,
                        size: 50,
                      ),
                      title: const Text(
                        'Multiplayer :',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      value: twopl,
                      onChanged: (b) {
                        setState(() {
                          twopl = b!;
                          reset();
                        });
                      }),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Stack(
              fit: StackFit.expand,
              children: [
                NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overScroll) {
                      overScroll.disallowGlow();
                      return true;
                    },
                    child: GridView.builder(
                        padding: const EdgeInsets.all(10.0),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 1.0,
                                crossAxisSpacing: 12.0,
                                mainAxisSpacing: 12.0),
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return NeumorphicButton(
                            style: NeumorphicStyle(
                              depth: 10,
                              shadowDarkColor: Colors.black,
                              color: listButton[index].clr,
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              listButton[index].str,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 90.0),
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              setState(() {
                                if (listButton[index].enabled) {
                                  playGame(index);
                                }

                                if (p2win || p1win || tied) {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Text(
                                            p1win
                                                ? 'Player one won'
                                                : p2win
                                                    ? 'player two won'
                                                    : tied
                                                        ? 'DRAW'
                                                        : '',
                                            style: TextStyle(
                                                color: p2win && !twopl
                                                    ? Colors.blue
                                                    : tied
                                                        ? Colors.brown
                                                        : xomessage,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          actions: [
                                            TextButton(
                                              child: const Text(
                                                'Play Again!',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.teal,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  xcountsave = xcount;
                                                  ocountsave = ocount;
                                                  reset();
                                                  xcount = xcountsave;
                                                  ocount = ocountsave;
                                                  Navigator.pop(context);
                                                });
                                              },
                                            )
                                          ],
                                        );
                                      });
                                }
                              });
                            },
                          );
                        })),
                CustomPaint(
                  foregroundPainter: LinePainter(l, r, t, b),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Neumorphic(
                  margin: const EdgeInsets.symmetric(horizontal: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 40,
                          child: Text(
                            turn ? 'X ' : 'O',
                            style: TextStyle(
                                color: xomessage,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          )),
                      const Text('TURN',
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      NeumorphicText(
                        'Player One $xcount -',
                        textStyle: NeumorphicTextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                        style: const NeumorphicStyle(
                          color: Colors.black,
                        ),
                      ),
                      NeumorphicText(
                        ' $ocount Player Two',
                        textStyle: NeumorphicTextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                        style: const NeumorphicStyle(
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NeumorphicButton(
                    child: const Text(
                      'New Game',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      setState(() {
                        //bah yb9a score..
                        xcountsave = xcount;
                        ocountsave = ocount;
                        reset();
                        xcount = xcountsave;
                        ocount = ocountsave;
                      });
                    }),
                NeumorphicButton(
                  child: const Text(
                    "End Game",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    setState(() {
                      reset();
                    });
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  late double l;
  late double r;
  late double b;
  late double t;
  LinePainter(this.l, this.r, this.b, this.t);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.greenAccent
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;
    canvas.drawLine(
      Offset(size.width * l, size.height * t),
      Offset(size.width * r, size.height * b),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
