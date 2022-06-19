import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'home.dart';

class Pagee extends StatefulWidget {
  const Pagee({Key? key}) : super(key: key);

  @override
  State<Pagee> createState() => _PageeState();
}

class _PageeState extends State<Pagee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/tiic.jpg'), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NeumorphicButton(
                style: const NeumorphicStyle(
                  depth: 10,
                  color: Colors.yellow,
                  shadowDarkColor: Colors.black,
                ),
                child: const Text(
                  'Start Game ',
                  style: TextStyle(fontSize: 50),
                ),
                onPressed: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  });
                },
              ),
              const SizedBox(
                height: 30,
              ),
              NeumorphicButton(
                onPressed: () {},
                style: const NeumorphicStyle(
                  depth: -10,
                  shadowDarkColorEmboss: Colors.black,
                ),
                child: const Text(
                  'About Us',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
