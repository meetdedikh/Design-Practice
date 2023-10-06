import 'package:flutter/material.dart';

class BoxScreen extends StatefulWidget {
  const BoxScreen({super.key});

  @override
  State<BoxScreen> createState() => _BoxScreenState();
}

class _BoxScreenState extends State<BoxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        title: const Text("Box Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  color: Colors.blue,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.black12,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.amberAccent,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                ),
                Container(
                  width: 20,
                  color: Colors.transparent,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.blueGrey,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.blueGrey,
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Add horizontal scrolling ListView here
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 100,
                    width: 100,
                    color: Colors.purple,
                    margin: const EdgeInsets.only(right: 10),
                    child: Center(
                      child: Text("Item ${index + 1}"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
