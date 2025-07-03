import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class OfflineBanner extends StatefulWidget {
  final Widget child;

  const OfflineBanner({
    super.key,
    required this.child,
  });

  @override
  State<OfflineBanner> createState() => _OfflineBannerState();
}

class _OfflineBannerState extends State<OfflineBanner> {
  bool _isOffline = false;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _initializeConnectivity();
  }

  Future<void> _initializeConnectivity() async {
    final results = await _connectivity.checkConnectivity();
    _updateConnectivityStatus(results);

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      _updateConnectivityStatus(results);
    });
  }

  void _updateConnectivityStatus(List<ConnectivityResult> results) {
    setState(() {
      _isOffline = !results.any(
        (result) =>
            result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile ||
            result == ConnectivityResult.ethernet,
      );
    });
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (_isOffline)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(12),
              color: Colors.red[100],
              child: Row(
                children: [
                  const Icon(Icons.wifi_off, color: Colors.red),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'No internet connection. Some features may not work.',
                      style: TextStyle(color: Colors.red[800]),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
