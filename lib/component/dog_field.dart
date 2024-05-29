import 'dart:io';
import 'package:flutter/material.dart';

class DogField extends StatefulWidget {
  const DogField({
    super.key,
    required this.petName,
    required this.petImage,
    this.onTap,
    this.onLongPress,
  });

  final String petName;
  final String petImage;
  final Function()? onTap;
  final Function()? onLongPress;

  @override
  State<DogField> createState() => _DogFieldState();
}

class _DogFieldState extends State<DogField>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 50),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (widget.onTap != null) {
      _controller.forward().then((_) {
        _controller.reverse();
        widget.onTap!();
      });
    }
  }

  void _handleLongPress() {
    if (widget.onLongPress != null) {
      _controller.forward().then((_) {
        _controller.reverse();
        widget.onLongPress!();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onLongPress: _handleLongPress,
          onTap: _handleTap,
          child: AnimatedBuilder(
            animation: _scaleAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.file(
                      File(widget.petImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Text(widget.petName),
      ],
    );
  }
}
