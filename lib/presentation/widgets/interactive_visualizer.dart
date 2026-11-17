import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class InteractiveVisualizer extends StatefulWidget {
  const InteractiveVisualizer({
    super.key,
    required this.simConfig,
  });

  final Map<String, dynamic> simConfig;

  @override
  State<InteractiveVisualizer> createState() => _InteractiveVisualizerState();
}

class _InteractiveVisualizerState extends State<InteractiveVisualizer> {
  late double _p1;
  late double _p2;
  late double _p3;

  @override
  void initState() {
    super.initState();
    final type = widget.simConfig['type'] as String? ?? 'quadratic_parabola';
    if (type == 'unit_circle') {
      _p1 = (widget.simConfig['angle'] as num?)?.toDouble() ?? 45.0;
      _p2 = 0;
      _p3 = 0;
    } else if (type == 'linear_inequality') {
      _p1 = (widget.simConfig['k'] as num?)?.toDouble() ?? 2.0;
      _p2 = 0;
      _p3 = 0;
    } else if (type == 'supply_demand') {
      _p1 = (widget.simConfig['demandShift'] as num?)?.toDouble() ?? 0.0;
      _p2 = (widget.simConfig['supplyShift'] as num?)?.toDouble() ?? 0.0;
      _p3 = 0;
    } else {
      _p1 = (widget.simConfig['a'] as num?)?.toDouble() ?? 1.0;
      _p2 = (widget.simConfig['b'] as num?)?.toDouble() ?? -3.0;
      _p3 = (widget.simConfig['c'] as num?)?.toDouble() ?? 2.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final type = widget.simConfig['type'] as String? ?? 'quadratic_parabola';
    final title = widget.simConfig['title'] as String? ?? 'Interactive Visualizer';

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: context.naija.canvas,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.naija.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.tune, size: 16, color: context.naija.emerald),
              const SizedBox(width: 6),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 190,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: context.naija.surface,
                child: CustomPaint(
                  painter: _buildPainter(context, type),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          ..._buildControls(context, type),
        ],
      ),
    );
  }

  CustomPainter _buildPainter(BuildContext context, String type) {
    final colors = context.naija;
    return switch (type) {
      'unit_circle' => _UnitCirclePainter(angleDeg: _p1, colors: colors),
      'linear_inequality' => _InequalityPainter(k: _p1, colors: colors),
      'supply_demand' => _SupplyDemandPainter(
          demandShift: _p1,
          supplyShift: _p2,
          colors: colors,
        ),
      _ => _ParabolaPainter(a: _p1, b: _p2, c: _p3, colors: colors),
    };
  }

  List<Widget> _buildControls(BuildContext context, String type) {
    if (type == 'unit_circle') {
      final rad = _p1 * math.pi / 180.0;
      return [
        Text(
          'θ = ${_p1.toStringAsFixed(0)}°  ·  sin(θ) = ${math.sin(rad).toStringAsFixed(2)}  ·  cos(θ) = ${math.cos(rad).toStringAsFixed(2)}',
          style: Theme.of(context).textTheme.bodySmall?.merge(AppTheme.monoTabular),
        ),
        Slider(
          value: _p1,
          min: 0,
          max: 360,
          divisions: 72,
          activeColor: context.naija.emerald,
          onChanged: (v) => setState(() => _p1 = v),
        ),
      ];
    }

    if (type == 'linear_inequality') {
      return [
        Text(
          'Solution region: x ≥ ${_p1.toStringAsFixed(1)}',
          style: Theme.of(context).textTheme.bodySmall?.merge(AppTheme.monoTabular),
        ),
        Slider(
          value: _p1,
          min: -5,
          max: 5,
          divisions: 20,
          activeColor: context.naija.emerald,
          onChanged: (v) => setState(() => _p1 = v),
        ),
      ];
    }

    if (type == 'supply_demand') {
      final pStar = (5.0 + (_p1 - _p2) * 0.5).clamp(1.0, 9.0);
      final qStar = (5.0 + (_p1 + _p2) * 0.5).clamp(1.0, 9.0);
      return [
        Text(
          'Equilibrium P* = ${pStar.toStringAsFixed(1)}  ·  Q* = ${qStar.toStringAsFixed(1)}',
          style: Theme.of(context).textTheme.bodySmall?.merge(AppTheme.monoTabular),
        ),
        _sliderRow(context, 'Demand Shift', _p1, -2.5, 2.5, (v) => setState(() => _p1 = v)),
        _sliderRow(context, 'Supply Shift', _p2, -2.5, 2.5, (v) => setState(() => _p2 = v)),
      ];
    }

    final disc = _p2 * _p2 - 4 * _p1 * _p3;
    final rootText = _p1.abs() < 0.1
        ? 'Linear (a ≈ 0)'
        : disc < 0
            ? 'No real roots (Δ < 0)'
            : disc == 0
                ? 'Equal root x = ${(-_p2 / (2 * _p1)).toStringAsFixed(2)}'
                : 'Roots: ${((-_p2 - math.sqrt(disc)) / (2 * _p1)).toStringAsFixed(2)}, ${((-_p2 + math.sqrt(disc)) / (2 * _p1)).toStringAsFixed(2)}';

    return [
      Text(
        'y = ${_p1.toStringAsFixed(1)}x² + ${_p2.toStringAsFixed(1)}x + ${_p3.toStringAsFixed(1)}  ·  $rootText',
        style: Theme.of(context).textTheme.bodySmall?.merge(AppTheme.monoTabular),
      ),
      _sliderRow(context, 'a', _p1, -2.5, 2.5, (v) => setState(() => _p1 = v)),
      _sliderRow(context, 'b', _p2, -6, 6, (v) => setState(() => _p2 = v)),
      _sliderRow(context, 'c', _p3, -5, 5, (v) => setState(() => _p3 = v)),
    ];
  }

  Widget _sliderRow(
    BuildContext context,
    String label,
    double val,
    double min,
    double max,
    ValueChanged<double> onChanged,
  ) {
    return Row(
      children: [
        SizedBox(
          width: 84,
          child: Text(
            '$label: ${val.toStringAsFixed(1)}',
            style: Theme.of(context).textTheme.bodySmall?.merge(AppTheme.monoTabular),
          ),
        ),
        Expanded(
          child: Slider(
            value: val.clamp(min, max),
            min: min,
            max: max,
            activeColor: context.naija.emerald,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

class _ParabolaPainter extends CustomPainter {
  _ParabolaPainter({
    required this.a,
    required this.b,
    required this.c,
    required this.colors,
  });

  final double a;
  final double b;
  final double c;
  final NaijaColors colors;

  @override
  void paint(Canvas canvas, Size size) {
    final axisPaint = Paint()
      ..color = colors.border
      ..strokeWidth = 1.2;

    final cx = size.width / 2;
    final cy = size.height / 2;
    canvas.drawLine(Offset(0, cy), Offset(size.width, cy), axisPaint);
    canvas.drawLine(Offset(cx, 0), Offset(cx, size.height), axisPaint);

    const scaleX = 24.0;
    const scaleY = 16.0;

    final curvePaint = Paint()
      ..color = colors.emerald
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;

    final path = Path();
    var started = false;
    for (var px = 0.0; px <= size.width; px += 2) {
      final x = (px - cx) / scaleX;
      final y = a * x * x + b * x + c;
      final py = cy - y * scaleY;
      if (!started) {
        path.moveTo(px, py);
        started = true;
      } else {
        path.lineTo(px, py);
      }
    }
    canvas.drawPath(path, curvePaint);

    if (a.abs() >= 0.1) {
      final disc = b * b - 4 * a * c;
      if (disc >= 0) {
        final r1 = (-b - math.sqrt(disc)) / (2 * a);
        final r2 = (-b + math.sqrt(disc)) / (2 * a);
        final dotPaint = Paint()..color = colors.coral;
        canvas.drawCircle(Offset(cx + r1 * scaleX, cy), 4.5, dotPaint);
        canvas.drawCircle(Offset(cx + r2 * scaleX, cy), 4.5, dotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _ParabolaPainter oldDelegate) =>
      oldDelegate.a != a || oldDelegate.b != b || oldDelegate.c != c;
}

class _UnitCirclePainter extends CustomPainter {
  _UnitCirclePainter({required this.angleDeg, required this.colors});
  final double angleDeg;
  final NaijaColors colors;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) * 0.36;

    final axisPaint = Paint()
      ..color = colors.border
      ..strokeWidth = 1.2;
    canvas.drawLine(Offset(0, center.dy), Offset(size.width, center.dy), axisPaint);
    canvas.drawLine(Offset(center.dx, 0), Offset(center.dx, size.height), axisPaint);

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = colors.mutedInk.withValues(alpha: 0.4)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );

    final rad = angleDeg * math.pi / 180.0;
    final pt = Offset(
      center.dx + radius * math.cos(rad),
      center.dy - radius * math.sin(rad),
    );

    canvas.drawLine(
      center,
      Offset(pt.dx, center.dy),
      Paint()
        ..color = colors.amber
        ..strokeWidth = 2.5,
    );
    canvas.drawLine(
      Offset(pt.dx, center.dy),
      pt,
      Paint()
        ..color = colors.emerald
        ..strokeWidth = 2.5,
    );
    canvas.drawLine(
      center,
      pt,
      Paint()
        ..color = colors.ink
        ..strokeWidth = 2.0,
    );
    canvas.drawCircle(pt, 5, Paint()..color = colors.emerald);
  }

  @override
  bool shouldRepaint(covariant _UnitCirclePainter oldDelegate) =>
      oldDelegate.angleDeg != angleDeg;
}

class _InequalityPainter extends CustomPainter {
  _InequalityPainter({required this.k, required this.colors});
  final double k;
  final NaijaColors colors;

  @override
  void paint(Canvas canvas, Size size) {
    final y = size.height / 2;
    final linePaint = Paint()
      ..color = colors.mutedInk
      ..strokeWidth = 1.8;
    canvas.drawLine(Offset(20, y), Offset(size.width - 20, y), linePaint);

    final usableW = size.width - 40;
    final kx = 20 + ((k + 6) / 12) * usableW;

    for (var tick = -5; tick <= 5; tick++) {
      final tx = 20 + ((tick + 6) / 12) * usableW;
      canvas.drawLine(Offset(tx, y - 6), Offset(tx, y + 6), linePaint);
    }

    canvas.drawLine(
      Offset(kx, y - 10),
      Offset(size.width - 20, y - 10),
      Paint()
        ..color = colors.emerald
        ..strokeWidth = 4,
    );
    canvas.drawCircle(
      Offset(kx, y - 10),
      6,
      Paint()..color = colors.emerald,
    );
  }

  @override
  bool shouldRepaint(covariant _InequalityPainter oldDelegate) => oldDelegate.k != k;
}

class _SupplyDemandPainter extends CustomPainter {
  _SupplyDemandPainter({
    required this.demandShift,
    required this.supplyShift,
    required this.colors,
  });

  final double demandShift;
  final double supplyShift;
  final NaijaColors colors;

  @override
  void paint(Canvas canvas, Size size) {
    final axisPaint = Paint()
      ..color = colors.mutedInk
      ..strokeWidth = 1.4;
    const pad = 24.0;
    canvas.drawLine(Offset(pad, pad), Offset(pad, size.height - pad), axisPaint);
    canvas.drawLine(
      Offset(pad, size.height - pad),
      Offset(size.width - pad, size.height - pad),
      axisPaint,
    );

    final w = size.width - 2 * pad;
    final h = size.height - 2 * pad;
    final dShiftPx = demandShift * 14;
    final sShiftPx = supplyShift * 14;

    canvas.drawLine(
      Offset(pad + 10 + dShiftPx, pad + 10),
      Offset(pad + w - 10 + dShiftPx, pad + h - 10),
      Paint()
        ..color = colors.coral
        ..strokeWidth = 2.5,
    );

    canvas.drawLine(
      Offset(pad + 10 + sShiftPx, pad + h - 10),
      Offset(pad + w - 10 + sShiftPx, pad + 10),
      Paint()
        ..color = colors.emerald
        ..strokeWidth = 2.5,
    );
  }

  @override
  bool shouldRepaint(covariant _SupplyDemandPainter oldDelegate) =>
      oldDelegate.demandShift != demandShift || oldDelegate.supplyShift != supplyShift;
}
