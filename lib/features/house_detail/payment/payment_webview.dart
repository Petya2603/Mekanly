import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gen/gen.dart';

import '../../../localization/extensions.dart';

class PaymentWebViewScreen extends StatefulWidget {
  const PaymentWebViewScreen({super.key, required this.url});
  final String url;

  @override
  State<PaymentWebViewScreen> createState() => _PaymentWebViewScreenState();
}

class _PaymentWebViewScreenState extends State<PaymentWebViewScreen> {
  double _progress = 0;
  String? _pageTitle;
  String? _loadError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4D8BBF),
        title: Text(
          _pageTitle ?? context.translation.bank_toleg,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
          icon: Assets.icons.icBack.svg(
            color: Colors.white,
            package: 'gen',
            width: 25,
            height: 25,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(3),
          child: _progress < 1.0
              ? LinearProgressIndicator(
                  value: _progress,
                  backgroundColor: Colors.white24,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : const SizedBox.shrink(),
        ),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(widget.url)),
            onWebViewCreated: (controller) {},
            onLoadStart: (controller, url) {
              setState(() {
                _progress = 0;
                _loadError = null;
              });
            },
            onLoadStop: (controller, url) async {
              setState(() {
                _progress = 1.0;
              });

              final title = await controller.getTitle();
              setState(() {
                _pageTitle = title;
              });
            },
            onProgressChanged: (controller, progress) {
              setState(() {
                _progress = progress / 100;
              });
            },
            onLoadError: (controller, url, code, message) {
              setState(() {
                _loadError = message;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
            },
            onLoadHttpError: (controller, url, statusCode, description) {
              setState(() {
                _loadError = description;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(description)),
              );
            },
          ),
          if (_loadError != null)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Sayfa yüklenirken hata oluştu:\n$_loadError',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
