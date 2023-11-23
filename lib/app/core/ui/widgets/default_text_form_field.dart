import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final String? labelText;
  final TextEditingController _controller;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final FloatingLabelBehavior? floatingLabelBehavior;
  const DefaultTextFormField({
    super.key,
    required TextEditingController controller,
    this.label,
    this.labelText,
    this.icon,
    this.validator,
    this.textInputAction,
    this.onFieldSubmitted,
    this.focusNode,
    this.floatingLabelBehavior,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: label != null
                ? Text(
                    label!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                : null,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          focusNode: focusNode,
          controller: _controller,
          validator: validator,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            label: Text(labelText ?? ""),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white),
            ),
            prefixIcon: icon != null ? Icon(icon) : null,
            fillColor: Colors.white,
            filled: true,
            floatingLabelBehavior: floatingLabelBehavior,
          ),
        ),
      ],
    );
  }
}
