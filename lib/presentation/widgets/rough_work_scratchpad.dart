import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class ScratchStroke {
  ScratchStroke({required this.points, required this.color});
  final List<Offset> points;
  final Color color;
}

class RoughWorkScratchpad extends StatefulWidget {
  const RoughWorkScratchpad({
    super.key,
    required this.onClose,
    this.scopeKey,
  });

  final VoidCallback onClose;
  final String? scopeKey;

  @override
  State<RoughWorkScratchpad> createState() => _RoughWorkScratchpadState();
}

class _RoughWorkScratchpadState extends State<RoughWorkScratchpad> {
  final List<ScratchStroke> _strokes = [];
  int _selectedColorIndex = 0;

  @override
  void didUpdateWidget(covariant RoughWorkScratchpad oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.scopeKey != widget.scopeKey) {
      _strokes.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = [
      context.naija.ink,
      context.naija.emerald,
      context.naija.coral,
    ];
    final activeColor = palette[_selectedColorIndex];

    return Container(
      decoration: BoxDecoration(
        color: context.naija.surface.withValues(alpha: 0.90),
        border: Border.all(color: context.naija.emerald, width: 1.5),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: context.naija.canvas.withValues(alpha: 0.92),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              border: Border(bottom: BorderSide(color: context.naija.border)),
            ),
            child: Row(
              children: [
                Icon(Icons.draw_outlined, size: 18, color: context.naija.emerald),
                const SizedBox(width: 6),
                Text(
                  'Rough-Work Scratchpad',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.naija.ink,
                      ),
                ),
                const Spacer(),
                for (var i = 0; i < palette.length; i++)
                  GestureDetector(
                    onTap: () => setState(() => _selectedColorIndex = i),
                    child: Container(
                      width: 22,
                      height: 22,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: palette[i],
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _selectedColorIndex == i
                              ? context.naija.emerald
                              : Colors.transparent,
                          width: 2.5,
                        ),
                      ),
                    ),
                  ),
                IconButton(
                  tooltip: 'Undo',
                  onPressed: _strokes.isEmpty
                      ? null
                      : () => setState(() => _strokes.removeLast()),
                  icon: const Icon(Icons.undo, size: 18),
                  visualDensity: VisualDensity.compact,
                ),
                IconButton(
                  tooltip: 'Clear',
                  onPressed: _strokes.isEmpty
                      ? null
                      : () => setState(() => _strokes.clear()),
                  icon: const Icon(Icons.delete_outline, size: 18),
                  visualDensity: VisualDensity.compact,
                ),
                IconButton(
                  tooltip: 'Close Scratchpad',
                  onPressed: widget.onClose,
                  icon: const Icon(Icons.close, size: 18),
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onPanStart: (details) {
                setState(() {
                  _strokes.add(
                    ScratchStroke(
                      points: [details.localPosition],
                      color: activeColor,
                    ),
                  );
                });
              },
              onPanUpdate: (details) {
                if (_strokes.isEmpty) return;
                setState(() {
                  _strokes.last.points.add(details.localPosition);
                });
              },
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(12)),
                child: CustomPaint(
                  painter: _ScratchpadPainter(
                    strokes: _strokes,
                    gridColor: context.naija.border.withValues(alpha: 0.45),
                  ),
                  size: Size.infinite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScratchpadPainter extends CustomPainter {
  _ScratchpadPainter({required this.strokes, required this.gridColor});

  final List<ScratchStroke> strokes;
  final Color gridColor;

  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = gridColor
      ..strokeWidth = 0.8;

    const step = 24.0;
    for (var x = step; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }
    for (var y = step; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    for (final stroke in strokes) {
      final paint = Paint()
        ..color = stroke.color
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..strokeWidth = 2.6
        ..style = PaintingStyle.stroke;

      if (stroke.points.length == 1) {
        canvas.drawCircle(stroke.points.first, 1.5, paint..style = PaintingStyle.fill);
        continue;
      }

      final path = Path()..moveTo(stroke.points.first.dx, stroke.points.first.dy);
      for (var i = 1; i < stroke.points.length; i++) {
        path.lineTo(stroke.points[i].dx, stroke.points[i].dy);
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ScratchpadPainter oldDelegate) => true;
}
