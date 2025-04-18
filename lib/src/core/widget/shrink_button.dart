import 'package:flutter/physics.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class ShrinkButtonConfig {
  static double? scaleMinValue;
  static Curve? scaleCurve;
  static double? opacityMinValue;
  static Curve? opacityCurve;
  static Duration? duration;
}

class UiShrinkButton extends StatefulWidget {
  final Function()? onPressed;
  final Function()? onLongPress;
  final Widget? child;
  final Duration? duration;
  final double? scaleMinValue;
  final Curve? scaleCurve;
  final Curve? opacityCurve;
  final double? opacityMinValue;
  final bool enableFeedback;

  const UiShrinkButton({
    super.key,
    this.enableFeedback = true,
    this.onPressed,
    this.onLongPress,
    required this.child,
    this.duration,
    this.scaleMinValue,
    this.opacityMinValue,
    this.scaleCurve,
    this.opacityCurve,
  });

  @override
  State<UiShrinkButton> createState() => _UiShrinkButtonState();
}

class _UiShrinkButtonState extends State<UiShrinkButton>
    with SingleTickerProviderStateMixin {
  static final double _defaultScaleMinValue = 0.95;
  static final double _defaultOpacityMinValue = 0.90;
  final Curve _defaultScaleCurve = CurveSpring();
  static final Curve _defaultOpacityCurve = Curves.ease;
  static final Duration _defaultDuration = Duration(milliseconds: 300);

  late AnimationController _animationController;
  late Animation<double> _scale;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this);
    _scale = Tween<double>(begin: 1.0, end: 1.0).animate(_animationController);
    _opacity = Tween<double>(
      begin: 1.0,
      end: 1.0,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> anim({double? scale, double? opacity, Duration? duration}) {
    _animationController.stop();
    _animationController.duration = duration ?? Duration.zero;

    _scale = Tween<double>(begin: _scale.value, end: scale).animate(
      CurvedAnimation(
        curve:
            widget.scaleCurve ??
            ShrinkButtonConfig.scaleCurve ??
            _defaultScaleCurve,
        parent: _animationController,
      ),
    );
    _opacity = Tween<double>(begin: _opacity.value, end: opacity).animate(
      CurvedAnimation(
        curve:
            widget.opacityCurve ??
            ShrinkButtonConfig.opacityCurve ??
            _defaultOpacityCurve,
        parent: _animationController,
      ),
    );
    _animationController.reset();
    return _animationController.forward();
  }

  Future<void> _onTapDown(_) {
    return anim(
      scale:
          widget.scaleMinValue ??
          ShrinkButtonConfig.scaleMinValue ??
          _defaultScaleMinValue,
      opacity:
          widget.opacityMinValue ??
          ShrinkButtonConfig.opacityMinValue ??
          _defaultOpacityMinValue,
      duration:
          widget.duration ?? ShrinkButtonConfig.duration ?? _defaultDuration,
    );
  }

  Future<void> _onTapUp(_) {
    return anim(
      scale: 1.0,
      opacity: 1.0,
      duration:
          widget.duration ?? ShrinkButtonConfig.duration ?? _defaultDuration,
    );
  }

  Future<void> _onTapCancel(value) {
    return _onTapUp(value);
  }

  @override
  Widget build(BuildContext context) {
    final bool isTapEnabled =
        widget.onPressed != null || widget.onLongPress != null;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, Widget? child) {
        return Opacity(
          opacity: _opacity.value,
          child: Transform.scale(
            alignment: Alignment.center,
            scale: _scale.value,
            child: child,
          ),
        );
      },
      child: Listener(
        onPointerDown: isTapEnabled ? _onTapDown : null,
        onPointerCancel: _onTapCancel,
        onPointerUp: _onTapUp,
        child: GestureDetector(
          onTap:
              isTapEnabled
                  ? () {
                    if (widget.enableFeedback) {
                      SystemSound.play(SystemSoundType.click);
                    }
                    widget.onPressed?.call();
                  }
                  : null,
          onLongPress: isTapEnabled ? widget.onLongPress : null,
          child: widget.child,
        ),
      ),
    );
  }
}

class CurveSpring extends Curve {
  final SpringSimulation sim;

  CurveSpring() : sim = _sim(70, 20);

  @override
  double transform(double t) => sim.x(t) + t * (1 - sim.x(1.0));
}

_sim(double stiffness, double damping) => SpringSimulation(
  SpringDescription.withDampingRatio(mass: 1, stiffness: stiffness, ratio: 0.7),
  0.0,
  1.0,
  0.0,
);
