// product_reels_engine.dart
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ProductReelsEngine extends StatefulWidget {
  final List<String> reelUrls; // List of video URLs (from Firebase/Cloud)

  const ProductReelsEngine({required this.reelUrls, super.key});

  @override
  State<ProductReelsEngine> createState() => _ProductReelsEngineState();
}

class _ProductReelsEngineState extends State<ProductReelsEngine> {
  late PageController _pageController;
  final Map<int, VideoPlayerController> _controllers = {};

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    for (int i = 0; i < widget.reelUrls.length; i++) {
      final controller = VideoPlayerController.network(widget.reelUrls[i])
        ..initialize().then((_) => setState(() {}))
        ..setLooping(true)
        ..play();
      _controllers[i] = controller;
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      controller: _pageController,
      itemCount: widget.reelUrls.length,
      itemBuilder: (context, index) {
        final controller = _controllers[index];
        return Stack(
          children: [
            controller != null && controller.value.isInitialized
                ? SizedBox.expand(child: VideoPlayer(controller))
                : const Center(child: CircularProgressIndicator()),
            Positioned(
              bottom: 20,
              left: 20,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Navigate to product page or add to cart
                  debugPrint("🛒 User wants to buy item #$index");
                },
                child: const Text('Shop Now'),
              ),
            ),
          ],
        );
      },
    );
  }
}
