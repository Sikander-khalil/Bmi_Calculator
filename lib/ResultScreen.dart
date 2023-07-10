import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultScreen extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultScreen({super.key, required this.bmiResult, required this.resultText, required this.interpretation});



  @override
  Widget build(BuildContext context) {
    return SafeArea(

        child: Scaffold(


          appBar: AppBar(
            iconTheme: IconThemeData(
                color: Colors.white
            ),

            title: const Text("BMI CALCULATOR",style: TextStyle(color: Colors.white),),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
          ),

      body: Padding(padding: EdgeInsets.all(16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[

            Text(
              'Your Result',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold,color: Colors.black87),

            ),
            SizedBox(height: 26.h,),

            Container(
              width: 328.w,
              height: 481.h,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(14.sp),
              ),
              child:   Padding(
                padding:  const EdgeInsets.all(28.0),
                child:  Column(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children:   [

                    ResultText(

                      title: resultText,
                      fonSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,),
                    ResultText(

                      title: bmiResult,
                      fonSize: 96,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,),

                    ResultText(

                      title: interpretation,
                      fonSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,),



                  ],
                ),
              ),
            ),


          ],
        ),


      )
    ));
  }
}

class ResultText extends StatelessWidget {

  final String title;
  final double fonSize;
  final Color color;
  final FontWeight fontWeight;

  const ResultText({
    super.key, required this.title, required this.fonSize, required this.color, required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(title,
      textAlign: TextAlign.center,
      style: TextStyle(

      fontSize: fonSize.sp,
      fontWeight: fontWeight,
      color: color
    ),
    );
  }
}
