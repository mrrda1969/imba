import 'package:flutter/material.dart';
import '../../core/errors/app_error.dart';

class AppErrorWidget extends StatelessWidget {
  final AppError error;
  final VoidCallback? onRetry;

  const AppErrorWidget({Key? key, required this.error, this.onRetry})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(_getErrorIcon(), size: 48, color: theme.colorScheme.error),
            const SizedBox(height: 16),
            Text(
              error.message,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
            if (error.code != null) ...[
              const SizedBox(height: 8),
              Text(
                'Error Code: ${error.code}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.error.withAlpha(179),
                ),
              ),
            ],
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.error,
                  foregroundColor: theme.colorScheme.onError,
                ),
                child: const Text('Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  IconData _getErrorIcon() {
    switch (error.runtimeType) {
      case NetworkError:
        return Icons.wifi_off;
      case AuthError:
        return Icons.lock_outline;
      case ValidationError:
        return Icons.error_outline;
      case ServerError:
        return Icons.dns_outlined;
      case CacheError:
        return Icons.storage_outlined;
      default:
        return Icons.error_outline;
    }
  }
}
