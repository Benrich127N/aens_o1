// shuffle_text.dart
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class ShuffleText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration duration; // how long one reveal cycle takes
  final Duration pause; // pause after full reveal before restarting
  final String chars; // characters used while scrambling
  final bool repeat;

  const ShuffleText({
    super.key,
    required this.text,
    this.style,
    this.duration = const Duration(seconds: 3),
    this.pause = const Duration(milliseconds: 800),
    this.chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#\$%^&*',
    this.repeat = true,
  });

  @override
  State<ShuffleText> createState() => _ShuffleTextState();
}

class _ShuffleTextState extends State<ShuffleText> {
  Timer? _timer;
  final Random _random = Random();
  String _display = '';
  int _revealed = 0;

  @override
  void initState() {
    super.initState();
    _startCycle();
  }

  void _startCycle() {
    _timer?.cancel();
    _revealed = 0;
    final total = widget.text.length;

    // update roughly at 60fps
    _timer = Timer.periodic(const Duration(milliseconds: 16), (t) {
      if (!mounted) return;

      // reveal progress based on time instead of step count
      final progress = t.tick * 16 / widget.duration.inMilliseconds;
      _revealed = (progress * total).clamp(0, total).toInt();

      setState(() {
        _display = _buildDisplay();
      });

      if (_revealed >= total) {
        t.cancel();
        Future.delayed(widget.pause, () {
          if (widget.repeat && mounted) {
            _startCycle();
          }
        });
      }
    });
  }

  String _buildDisplay() {
    final buffer = StringBuffer();
    for (var i = 0; i < widget.text.length; i++) {
      final ch = widget.text[i];
      // preserve spaces and newlines
      if (ch == ' ' || ch == '\n') {
        buffer.write(ch);
        continue;
      }

      if (i < _revealed) {
        buffer.write(ch);
      } else {
        buffer.write(widget.chars[_random.nextInt(widget.chars.length)]);
      }
    }
    return buffer.toString();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(_display, style: widget.style);
  }
}
