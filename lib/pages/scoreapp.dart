import 'package:flutter/material.dart';

class ScoreApp extends StatefulWidget {
  const ScoreApp({super.key});

  @override
  State<ScoreApp> createState() => _ScoreAppState();
}

class _ScoreAppState extends State<ScoreApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Score App'),
          centerTitle: true,
        ),
        body: Column(
          children: const [
            Mycontainer(
              score: "20",
              teamname: 'Team A',
            ),
            SizedBox(
              height: 35,
            ),
            Mycontainer(
              score: "40",
              teamname: "Team B",
            ),
          ],
        ));
  }
}

class Mycontainer extends StatelessWidget {
  final String teamname;
  final String score;
  const Mycontainer({super.key, required this.teamname, required this.score});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.lightGreen,
          border: Border.all(
            color: Colors.greenAccent,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(teamname),
            Text(score),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
