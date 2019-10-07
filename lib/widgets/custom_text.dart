part of widget;

class CustomText extends StatelessWidget {

  final String text;
  final IconData prefixIcon;
  final Function onTap;

  CustomText({
    this.text,
    this.prefixIcon,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: primaryColor
            ),
            borderRadius: BorderRadius.all(Radius.circular(6.0))
        ),
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Icon(prefixIcon, color: primaryColor),
            Container(width: 10.0,),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: sizeBody1),
              ),
            )
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
