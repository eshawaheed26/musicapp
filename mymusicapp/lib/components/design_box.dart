import 'package:flutter/material.dart';
// import 'package:mymusicapp/themes/theme.provider.dart';
// import 'package:provider/provider.dart';

class DesignBox extends StatelessWidget {
  final Widget? child;
  const DesignBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.8,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 170, 122, 160),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 180, 127, 196),
                blurRadius: 15,
                offset: Offset(4, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(12),
          child: child,
        ),
      ),
    );
  }
}
