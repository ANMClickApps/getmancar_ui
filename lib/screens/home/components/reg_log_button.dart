import 'package:flutter/material.dart';
import 'package:getmancar_ui/style/colors_style.dart';

class RegLogButton extends StatelessWidget {
  const RegLogButton({
    Key? key,
    required this.backgroundColor,
    this.alignmentLeft = true,
    this.alignmentLeftColumn = true,
    required this.title,
    required this.subTitle,
    required this.textColor,
    required this.onTap,
  }) : super(key: key);

  final Color backgroundColor;
  final bool alignmentLeft;
  final bool alignmentLeftColumn;
  final String title;
  final String subTitle;
  final Color textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          const BoxConstraints(minWidth: double.infinity, maxHeight: 64.0),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.0),
        child: InkWell(
          onTap: onTap,
          child: alignmentLeft
              ? Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      decoration: const BoxDecoration(
                          color: BrandColor.primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(80.0),
                          )),
                    ),
                    _buildText()
                  ],
                )
              : _buildText(),
        ),
      ),
    );
  }

  Padding _buildText() {
    return Padding(
      padding: alignmentLeft
          ? const EdgeInsets.only(left: 16.0, top: 8.0)
          : const EdgeInsets.only(right: 16.0, top: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: alignmentLeftColumn
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            subTitle,
            style: TextStyle(
              color: textColor,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
