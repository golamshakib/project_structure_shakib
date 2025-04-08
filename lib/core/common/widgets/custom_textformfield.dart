import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_sizes.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? suffixIcon;
  final String? prefixIconPath;
  final ValueChanged<String>? onChanged;
  final bool readonly;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final int? maxLines;
  final InputBorder? focusedBorder;
  final Color? containerColor;
  final Color? hintTextColor;  // Color for hint text
  final double? hintTextSize;  // Font size for hint text
  final String? suffixText;    // Text for suffix
  final TextStyle? suffixTextStyle; // Style for suffix text
  final String? Function(String?)? validator; // Nullable validator function

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.readonly = false,
    this.prefixIconPath,
    this.maxLines = 1,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatters,
    this.border = InputBorder.none,
    this.enabledBorder = InputBorder.none,
    this.focusedBorder = InputBorder.none,
    this.containerColor = const Color(0xffF9FAFB),
    this.hintTextColor = AppColors.textSecondary, // Default color
    this.hintTextSize = 15, // Default font size
    this.suffixText,  // Nullable suffix text
    this.suffixTextStyle, // Nullable suffix text style
    this.validator, // Nullable validator function
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: getHeight(10)),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextFormField(
        controller: controller,
        readOnly: readonly,
        obscureText: obscureText,
        maxLines: maxLines,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        style: GoogleFonts.poppins(
            fontSize: getWidth(16),
            fontWeight: FontWeight.w400,
            color: AppColors.textPrimary),
        validator: validator, // Use the passed validator function here
        autovalidateMode:AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          prefixIcon: prefixIconPath != null
              ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: getWidth(20)),
              Image.asset(
                prefixIconPath!,
                height: getHeight(26),
                width: getWidth(26),
              ),
              SizedBox(width: getWidth(10)),
            ],
          )
              : null,
          suffixIcon: suffixIcon,
          suffixText: suffixText, // Dynamic suffixText
          suffixStyle: suffixTextStyle ??
              GoogleFonts.poppins(
                fontSize: getWidth(12), // Default size for the suffix text
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary, // Default color for the suffix text
              ),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: getWidth(hintTextSize ?? 15), // Use dynamic size, default to 15
            fontWeight: FontWeight.w400,
            color: hintTextColor ?? AppColors.textSecondary, // Use dynamic color, default to textSecondary
          ),
          border: border,
          focusedBorder: focusedBorder,
          focusedErrorBorder: focusedBorder,
          enabledBorder: enabledBorder,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        ),
      ),
    );
  }
}
