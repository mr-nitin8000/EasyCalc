import 'package:flutter/material.dart';

class DescApp extends StatefulWidget {
  const DescApp({super.key});

  @override
  State<DescApp> createState() => _DescAppState();
}

class _DescAppState extends State<DescApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
        appBar: AppBar(
          primary: true,
          automaticallyImplyLeading: true,
          title: Text("About EasyCalc"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('img/calc.gif'),
                    // image: AssetImage('img/cl.gif'),
                    fit: BoxFit.fitWidth)),
          ),
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              child:
              Center(
                child: Image.asset('img/alert.png',
                height: 60,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
              child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("About EasyCalc:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      )
                  )
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              child: Center(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("EasyCalc is a user-friendly and efficient calculator app that goes beyond basic arithmetic. Created by Nitin Kumawat, this app is designed to provide you with a hassle-free way to perform a wide range of calculations, from simple equations to more complex computations.",
                      style: TextStyle(
                        color: Colors.white
                      ),)
                  )
              ),
            ),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
              child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Key Features:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      )
                  )
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              child:  Padding(
                padding: const EdgeInsets.only(
                    left: 8.0
                ),
                      child: Text("🔢 Versatile Functions",
                      style: TextStyle(
                        color: Colors.white
                      ),
                      ),
                  )
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              child:  Padding(
                padding: const EdgeInsets.only(
                    left: 8.0
                ),
                      child: Text("🔒 Privacy",
                      style: TextStyle(
                        color: Colors.white
                      ),
                      ),
                  )
              ),


          //   why?

            Padding(
                padding: EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: 4,
                ),
                child:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Why EasyCalc?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    )
                )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              child: Center(
                  child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0
                      ),
                      child: Text("EasyCalc stands out as a versatile and trustworthy calculator app that covers both basic and advanced mathematical needs. TechEase Apps is dedicated to providing you with a tool that enhances your everyday calculations.",
                      style: TextStyle(
                        color: Colors.white
                      ),
                      )
                  )
              ),
            ),


            Padding(
              padding: EdgeInsets.only(
                  top: 4
              ),
              // child: Center(
              //   child: Image.asset('images/home.png',
              //     height: 80,
              //   ),
              // ),
            ),
            Padding(
                padding: EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: 4,
                ),
                child:  Center(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Stay Connected:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      )
                  ),
                )
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              child: Center(
                  child: Padding(
                      padding: const EdgeInsets.only(
                        left: 3.0
                      ),
                      child: Text("📧 Email: support@Mr.luckyy.com\n🌐 Website: www.Dummy.com\n📱 Social: @Mr.luckyyy____",
                      style: TextStyle(
                        color: Colors.white
                      ),
                      )
                  )
              ),
            ),




          //

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Center(
                child: Padding(
                        padding: const EdgeInsets.only(
                          top: 30,
                            left: 55.0,
                            right: 14.0,
                        ),
                        child: Center(child: Text("Download EasyCalc now and simplify your math tasks with this all-in-one calculator solution!",
                        style: TextStyle(
                          color: Colors.white
                        ),
                        ))
                    ),
              )
              ),
          ],
        )
    );;
  }
}
