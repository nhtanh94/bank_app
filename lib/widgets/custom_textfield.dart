part of widget;

class CustomTextField extends StatelessWidget {

  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final String labelText;
  final IconData prefixIcon;
  final Function(String text) onSubmitted;
  final bool obscureText;

  CustomTextField({
    @required this.controller,
    @required this.focusNode,
    this.textInputAction,
    this.labelText,
    @required this.prefixIcon,
    this.onSubmitted,
    this.obscureText = false
  }):assert(obscureText != null);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputAction??TextInputAction.done,
      decoration: InputDecoration(
          labelText: labelText??"",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          prefixIcon: Icon(prefixIcon, color: primaryColor,),
          contentPadding: EdgeInsets.all(0.0)),
      style: TextStyle(fontSize: sizeBody1),
      onSubmitted: onSubmitted,
      obscureText: obscureText,
      keyboardType: TextInputType.multiline,
      maxLines: null,
    );
  }
}
