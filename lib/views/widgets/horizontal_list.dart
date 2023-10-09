import 'package:flutter/material.dart';

class HorizontalContainerList extends StatelessWidget {
  const HorizontalContainerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal, // Set the direction to horizontal
      itemCount: 5, // Number of containers you want
      itemBuilder: (BuildContext context, int index) {
        // Create a container with equal horizontal spacing
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 10.0), // Adjust spacing as needed
          child: Container(
            height: 100,
            width: 100,
            color: Colors.blueGrey, // Change the color as desired
          ),
        );
      },
    );
  }
}
