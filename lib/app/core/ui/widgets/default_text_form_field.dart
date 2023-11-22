import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final String _label;
  final IconData icon;
  final TextEditingController _controller;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  final Function(PointerDownEvent)? onTapOutSide;
  const DefaultTextFormField({
    Key? key,
    required String label,
    required TextEditingController controller,
    required this.icon,
    this.validator,
    this.textInputAction,
    this.onTapOutSide,
  })  : _label = label,
        _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              _label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: _controller,
          validator: validator,
          textInputAction: textInputAction,
          decoration: InputDecoration(
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
            prefixIcon: Icon(icon),
            fillColor: Colors.white,
            filled: true,
          ),
        ),
      ],
    );
  }
}
