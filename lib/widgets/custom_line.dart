part of widget;

class CustomLine extends StatelessWidget {

  final bool isVertical;

  CustomLine({
    this.isVertical = true
  }):assert(isVertical != null);

  @override
  Widget build(BuildContext context) {
    return isVertical?Container(
      height: 1.0,
      color: Colors.grey.withOpacity(0.5),
    ):Container(
      width: 1.0,
      color: Colors.grey.withOpacity(0.5),
    );
  }
}
