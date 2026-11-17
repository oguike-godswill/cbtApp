import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class TutorBottomSheet extends StatefulWidget {
  const TutorBottomSheet({
    super.key,
    required this.contextTitle,
    required this.contextBody,
    this.backendUrl,
  });

  final String contextTitle;
  final String contextBody;
  final String? backendUrl;

  @override
  State<TutorBottomSheet> createState() => _TutorBottomSheetState();
}

class _TutorBottomSheetState extends State<TutorBottomSheet> {
  final TextEditingController _controller = TextEditingController();
  final List<(String role, String text)> _messages = [];
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _messages.add((
      'tutor',
      'Ask me anything about **${widget.contextTitle}** — e.g. "Show me a faster JAMB shortcut" or "Explain step 2 more simply".',
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static const String _envBaseUrl =
      String.fromEnvironment('API_BASE_URL', defaultValue: '');

  String get _resolvedBackendUrl {
    if (widget.backendUrl != null) return widget.backendUrl!;
    if (_envBaseUrl.isNotEmpty) return _envBaseUrl;
    if (kIsWeb) {
      final host = Uri.base.host;
      if (host == 'localhost' || host == '127.0.0.1') {
        return 'http://localhost:3000';
      }
      return Uri.base.origin;
    }
    return 'http://10.0.2.2:3000';
  }

  Future<void> _send(String prompt) async {
    final trimmed = prompt.trim();
    if (trimmed.isEmpty || _loading) return;

    setState(() {
      _messages.add(('user', trimmed));
      _loading = true;
    });
    _controller.clear();

    try {
      final dio = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 15),
      ));
      final resp = await dio.post(
        '$_resolvedBackendUrl/api/tutor/explain',
        data: {
          'title': widget.contextTitle,
          'context': widget.contextBody,
          'question': trimmed,
        },
      );
      final reply = (resp.data is Map && resp.data['answer'] != null)
          ? resp.data['answer'].toString()
          : resp.data.toString();
      if (mounted) {
        setState(() {
          _messages.add(('tutor', reply));
          _loading = false;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _messages.add((
            'tutor',
            'Offline Mode Active: The live Gemini AI Tutor requires an active internet connection and the NaijaPrep backend proxy ($_resolvedBackendUrl). Meanwhile, use the "Simple / Formal" toggle, worked steps, and distractor notes — they work 100% offline!',
          ));
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.72,
      minChildSize: 0.45,
      maxChildSize: 0.92,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: context.naija.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: context.naija.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
                child: Row(
                  children: [
                    Icon(Icons.auto_awesome, color: context.naija.emerald, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'AI Tutor · ${widget.contextTitle}',
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Row(
                  children: [
                    for (final quick in const [
                      'Explain simply',
                      'Give a JAMB shortcut',
                      'Why are other options wrong?',
                    ]) ...[
                      ActionChip(
                        label: Text(quick),
                        onPressed: _loading ? null : () => _send(quick),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: _messages.length + (_loading ? 1 : 0),
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (context, idx) {
                    if (idx == _messages.length) {
                      return Row(
                        children: [
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: context.naija.emerald,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text('Thinking...', style: Theme.of(context).textTheme.bodySmall),
                        ],
                      );
                    }
                    final (role, text) = _messages[idx];
                    final isUser = role == 'user';
                    return Align(
                      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.82,
                        ),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isUser ? context.naija.emeraldSoft : context.naija.canvas,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isUser ? context.naija.emerald : context.naija.border,
                          ),
                        ),
                        child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  12,
                  8,
                  12,
                  12 + MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        textInputAction: TextInputAction.send,
                        onSubmitted: _send,
                        decoration: InputDecoration(
                          hintText: 'Ask a follow-up question...',
                          filled: true,
                          fillColor: context.naija.canvas,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: context.naija.border),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    FilledButton(
                      onPressed: _loading ? null : () => _send(_controller.text),
                      style: FilledButton.styleFrom(
                        backgroundColor: context.naija.emerald,
                        minimumSize: const Size(48, 48),
                      ),
                      child: const Icon(Icons.send, size: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
