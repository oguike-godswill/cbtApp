import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import '../../core/theme/app_theme.dart';

class MathMarkdownView extends StatelessWidget {
  const MathMarkdownView({
    super.key,
    required this.content,
    this.textStyle,
  });

  final String content;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final baseStyle = textStyle ?? Theme.of(context).textTheme.bodyMedium!;
    final lines = content.split('\n');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final line in lines) ...[
          _buildLine(context, line, baseStyle),
          if (line != lines.last) const SizedBox(height: 6),
        ],
      ],
    );
  }

  Widget _buildLine(BuildContext context, String line, TextStyle baseStyle) {
    final trimmed = line.trim();
    if (trimmed.isEmpty) return const SizedBox(height: 2);

    if (trimmed.startsWith('### ')) {
      return Text(
        trimmed.substring(4),
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: context.naija.ink,
            ),
      );
    }

    if (trimmed.startsWith('- ')) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 6, right: 8),
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: context.naija.emerald,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Expanded(child: _buildInlineSpans(context, trimmed.substring(2), baseStyle)),
        ],
      );
    }

    return _buildInlineSpans(context, trimmed, baseStyle);
  }

  Widget _buildInlineSpans(
    BuildContext context,
    String text,
    TextStyle baseStyle,
  ) {
    final segments = _splitMathAndBold(text);
    final spans = <InlineSpan>[];

    for (final seg in segments) {
      if (seg.isMath) {
        spans.add(
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Math.tex(
                seg.text,
                textStyle: baseStyle.copyWith(fontSize: (baseStyle.fontSize ?? 14) + 1),
                onErrorFallback: (err) => Text(
                  seg.text,
                  style: baseStyle.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        );
      } else {
        spans.add(
          TextSpan(
            text: seg.text,
            style: seg.isBold
                ? baseStyle.copyWith(fontWeight: FontWeight.w700)
                : baseStyle,
          ),
        );
      }
    }

    return RichText(text: TextSpan(style: baseStyle, children: spans));
  }

  List<_TextSegment> _splitMathAndBold(String input) {
    final result = <_TextSegment>[];
    final mathRegex = RegExp(r'\$(.+?)\$');
    var lastEnd = 0;

    for (final match in mathRegex.allMatches(input)) {
      if (match.start > lastEnd) {
        _appendFormattedText(result, input.substring(lastEnd, match.start));
      }
      result.add(_TextSegment(text: match.group(1)!, isMath: true));
      lastEnd = match.end;
    }

    if (lastEnd < input.length) {
      _appendFormattedText(result, input.substring(lastEnd));
    }
    return result;
  }

  void _appendFormattedText(List<_TextSegment> out, String chunk) {
    final boldRegex = RegExp(r'\*\*(.+?)\*\*');
    var last = 0;
    for (final m in boldRegex.allMatches(chunk)) {
      if (m.start > last) {
        out.add(_TextSegment(text: chunk.substring(last, m.start)));
      }
      out.add(_TextSegment(text: m.group(1)!, isBold: true));
      last = m.end;
    }
    if (last < chunk.length) {
      out.add(_TextSegment(text: chunk.substring(last)));
    }
  }
}

class _TextSegment {
  const _TextSegment({
    required this.text,
    this.isMath = false,
    this.isBold = false,
  });

  final String text;
  final bool isMath;
  final bool isBold;
}
