import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends ConsumerWidget {
  final GoException? _goException;

  const ErrorPage({
    super.key,
    GoException? goException,
  }) : _goException = goException;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Text(_goException?.message ?? 'N/A Error'),
      ),
    );
  }
}
