part of '../input_text_page.dart';

typedef EditInuptText = void Function()?;
typedef DeleteInuptText = void Function()?;

class InputTextItem extends StatelessWidget {
  final String label;
  final EditInuptText? editInuptText;
  final DeleteInuptText? deleteInuptText;
  const InputTextItem({
    super.key,
    required this.label,
    this.editInuptText,
    this.deleteInuptText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: editInuptText,
          icon: const Icon(
            Icons.edit,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: deleteInuptText,
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
            size: 30,
          ),
        ),
      ],
    );
  }
}
