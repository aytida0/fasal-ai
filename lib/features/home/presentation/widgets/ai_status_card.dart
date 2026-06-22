import 'package:flutter/material.dart';

class AIStatusCard extends StatelessWidget {
  const AIStatusCard({super.key});

  @override
Widget build(BuildContext context) {
  return Center(
    child: Container(
      width: MediaQuery.of(context).size.width * .78,
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [const Color.fromARGB(255, 227, 227, 227), const Color.fromARGB(255, 221, 237, 222)],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00A152).withValues(alpha: .10),
            blurRadius: 24,
            spreadRadius: 1,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(color: const Color.fromARGB(255, 222, 222, 222).withValues(alpha: .05)),
      ),
      child: Row(
        children: [
          Container(
            width: 37,
            height: 37,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: LinearGradient(
                colors: [const Color(0xFF18B562), const Color(0xFF00A152)],
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/crop_ai.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Crop Model Ready',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Offline crop analysis available',
                  style: TextStyle(
                    color: Color.fromARGB(137, 47, 47, 47),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: const Color.fromARGB(198, 19, 204, 158),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 30, 191, 105).withValues(alpha: .6),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

}
