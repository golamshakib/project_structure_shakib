import 'package:flutter/material.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_sizes.dart';
import 'custom_text.dart';

class CustomTextButton extends StatefulWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onTap,
    this.textColor,
    this.textSize,
    this.fontWeight,
  });

  final String text;
  final Color? textColor;
  final double? textSize;
  final Function onTap;
  final FontWeight? fontWeight;

  @override
  State<CustomTextButton> createState() => _AppTextButtonState();
}

class _AppTextButtonState extends State<CustomTextButton> {
  late Color color;
  late double size;

  @override
  void initState() {
    super.initState();
    color = widget.textColor ?? AppColors.textPrimary;
    size = widget.textSize ?? getWidth(14);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: CustomText(
        text: widget.text,
        textColor: color,
        fontWeight: widget.fontWeight ?? FontWeight.w400,
        fontSize: size,
        maxLines: 1,
        textOverflow: TextOverflow.ellipsis,
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      color = AppColors.primary.withAlpha(150);
    });
  }

  void _onTapUp(TapUpDetails details) {
    Future.delayed(const Duration(milliseconds: 150)).then((value) {
      setState(() {
        color = widget.textColor ?? AppColors.textPrimary;
        size = widget.textSize ?? getWidth(14);
      });
    });
  }
}
