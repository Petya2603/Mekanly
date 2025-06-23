import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';

import '../../core/components/app_text.dart';
import '../../product/constants/constants.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  static const routePath = '/contactUs-view';
  static const routeName = 'contactUs-view';


  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];
  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF4D8BBF),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Assets.icons.icBackImage.svg(package: 'gen'),
        ),
        title: AppText.s14w400BdM(
          'Administrator',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontFamily: StringConstants.roboto,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(
            _messages.length,
            (index) => Messages(message: _messages[index],),
          ),
        ),
      ),
      bottomNavigationBar: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Siziň hatyňyz',
          hintStyle: TextStyle(
            color: const Color(0xFF6A6A6A),
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            fontFamily: StringConstants.roboto,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4).r,
            borderSide: const BorderSide(
              color: Color(0xFFF6F6F6),
            ),
          ),
          filled: true,
          fillColor: const Color(0xFFF6F6F6),
          suffixIcon: IconButton(
            onPressed: _sendMessage,
            icon: Assets.icons.icMessageSend.svg(package: 'gen'),
          ),
        ),
        onSubmitted: (_) => _sendMessage(),
      ),
    );
  }
}

class Messages extends StatefulWidget {
  const Messages({super.key, required this.message});
  final String message;

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child: AnimatedContainer(
          duration: const Duration(
            milliseconds: 300,
          ),
          color: Colors.white,
          child: InkWell(
            onTap: () {
              setState(() {
                isTapped = !isTapped;
              });
            },
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (isTapped)
                  AppText.s14w400BdM(
                    '10.05.2025, 17:17',
                    color: Colors.black,
                    fontFamily: StringConstants.roboto,
                    fontWeight: FontWeight.w400,
                    fontSize: 8.sp,
                  )
                else
                  Container(),
                Padding(
                  padding: const EdgeInsets.only(top: 4).h,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(12).r,
                        topRight: const Radius.circular(12).r,
                        bottomLeft: const Radius.circular(12).r,
                      ),
                      color: const Color(0xFF3A8BCF),
                    ),
                    child: AppText.s14w400BdM(
                      widget.message,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: StringConstants.roboto,
                      color: Colors.white,
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
