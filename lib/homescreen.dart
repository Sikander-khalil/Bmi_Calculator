import 'package:bmi_calculator/bmi_calc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ResultScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int age = 15;
  int weight = 75;
  int height = 150;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        drawer:  Drawer(
          backgroundColor: Colors.white,
        ),

        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.white
          ),


          backgroundColor: Theme.of(context).primaryColor,

          title: const Text("BMI Calculator",
            style: TextStyle(color: Colors.white),

          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){




            }, icon: const Icon(Icons.more_vert,color: Colors.white,))
          ],


        ),
        body: Padding(

          padding: EdgeInsets.symmetric(horizontal: 16.0.sp, vertical: 24.0.sp),
          child: Column(



           // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text("Check Your Body Mass Index (BMI) to know if you are in shape",style: TextStyle(fontSize: 16.0.sp),
              textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0.h,),
           Row(

             mainAxisAlignment: MainAxisAlignment.spaceBetween,

             children: [

               BmiCard(title: 'Age', value: age.toString(), label: 'YRS',
               width: 156,
               height: 215,
               child: Row(

                 mainAxisAlignment: MainAxisAlignment.spaceAround,


                 children: [

                   RawMaterialButton(onPressed: () {

                     setState(() {
                       age--;
                     });



                   },
                     shape: RoundedRectangleBorder(

                       borderRadius: BorderRadius.circular(8.0.sp),

                     ),
                     fillColor: Colors.white,
                     constraints: BoxConstraints.tightFor(

                       height: 46.0.h,
                       width: 46.0.w,

                     ),
                     elevation: 6,
                     child: Icon(Icons.remove,
                       size: 30.0.sp,
                       color: Theme.of(context).primaryColor,


                     ),


                   ),

                   RawMaterialButton(onPressed: () {

                     setState(() {
                       age++;
                     });

                   },
                     shape: RoundedRectangleBorder(

                       borderRadius: BorderRadius.circular(8.0.sp),

                     ),
                     fillColor: Colors.white,
                     constraints: BoxConstraints.tightFor(

                       height: 46.0.h,
                       width: 46.0.w,

                     ),
                     elevation: 6,
                     child: Icon(Icons.add,
                       size: 30.0.sp,
                       color: Theme.of(context).primaryColor,


                     ),


                   ),




                 ],
               ),

               ),

               BmiCard(
                 width: 156,
                 height: 215,
                 title: 'Weight', value: weight.toString(), label: 'KG',
               child: Row(

                 mainAxisAlignment: MainAxisAlignment.spaceAround,


                 children: [

                   RawMaterialButton(onPressed: () {
                     setState(() {
                       weight--;
                     });


                   },
                     shape: RoundedRectangleBorder(

                       borderRadius: BorderRadius.circular(8.0.sp),

                     ),
                     fillColor: Colors.white,
                     constraints: BoxConstraints.tightFor(

                       height: 46.0.h,
                       width: 46.0.w,

                     ),
                     elevation: 6,
                     child: Icon(Icons.remove,
                       size: 30.0.sp,
                       color: Theme.of(context).primaryColor,


                     ),


                   ),

                   RawMaterialButton(onPressed: () {
                     setState(() {
                       weight++;
                     });


                   },
                     shape: RoundedRectangleBorder(

                       borderRadius: BorderRadius.circular(8.0.sp),

                     ),
                     fillColor: Colors.white,
                     constraints: BoxConstraints.tightFor(

                       height: 46.0.h,
                       width: 46.0.w,

                     ),
                     elevation: 6,
                     child: Icon(Icons.add,
                       size: 30.0.sp,
                       color: Theme.of(context).primaryColor,


                     ),


                   ),




                 ],
               ),

               ),
             ],
           ),
              SizedBox(height: 32.h,),
              BmiCard(
                width: double.infinity,
                height: 215,

                title: 'Height',
                value: height.toString(),
                label: 'CM',
                child: Slider(

                  min: 100.0,
                  max: 200.0,
                  value: height.toDouble(),
                  activeColor: Colors.white,
                  inactiveColor: Colors.white.withOpacity(0.45),
                  onChanged: (newValue){

                  setState(() {
                    height = newValue.toInt();
                  });

                  },


                ),

              ),
              SizedBox(height: 43.h,),
              const Text("Tap the button below to check your bmi result"),
           const Spacer(),
              SizedBox(width: double.infinity, height: 50.h, child: ElevatedButton(

                onPressed: (){
                  
                  Navigator.push(context, MaterialPageRoute(builder: (context) {

                    BMICalculator bmiCalculator = BMICalculator(height: height, weight: weight);

                    return ResultScreen(
                        bmiResult: bmiCalculator.calculateBMI(),
                        resultText: bmiCalculator.getResult(),
                        interpretation: bmiCalculator.getInterpretation()
                    );
                  }));


                },
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  onPrimary: Colors.white
                ),
                child: Text("Calculate",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.0.sp),),

              ),)

            ],
          ),
        ),




      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  final String title;
  final String value;
  final Widget child;
  final String label;
  final double width;
  final double height;

  const BmiCard({
    super.key, required this.title, required this.value, required this.child, required this.label, required this.width, required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w, height: height.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0.sp),
      color: Theme.of(context).primaryColor,
    ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(title,

            style: TextStyle(fontSize: 16.0.sp,
                color: Colors.white,

                fontWeight: FontWeight.w600),

          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(value,

                style: TextStyle(fontSize: 36.0.sp,
                    color: Colors.white,

                    fontWeight: FontWeight.w600),

              ),
              SizedBox(width: 5.w
                ,),
              Text(label,style: TextStyle(fontSize: 36.0.sp,
                  color: Colors.white,

                  fontWeight: FontWeight.w600),)
            ],
          ),
      child,
        ],
      ),

    );
  }
}
