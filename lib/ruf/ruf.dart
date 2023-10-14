import 'package:flutter/material.dart';

class Clean extends StatefulWidget {
  const Clean({Key? key}) : super(key: key);
  @override
  State<Clean> createState() => _CleanState();
}

class _CleanState extends State<Clean> {
  @override
  Widget build(BuildContext context) {

    return   Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                        child: Container(
                          height: 35,
                          alignment: Alignment.center,
                          decoration:  BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ), child: const SizedBox(
                          child: Text('',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,
                            color: Colors.black,fontStyle: FontStyle.normal,
                          )
                          ),
                        ),
                        )
                    ),
                  ],
                ),

                //// australia,sri lanka,india,pakistan,netherlands,south africa
                //// afghanistan,england,New zealand

                Container(
                  height: 50,
                  width:50,
                  decoration:  BoxDecoration(borderRadius: BorderRadius.circular(5),),
                  child:const Text("",style: TextStyle(color: Colors.cyan),
                  ),
                ),

                const Wrap(
                ),

                 const
                 SingleChildScrollView(
                  child: Column(children: [
                    Expanded(child:
                    SizedBox(
                      height: 100,
                      width: 200,
                      child:Text("",
                        style: TextStyle(
                        fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black,
                        fontStyle: FontStyle.normal
                      ),),
                    ))
                  ],
                  )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
