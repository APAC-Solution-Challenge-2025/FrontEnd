import 'package:flutter/material.dart';

Widget selectButton({
  required String label,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6.0),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFB5C98E) : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: isSelected ? null : Border.all(color: Colors.grey.shade400),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  )
                ]
              : [],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
    ),
  );
}

Widget nextButton(BuildContext context, Widget nextPage,
    {VoidCallback? onPressed}) {
  return Align(
    alignment: Alignment.bottomRight,
    child: GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed();
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: SizedBox(
          width: 135,
          child: Stack(children: [
            Image.asset('assets/images/next_button.png'),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 28, 0, 0),
              child: Text(
                'NEXT',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          ])),
    ),
  );
}
