import 'package:flutter/material.dart';
import 'package:super_home_member/screens/chat_with_us/chat_complain/chat_components/ComplainListScreen.dart';
import 'package:super_home_member/screens/chat_with_us/chat_complain/chat_components/ComplainScreen.dart';


class ChatWithUs extends StatelessWidget {
  const ChatWithUs({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              // builder: (context) =>  ComplainListScreen()
              builder: (context) => const ComplainScreen()
          ),
        );
      },
      child: Container(
        height: 50,
        width:  MediaQuery.of(context).size.width * 1,
          // margin: defaultPaddingEdge,
        decoration: BoxDecoration(
          color: Colors.blue[300],
          borderRadius: BorderRadius.circular(0),
        ),
          child: Center(child: Text( 'Chat With Us'.toUpperCase(),style: const TextStyle(fontSize: 15,
            fontWeight: FontWeight.bold,color: Colors.white,
            fontFamily: 'CeraProBol',
          ), ))
      ),
    );
  }
}
