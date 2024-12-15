import 'package:flutter/material.dart';

class CountCard extends StatelessWidget {
  const CountCard({
    super.key,
    required this.color,
    required this.label,
    required this.info,
  });

  final Color color;
  final String label;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        shape: BoxShape.rectangle,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(43, 0, 0, 0),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              info,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}
