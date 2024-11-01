import 'dart:async'; // Required for Timer
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final List<Map<String, String>> imgList = [
    {
      'image': 'Assests/image1.png',
      'text': 'AB LOCAL HOGA VOCAL',
    },
    {
      'image': 'Assests/image2.png',
      'text': 'FROM STORE TO DOOR',
    },
    {
      'image': 'Assests/image3.png',
      'text': 'FAST DELIVERY, FRIENDLY SERVICE',
    },
  ];

  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < imgList.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0; // Go back to the first page after the last one
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void _stopAutoPlay() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300, // Customizable height for the slider
          child: PageView.builder(
            controller: _pageController,
            itemCount: imgList.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                children: [
                  // Display image
                  Image.asset(
                    imgList[index]['image']!,
                    fit: BoxFit.contain,
                    height: 200, // Set height for images
                  ),
                  const SizedBox(height: 10),
                  // Text under each image
                  Text(
                    imgList[index]['text']!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  entry.key,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (_currentPage == entry.key
                      ? Theme.of(context).primaryColor
                      : Colors.grey).withOpacity(0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
