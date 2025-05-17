import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final IconData prefixIcon;
  final bool suffixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon = false,
    required this.controller,
    required this.validator,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = widget.obscureText;
  }

  void toggleVisibility() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.prefixIcon,
          color: Theme.of(context).colorScheme.primary,
        ),
        suffixIcon: widget.suffixIcon
            ? InkWell(
                onTap: toggleVisibility,
                child: Icon(
                  isObscure ? Icons.visibility_off : Icons.visibility,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            : null,
        labelText: widget.labelText,
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.outline),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1.0, // Adjust the width as necessary
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context)
                .colorScheme
                .primary, // Keep the same color when focused
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}
