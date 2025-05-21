import 'package:flutter/material.dart';

class BBImage extends StatelessWidget {
  const BBImage({
    super.key,
		required this.size,
		required this.url,
		this.borderRadius,
  });

	final double size;
	final String url;
	final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Center(
			child: Container(
				height: size,
				width: size,
						decoration: BoxDecoration(
							borderRadius: BorderRadius.circular(borderRadius??10),
						),
				child: Image.asset(url),
			),
		);
  }
}	