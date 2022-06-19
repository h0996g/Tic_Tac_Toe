import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gamebutton.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int co1 = 0;
  int co2 = 0;
  late int co11;
  late int co22;
  bool xomessageon = true;
  Color xomessage = Colors.red;

  //pop//
  bool p1win = false;
  bool p2win = false;
  bool tied = false;
  //pop//
  Random random = Random();
  bool turn = true;
  int a = 0;
  List<int> oo = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  final title = 'Grid List';

  var player1 = [];
  var player2 = [];
  String gamestr = 'Player one Turn';

  List listButton = <GameButton>[
    new GameButton(1),
    new GameButton(2),
    new GameButton(3),
    new GameButton(4),
    new GameButton(5),
    new GameButton(6),
    new GameButton(7),
    new GameButton(8),
    new GameButton(9)
  ];

  void reset() {
    for (int i = 0; i < 9; i++) {
      listButton[i].str = '';
      listButton[i].enabled = true;
      listButton[i].clr = Colors.black26;
      // listButton[a].clr2 = Colors.transparent;
    }
    co1 = 0;
    co2 = 0;
    turn = true;
    p2win = false;
    p1win = false;
    tied = false;

    oo = [0, 1, 2, 3, 4, 5, 6, 7, 8];
    player1 = [];
    player2 = [];
    // gamestr = "Player one turn";
    xomessageon = true;
    xomessage = Colors.red;
  }

  void player22(a) {
    listButton[a].str = 'O';
    listButton[a].enabled = false;
    listButton[a].clr = Colors.white;
    listButton[a].clr2 = Colors.blue;
    player2.add(a);
    oo.remove(a);
  }

  bool checkWinner(var player) {
    if (player.contains(0) && player.contains(1) && player.contains(2)) {
      return true;
    }
    if (player.contains(3) && player.contains(4) && player.contains(5)) {
      return true;
    }
    if (player.contains(6) && player.contains(7) && player.contains(8)) {
      return true;
    }
    if (player.contains(0) && player.contains(3) && player.contains(6)) {
      return true;
    }
    if (player.contains(1) && player.contains(4) && player.contains(7)) {
      return true;
    }
    if (player.contains(2) && player.contains(5) && player.contains(8)) {
      return true;
    }
    if (player.contains(0) && player.contains(4) && player.contains(8)) {
      return true;
    }
    if (player.contains(2) && player.contains(4) && player.contains(6)) {
      return true;
    }

    return false;
  }

  bool checkNull() {
    for (int i = 0; i < 9; i++) {
      if (listButton[i].enabled) return false;
    }
    tied = true;
    return true;
  }

  void playGame(int index) {
    // player 1
    if (listButton[index].enabled && turn) {
      listButton[index].str = 'X';
      listButton[index].enabled = false;
      listButton[index].clr = Colors.white;
      listButton[index].clr2 = Colors.red;
      player1.add(index);
      oo.remove(index);
      // gamestr = 'Play your turn';
      xomessageon = true;
      if (twopl) {
        turn = false;
        // gamestr = 'Player tow turn';
        xomessageon = false;
      }
    }

    if (checkWinner(player1)) {
      for (int i = 0; i < 9; i++) {
        listButton[i].enabled = false;
        listButton[i].clr = Colors.white;
      }
      p1win = true;
      co1++;

      return;
    }
    // check Null
    if (!checkWinner(player2) && !checkWinner(player1) && checkNull()) {
      return;
    }

    // player 2
    // var allPlayedButtons = new List.from(player1)..addAll(player2);

    if (oo.isNotEmpty && !twopl) {
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
        a = oo[random.nextInt(oo.length)];
        player22(a);
      }
    } else {
      if (listButton[index].enabled && !turn && twopl) {
        listButton[index].str = 'O';
        listButton[index].enabled = false;
        listButton[index].clr = Colors.white;
        listButton[index].clr2 = Colors.blue;
        player2.add(index);
        turn = true;
        // gamestr = "Player one turn";
        xomessageon = true;
      }
    }

    if (checkWinner(player2)) {
      for (int i = 0; i < 9; i++) {
        listButton[i].enabled = false;
        listButton[i].clr = Colors.white;
      }
      p2win = true;
      co2++;
      return;
    }
  }

  bool twopl = false;
  bool ismachine = false;
  bool istwo = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: xomessage,
        appBar: AppBar(
          title: const Text("TIC TAC"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          color: Colors.white12,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(13)),
                child: CheckboxListTile(
                  isThreeLine: true,
                  title: Text(
                    'two PLAYERS ?',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  selected: ismachine,

                  // secondary: ,
                  subtitle: Text('choose yes for two players',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.black)),
                  value: ismachine,
                  onChanged: (r) {
                    setState(() {
                      ismachine = r!;
                      if (r) {
                        // istwo = true;
                        twopl = true;
                      } else {
                        // istwo = false;
                        twopl = false;
                      }

                      reset();
                    });
                  },
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: NotificationListener<OverscrollIndicatorNotification>(
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
                        return RaisedButton(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            listButton[index].str,
                            style: TextStyle(
                                color: listButton[index].clr2, fontSize: 90.0),
                          ),
                          color: listButton[index].clr,
                          disabledColor: Colors.grey,
                          onPressed: () {
                            setState(() {
                              if (listButton[index].enabled) {
                                if (twopl) {
                                  if (xomessage == Colors.red) {
                                    xomessage = Colors.blue;
                                  } else {
                                    xomessage = Colors.red;
                                  }
                                }

                                playGame(index);
                              }
                              if (p2win || p1win || tied) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return CupertinoAlertDialog(
                                        title: const Text(
                                          'END GAME',
                                          style: TextStyle(fontSize: 30),
                                        ),
                                        content: DefaultTextStyle(
                                          style: const TextStyle(
                                            fontSize: 30.0,
                                          ),
                                          child: Center(
                                            child: AnimatedTextKit(
                                              animatedTexts: [
                                                WavyAnimatedText(p1win
                                                    ? 'Player one won'
                                                    : p2win
                                                        ? 'player tow won'
                                                        : tied
                                                            ? 'TIED'
                                                            : ''),
                                              ],
                                              isRepeatingAnimation: true,
                                            ),
                                          ),
                                        )
                                        // Text(
                                        //   p1win
                                        //       ? 'Player one won'
                                        //       : p2win
                                        //           ? 'player tow won'
                                        //           : tied
                                        //               ? 'TIED'
                                        //               : '',
                                        //   style: const TextStyle(fontSize: 20),
                                        // ),
                                        ,
                                        actions: [
                                          CupertinoDialogAction(
                                            child: const Text(
                                              'ok',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                co11 = co1;
                                                co22 = co2;
                                                reset();
                                                co1 = co11;
                                                co2 = co22;
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
                      }),
                )),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // RichText(
                  //   text: TextSpan(
                  //       style: DefaultTextStyle.of(context).style,
                  //       children: [
                  //
                  //         TextSpan(
                  //             text: xomessageon ? 'X' : 'O',
                  //             style: TextStyle(
                  //                 fontSize: 50,
                  //                 color: xomessage,
                  //                 fontWeight: FontWeight.bold)),
                  //          const TextSpan(
                  //             text: ' TURN',
                  //             style: TextStyle(
                  //                 fontSize: 50,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold))
                  //       ]),
                  // ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.white,
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text(
                            xomessageon ? 'x' : 'O',
                            style: TextStyle(
                                fontSize: 50,
                                color: xomessage,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        ' TURN',
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Score P1 : $co1',
                        style: TextStyle(fontSize: 25, color: Colors.blue),
                      ),
                      Text('Score P2 : $co2',
                          style: TextStyle(fontSize: 25, color: Colors.red))
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: Colors.teal,
                    child: Text(
                      'play again',
                      style: TextStyle(fontSize: 30),
                    ),
                    onPressed: () {
                      setState(() {
                        co11 = co1;
                        co22 = co2;
                        reset();
                        co1 = co11;
                        co2 = co22;
                      });
                    }),
                MaterialButton(
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: const Text(
                    "refresh",
                    style: TextStyle(fontSize: 30),
                  ),
                  color: Colors.teal,
                  onPressed: () {
                    setState(() {
                      reset();
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            )
          ]),
        ),
      ),
    );
  }
}
