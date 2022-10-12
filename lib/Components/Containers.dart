import 'package:icollekt/Exports/Exports.dart';


class BottomContainer extends StatelessWidget {
  const BottomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
  height: 4,
  width: 80,
  decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xff1A1A1A)
  ),
),
SizedBox(height: 25),
      ],
    );
  }
}