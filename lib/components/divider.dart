import 'package:flutter/material.dart';

class BBDivider extends StatelessWidget {
  const BBDivider({super.key, this.size});

	final double? size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: 1,
        width: size ?? double.infinity,
        child: const Divider(
          color: Colors.grey,
        ),
      ),
    );
  }
}
