// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'game_button.dart';
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final title = 'Grid List';
//
//   var player1 = [];
//   var player2 = [];
//   String gamestr = 'Play your Turn';
//
//   List listButton = <GameButton>[
//     new GameButton(1),
//     new GameButton(2),
//     new GameButton(3),
//     new GameButton(4),
//     new GameButton(5),
//     new GameButton(6),
//     new GameButton(7),
//     new GameButton(8),
//     new GameButton(9)
//   ];
//   List oo = <int>[0, 1, 2, 3, 4, 5, 6, 7, 8];
//   int z = 0;
//   int a = 0;
//   Random random = Random();
//   int scr1 = 0;
//   int scr2 = 0;
//   int scr11 = 0;
//   int scr22 = 0;
//   int scr33 = 0;
//   int scr44 = 0;
//   int h = 0;
//   int f = 0;
//   Color msg = Colors.red;
//   //pop//
//   bool playeronew=false;
//   bool playertwow=false;
//   bool draw=false;
//   //pop//
//
//   void reset() {
//     for (int i = 0; i < 9; i++) {
//       listButton[i].str = '';
//       listButton[i].enabled = true;
//       listButton[i].clr = Color(0xffffffff);
//     }
//     tic = false;
//     z = 0;
//     oo = [0, 1, 2, 3, 4, 5, 6, 7, 8];
//     player1 = [];
//     player2 = [];
//     gamestr = "Play your turn";
//     scr1 = 0;
//     scr2 = 0;
//     playeronew=false;
//     playertwow=false;
//     draw=false;
//     msg=Colors.red;
//   }
//
//   bool tic = false;
//
//   bool checkWinner(var player) {
//     if (player.contains(0) && player.contains(1) && player.contains(2))
//       return true;
//     if (player.contains(3) && player.contains(4) && player.contains(5))
//       return true;
//     if (player.contains(6) && player.contains(7) && player.contains(8))
//       return true;
//     if (player.contains(0) && player.contains(3) && player.contains(6))
//       return true;
//     if (player.contains(1) && player.contains(4) && player.contains(7))
//       return true;
//     if (player.contains(2) && player.contains(5) && player.contains(8))
//       return true;
//     if (player.contains(0) && player.contains(4) && player.contains(8))
//       return true;
//     if (player.contains(2) && player.contains(4) && player.contains(6))
//       return true;
//
//     return false;
//   }
//
//   bool _value = false;
//
//   void player22(a) {
//     listButton[a].str = 'O';
//     listButton[a].enabled = false;
//     listButton[a].clr = Colors.blue;
//     player2.add(a);
//     oo.remove(a);
//   }
//
//   void playGame(int index) {
//     if (_value == true) {
//       // player 1
//       if (listButton[index].enabled && tic == false) {
//         listButton[index].str = 'X';
//         listButton[index].enabled = false;
//         listButton[index].clr = Colors.red;
//         player1.add(index);
//         tic = true;
//         oo.remove(index);
//         gamestr = 'player two turn';
//         z++;
//         if (z >= 9) {
//           gamestr = 'draw';
//           draw=true;
//         }
//       } else if (listButton[index].enabled && tic == true) {
//         listButton[index].str = 'O';
//         listButton[index].enabled = false;
//         listButton[index].clr = Colors.blue;
//         player2.add(index);
//         tic = false;
//         oo.remove(index);
//         gamestr = 'player one turn';
//         z++;
//       }
//     }
//     if (_value == false) {
//       // player 1
//       if (listButton[index].enabled) {
//         listButton[index].str = 'X';
//         listButton[index].enabled = false;
//         listButton[index].clr = Colors.red;
//         player1.add(index);
//         oo.remove(index);
//         z = z + 2;
//         if (z >= 9) {
//           gamestr = 'draw';
//           draw=true;
//         }
//       }
//
//       // player 2
//
//       //win
//       //line 1
//       if (player2.contains(0) && player2.contains(1) && !player1.contains(2)) {
//         player22(2);
//       } else if (player2.contains(0) &&
//           player2.contains(2) &&
//           !player1.contains(1)) {
//         player22(1);
//       } else if (player2.contains(1) &&
//           player2.contains(2) &&
//           !player1.contains(0)) {
//         player22(0);
//       }
//       //line 2
//       else if (player2.contains(3) &&
//           player2.contains(4) &&
//           !player1.contains(5)) {
//         player22(5);
//       } else if (player2.contains(3) &&
//           player2.contains(5) &&
//           !player1.contains(4)) {
//         player22(4);
//       } else if (player2.contains(4) &&
//           player2.contains(5) &&
//           !player1.contains(3)) {
//         player22(3);
//       }
//       //line 3
//       else if (player2.contains(6) &&
//           player2.contains(7) &&
//           !player1.contains(8)) {
//         player22(8);
//       } else if (player2.contains(7) &&
//           player2.contains(8) &&
//           !player1.contains(6)) {
//         player22(6);
//       } else if (player2.contains(6) &&
//           player2.contains(8) &&
//           !player1.contains(7)) {
//         player22(7);
//       }
//       //column 1
//       else if (player2.contains(0) &&
//           player2.contains(3) &&
//           !player1.contains(6)) {
//         player22(6);
//       } else if (player2.contains(3) &&
//           player2.contains(6) &&
//           !player1.contains(0)) {
//         player22(0);
//       } else if (player2.contains(0) &&
//           player2.contains(6) &&
//           !player1.contains(3)) {
//         player22(3);
//       }
//       //column 2
//       else if (player2.contains(1) &&
//           player2.contains(4) &&
//           !player1.contains(7)) {
//         player22(7);
//       } else if (player2.contains(4) &&
//           player2.contains(7) &&
//           !player1.contains(1)) {
//         player22(1);
//       } else if (player2.contains(1) &&
//           player2.contains(7) &&
//           !player1.contains(4)) {
//         player22(4);
//       }
//       //column 3
//       else if (player2.contains(2) &&
//           player2.contains(5) &&
//           !player1.contains(8)) {
//         player22(8);
//       } else if (player2.contains(5) &&
//           player2.contains(8) &&
//           !player1.contains(2)) {
//         player22(2);
//       } else if (player2.contains(2) &&
//           player2.contains(8) &&
//           !player1.contains(5)) {
//         player22(5);
//       }
//       //nos1
//       else if (player2.contains(0) &&
//           player2.contains(4) &&
//           !player1.contains(8)) {
//         player22(8);
//       } else if (player2.contains(4) &&
//           player2.contains(8) &&
//           !player1.contains(0)) {
//         player22(0);
//       } else if (player2.contains(0) &&
//           player2.contains(8) &&
//           !player1.contains(4)) {
//         player22(4);
//       }
//       //nos 2
//       else if (player2.contains(2) &&
//           player2.contains(4) &&
//           !player1.contains(6)) {
//         player22(6);
//       } else if (player2.contains(2) &&
//           player2.contains(6) &&
//           !player1.contains(4)) {
//         player22(4);
//       } else if (player2.contains(4) &&
//           player2.contains(6) &&
//           !player1.contains(2)) {
//         player22(2);
//       }
//
//       //nul
//       //line 1
//       else if (player1.contains(0) &&
//           player1.contains(1) &&
//           !player2.contains(2)) {
//         player22(2);
//       } else if (player1.contains(0) &&
//           player1.contains(2) &&
//           !player2.contains(1)) {
//         player22(1);
//       } else if (player1.contains(1) &&
//           player1.contains(2) &&
//           !player2.contains(0)) {
//         player22(0);
//       }
//       //line 2
//       else if (player1.contains(3) &&
//           player1.contains(4) &&
//           !player2.contains(5)) {
//         player22(5);
//       } else if (player1.contains(3) &&
//           player1.contains(5) &&
//           !player2.contains(4)) {
//         player22(4);
//       } else if (player1.contains(4) &&
//           player1.contains(5) &&
//           !player2.contains(3)) {
//         player22(3);
//       }
//       //line 3
//       else if (player1.contains(6) &&
//           player1.contains(7) &&
//           !player2.contains(8)) {
//         player22(8);
//       } else if (player1.contains(7) &&
//           player1.contains(8) &&
//           !player2.contains(6)) {
//         player22(6);
//       } else if (player1.contains(6) &&
//           player1.contains(8) &&
//           !player2.contains(7)) {
//         player22(7);
//       }
//       //column 1
//       else if (player1.contains(0) &&
//           player1.contains(3) &&
//           !player2.contains(6)) {
//         player22(6);
//       } else if (player1.contains(3) &&
//           player1.contains(6) &&
//           !player2.contains(0)) {
//         player22(0);
//       } else if (player1.contains(0) &&
//           player1.contains(6) &&
//           !player2.contains(3)) {
//         player22(3);
//       }
//       //column 2
//       else if (player1.contains(1) &&
//           player1.contains(4) &&
//           !player2.contains(7)) {
//         player22(7);
//       } else if (player1.contains(4) &&
//           player1.contains(7) &&
//           !player2.contains(1)) {
//         player22(1);
//       } else if (player1.contains(1) &&
//           player1.contains(7) &&
//           !player2.contains(4)) {
//         player22(4);
//       }
//       //column 3
//       else if (player1.contains(2) &&
//           player1.contains(5) &&
//           !player2.contains(8)) {
//         player22(8);
//       } else if (player1.contains(5) &&
//           player1.contains(8) &&
//           !player2.contains(2)) {
//         player22(2);
//       } else if (player1.contains(2) &&
//           player1.contains(8) &&
//           !player2.contains(5)) {
//         player22(5);
//       }
//       //nos1
//       else if (player1.contains(0) &&
//           player1.contains(4) &&
//           !player2.contains(8)) {
//         player22(8);
//       } else if (player1.contains(4) &&
//           player1.contains(8) &&
//           !player2.contains(0)) {
//         player22(0);
//       } else if (player1.contains(0) &&
//           player1.contains(8) &&
//           !player2.contains(4)) {
//         player22(4);
//       }
//       //nos 2
//       else if (player1.contains(2) &&
//           player1.contains(4) &&
//           !player2.contains(6)) {
//         player22(6);
//       } else if (player1.contains(2) &&
//           player1.contains(6) &&
//           !player2.contains(4)) {
//         player22(4);
//       } else if (player1.contains(4) &&
//           player1.contains(6) &&
//           !player2.contains(2)) {
//         player22(2);
//       } else if (z == 2 || z == 4 || z == 6 || z == 8) {
//         a = oo[random.nextInt(oo.length)];
//         player22(a);
//       }
//     }
//
//     if (checkWinner(player1)) {
//       for (int i = 0; i < 9; i++) {
//         listButton[i].enabled = false;
//         listButton[i].clr = Colors.red;
//       }
//       if (_value == true) {
//         scr11++;
//         scr1 = scr11;
//       } else {
//         scr22++;
//         scr1 = scr22;
//       }
//
//       gamestr = "Player one Won";
//       playeronew=true;
//       return;
//     }
//
//     if (checkWinner(player2)) {
//       for (int i = 0; i < 9; i++) {
//         listButton[i].enabled = false;
//         listButton[i].clr = Colors.blue;
//       }
//
//       if (_value == true) {
//         scr33++;
//         scr2 = scr33;
//       } else {
//         scr44++;
//         scr2 = scr44;
//       }
//       gamestr = "Player two Won";
//       playertwow=true;
//       return;
//     }
//     if (msg == Colors.red && _value) {
//       msg = Colors.blue;
//     } else if (msg == Colors.blue && _value) {
//       msg = Colors.red;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(" Tic Tac Toe ",
//               style: TextStyle(
//                   color: Color(0xff246ee9),
//                   fontWeight: FontWeight.bold,
//                   fontSize: 35)),
//           centerTitle: true,
//           elevation: 3,
//           backgroundColor: Color(0xffe6eff8),
//         ),
//         body: Container(
//           color: Color(0xffe9f1fc),
//           child: Column(children: <Widget>[
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               width: 330,
//               height: 70,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                   color: Color(0xff246ee9)),
//               child: Center(
//                 child: CheckboxListTile(
//                   title: const Text(
//                     'Multiplayer :',
//                     style: TextStyle(
//                         color: Color(0xffffffff),
//                         fontSize: 25.0,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   //subtitle: const Text('_____________________',style: TextStyle(color: Colors.white),),
//                   secondary: const Icon(
//                     Icons.add_circle,
//                     size: 50,
//                   ),
//                   autofocus: false,
//                   activeColor: Color(0xff246ee9),
//                   checkColor: Colors.white,
//                   value: _value,
//                   onChanged: (a) {
//                     setState(() {
//                       _value = a!;
//                       reset();
//                       scr11 = 0;
//                       scr22 = 0;
//                       scr33 = 0;
//                       scr44 = 0;
//                     });
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Expanded(
//                 flex: 6,
//                 child: GridView.builder(
//                     padding: const EdgeInsets.all(10.0),
//                     gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 3,
//                         childAspectRatio: 1.0,
//                         crossAxisSpacing: 12.0,
//                         mainAxisSpacing: 12.0),
//                     itemCount: 9,
//                     itemBuilder: (context, index) {
//                       return RaisedButton(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           listButton[index].str,
//                           style: const TextStyle(
//                               color: Colors.white, fontSize: 60.0),
//                         ),
//                         color: listButton[index].clr,
//                         disabledColor: Colors.grey,
//                         onPressed: () {
//                           setState(() {
//                             if (listButton[index].enabled) {
//                               playGame(index);
//                             }
//
//
//                             if (playeronew || playertwow || draw) {
//                               showDialog(
//
//                                   context: context,
//                                   builder: (context) {
//                                     return CupertinoAlertDialog(
//
//                                       title: const Text(
//                                         'END GAME',
//                                         style: TextStyle(fontSize: 30,color:Colors.white),
//                                       ),
//                                       content: Text(
//                                         playeronew
//                                             ? 'Player one won'
//                                             : playertwow
//                                             ? 'player two won'
//                                             : draw
//                                             ? 'DRAW'
//                                             : '',
//                                         style: const TextStyle(fontSize: 30,color: Colors.white),
//                                       ),
//                                       actions: [
//                                         CupertinoDialogAction(
//                                           child: const Text(
//                                             'ok',
//                                             style: TextStyle(
//                                                 fontSize: 30,
//                                                 color: Colors.white,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                           onPressed: () {
//                                             setState(() {
//
//                                               h = scr1;
//                                               f = scr2;
//                                               reset();
//                                               scr1 = h;
//                                               scr2 = f;
//
//                                               Navigator.pop(context);
//                                             });
//
//                                           },
//                                         )
//                                       ],
//                                     );
//                                   });
//                             }
//
//
//                           });
//                         },
//                       );
//                     })),
//             SizedBox(
//               height: 12,
//             ),
//             Expanded(
//               flex: 1,
//               child: Container(
//                 width: 320,
//                 height: 55,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20), color: msg),
//                 child: Center(
//                   child: Text(
//                     '$gamestr',
//                     textAlign: TextAlign.start,
//                     style: new TextStyle(color: Colors.white, fontSize: 40.0),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             Expanded(
//               flex: 1,
//               child: Container(
//                 width: 335,
//                 height: 70,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: Color(0xff40e0d0)),
//                 child: Center(
//                   child: Text(
//                     'Player one ' '$scr1 ' '- ' '$scr2' ' Player two',
//                     textAlign: TextAlign.start,
//                     style: new TextStyle(
//                         color: Colors.white,
//                         fontSize: 26.0,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Expanded(
//                 flex: 1,
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Container(
//                       width: 170,
//                       height: 50,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           color: Color(0xff246ee9)),
//                       child: MaterialButton(
//                           autofocus: false,
//                           child: Text(
//                             'play again',
//                             style: TextStyle(fontSize: 30, color: Colors.white),
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               h = scr1;
//                               f = scr2;
//                               reset();
//                               scr1 = h;
//                               scr2 = f;
//                             });
//                           }),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Container(
//                       width: 140,
//                       height: 50,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           color: Color(0xff246ee9)),
//                       child: MaterialButton(
//                           autofocus: false,
//                           child: Text(
//                             'refresh',
//                             style: TextStyle(fontSize: 30, color: Colors.white),
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               reset();
//                               scr11 = 0;
//                               scr22 = 0;
//                               scr33 = 0;
//                               scr44 = 0;
//                             });
//                           }),
//                     ),
//                   ],
//                 )),
//             SizedBox(
//               height: 10,
//             )
//           ]),
//         ),
//       ),
//     );
//   }
// }
