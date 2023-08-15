import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz/UI/shared/utils.dart';

class CustomProfilelField extends StatelessWidget {
  const CustomProfilelField(
      {Key? key,
        required this.text,
        required this.color,
        required this.svgName,
        this.svgColor,
        required this.lineColor, required this.onPressed}
      ) : super(key: key);

  final String text;
  final Color color;
  final String svgName;
  final Color? svgColor;
  final Color lineColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: screenWidth(20)),
      child: InkWell(
        onTap: (){onPressed();},
        child: Row(
          children: [
            Container(
              width: screenWidth(150),
              height: screenWidth(8),
              color: lineColor,
            ),
            SizedBox(width: screenWidth(30),),
            Text(text , style: TextStyle(fontSize: screenWidth(25) , color: color),),
            Spacer(),
            SvgPicture.asset('assets/images/$svgName.svg' , color: svgColor,),
          ],
        ),
      ),
    );
  }
}
