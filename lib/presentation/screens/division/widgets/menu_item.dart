import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItem extends StatefulWidget {
  final String text;
  final bool isActive;
  //final IconData icon;
  final Function onPressed;

  const MenuItem({
    super.key,
    required this.text,
    required this.isActive,
    required this.onPressed,
  });

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      color: isHover
          ? Colors.white.withOpacity(0.1)
          : widget.isActive
              ? Colors.white.withOpacity(0.2)
              : Colors.transparent,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => widget.onPressed(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: MouseRegion(
              onEnter: (_) => setState(() => isHover = true),
              onExit: (_) => setState(() => isHover = false),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Icon(widget.icon , color: Colors.white.withOpacity(0.3)) ,
                  //const SizedBox(width: 10,) ,
                  Expanded(
                    child: Text(
                      widget.text,
                      softWrap: true,
                      style: GoogleFonts.kanit(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.8),
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
