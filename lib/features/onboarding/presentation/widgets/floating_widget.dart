import 'package:flutter/material.dart';

class FloatingWidget extends StatefulWidget {
  final Widget child; // الحاجه اللي هنخليها تطفو
  final Duration delay; // تأخير بسيط عشان الكروت متتحركش في نفس اللحظة بالظبط (بتدي واقعية)

  const FloatingWidget({super.key, required this.child, this.delay = Duration.zero});

  @override
  State<FloatingWidget> createState() => _FloatingWidgetState();
}

class _FloatingWidgetState extends State<FloatingWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // الموتور بيشتغل لمدة ثانيتين ذهاب وعودة
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    
    // الحركة هتكون من سالب 6 بيكسل لموجب 6 بيكسل (فوق وتحت)
    _animation = Tween<double>(begin: -6, end: 6).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // بنشغل الأنيميشن يكرر نفسه للأبد بعد وقت التأخير اللي حددناه
    Future.delayed(widget.delay, () {
      if (mounted) _controller.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        // Transform.translate هي اللي بتزق الويدجت من مكانها
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: widget.child,
        );
      },
    );
  }
}