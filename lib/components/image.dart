import 'package:flutter/material.dart';

class BBImage extends StatelessWidget {
  const BBImage({
    super.key,
		required this.size,
		required this.url,
		this.borderRadius,
		this.isNetwork = false,
  });

	final double size;
	final String url;
	final double? borderRadius;
	final bool isNetwork;

  @override
  Widget build(BuildContext context) {
    return Center(
			child: Container(
				height: size,
				width: size,
				clipBehavior: Clip.hardEdge,
				decoration: BoxDecoration(
					borderRadius: BorderRadius.circular(100),
				),
				child: isNetwork ? Image.network(url) : Image.asset(url),
			),
		);
  }
}	