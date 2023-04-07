import 'package:flutter/material.dart';

import '../../../core/components/network_image.dart';

class ImageSliderFood extends StatefulWidget {
  const ImageSliderFood({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageSliderFood> createState() => _ImageSliderFoodState();
}

class _ImageSliderFoodState extends State<ImageSliderFood> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.9);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        child: PageView(
          controller: _controller,
          padEnds: false,
          children: const [
            Padding(
              padding: EdgeInsets.all(16),
              child: NetworkImageWithLoader(
                'https://i.imgur.com/JRWxyhP.png',
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: NetworkImageWithLoader(
                'https://i.imgur.com/WTjq9wQ.png',
              ),
            ),
          ],
        ));
  }
}
