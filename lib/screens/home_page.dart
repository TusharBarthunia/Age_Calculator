import 'package:age/age.dart';
import 'package:age_calculator/services/age_calculation.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime todayDate=DateTime.now();
  DateTime dob=DateTime(2000,1,1);
  AgeDuration ageDuration;
  AgeDuration nextBirthDate;
  int nextbdayWeekday;
  List<String> months=[
    "months",
    "January","February","March","April","May","June","July","August","September","October","November","december",

  ];

  List<String> weeks=["weeks","Monday","Tuesday","Wednesday","Thusday","Friday","Saturday","Sunday"];


  Future<Null> selectTodayDate(buildContext)async{
    final DateTime picked=await showDatePicker(
      context: context, 
      initialDate: todayDate, 
      firstDate: dob, 
      lastDate: DateTime(2101),);
      if(picked!=null && picked!=todayDate){
        setState(() {
          todayDate=picked;
          ageDuration = AgeCalculation().calculateAge(todayDate, dob);
          nextBirthDate= AgeCalculation().nextBirthday(todayDate, dob);
          nextbdayWeekday=AgeCalculation().nextbday(todayDate, dob);
        });
      }
  }

  Future<Null> selectDOBDate(buildContext)async{
    final DateTime picked=await showDatePicker(
      context: context, 
      initialDate: dob, 
      firstDate: DateTime(1900),
      lastDate: todayDate);
      if(picked!=null && picked!=todayDate){
        setState(() {
          dob=picked;
          ageDuration = AgeCalculation().calculateAge(todayDate, dob);
          nextBirthDate= AgeCalculation().nextBirthday(todayDate, dob);
          nextbdayWeekday=AgeCalculation().nextbday(todayDate, dob);
        });
      }
  }

  @override
  void initState() {
    super.initState();
    ageDuration = AgeCalculation().calculateAge(todayDate, dob);
    nextBirthDate= AgeCalculation().nextBirthday(todayDate, dob);
    nextbdayWeekday=AgeCalculation().nextbday(todayDate, dob);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children:[
              SizedBox(
                height:30,
                width:double.maxFinite,
              ),
              
              Text(
                "AGE CALCULATOR",style:TextStyle(
                color:Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w700 )),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today",style:TextStyle(
                    color:Colors.white,
                    fontWeight:FontWeight.w400,
                    fontSize:20),),
                    
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children:[
                    Text("${todayDate.day} ${months[todayDate.month]} ${todayDate.year}",style:TextStyle(
                      color: Colors.yellow,
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),
                  GestureDetector(
                    onTap: (){
                      selectTodayDate(context);
                    },
                                      child: Icon(
                      Icons.calendar_today,
                      color: Colors.white,),
                  )
                  ]
                ),
              )
              ],

            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date Of Birth",style:TextStyle(
                    color:Colors.white,
                    fontWeight:FontWeight.w400,
                    fontSize:20),),
                    
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children:[
                    Text("${dob.day} ${months[dob.month]} ${dob.year}",style:TextStyle(
                      color: Colors.yellow,
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),
                  GestureDetector(
                    onTap: (){
                      selectDOBDate(context);
                    },
                                      child: Icon(
                      Icons.calendar_today,
                      color: Colors.white,),
                  )
                  ]
                ),
              )
              
              ],

            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical:40,
              ),
              width: double.maxFinite,
              //height: 200,
              decoration: BoxDecoration(
                color:Colors.green,
                borderRadius:BorderRadius.circular(15)
              ),

              child: Column(
                children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      Container(
                        height: 200,
                        padding: EdgeInsets.symmetric(
                          vertical:20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Text("AGE",style:TextStyle(
                              color:Colors.white,
                              fontSize:18,
                              fontWeight:FontWeight.w700,
                            )),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children:[
                                Text("${ageDuration.years}",style:TextStyle(color: Colors.white,
                                fontSize: 70,
                                fontWeight: FontWeight.w700),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(bottom: 13),
                                  child: Text("Years",style: TextStyle(color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700),),
                                )
                              ]
                            ),
                            Row(
                              children: [
                                Text("${ageDuration.months} months | ${ageDuration.days} days",style: TextStyle(color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),)
                              ],

                            )
                          ]
                        ),
                      ),
                      Container(
                        height: 170,
                        width: 1,
                        color: Colors.pink,
                      ),
                      Container(
                        height: 200,
                        padding: EdgeInsets.symmetric(
                          vertical:20
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Text("NEXT BIRTHDAY",style:TextStyle(
                              color:Colors.white,
                              fontSize:18,
                              fontWeight:FontWeight.w700,
                            )),
                            Icon(Icons.cake,
                            color: Colors.white,
                            size: 40,),
                             Text("${weeks[nextbdayWeekday]}",style:TextStyle(
                              color:Colors.white,
                              fontSize:22,
                              fontWeight:FontWeight.w700,
                            )),
                            Text("${nextBirthDate.months} months | ${nextBirthDate.days} days",style: TextStyle(color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),)
                          ]
                        ),
                      )
                    ]
                  ),
                  Container(
                    height:1,
                    width:double.maxFinite,
                    color:Colors.pink,
                    margin:EdgeInsets.symmetric(
                      horizontal:15,
                    )
                      

                
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                      vertical: 20),
                    child: Text("SUMMARY",style:TextStyle(color:Colors.white,
                    fontSize:18,
                    fontWeight:FontWeight.w700,)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Column(
                          children: [
                            Text("YEARS",style: TextStyle(color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),),
                          SizedBox(
                            height:5
                          ),
                           Text("${ageDuration.years}",style: TextStyle(color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w400),),
                           
                          ],
                        ),
                        Column(
                          children: [
                            Text("MONTHS",style: TextStyle(color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),),
                          SizedBox(
                            height:5
                          ),
                           Text("${((ageDuration.months)*12)+(ageDuration.months)}",style: TextStyle(color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w400),),
                           
                          ],
                        ),
                        Column(
                          children: [
                            Text("WEEKS",style: TextStyle(color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),),
                          SizedBox(
                            height:5
                          ),
                           Text("${(todayDate.difference(dob).inDays/7).floor()}",style: TextStyle(color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w400),),
                           
                          ],
                        ),
                      ]
                    ),
                  ),
                  SizedBox(
                    height:20
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Column(
                          children: [
                            Text("DAYS",style: TextStyle(color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),),
                          SizedBox(
                            height:5
                          ),
                           Text("${todayDate.difference(dob).inDays}",style: TextStyle(color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),),
                           
                          ],
                        ),
                        Column(
                          children: [
                            Text("HOURS",style: TextStyle(color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),),
                          SizedBox(
                            height:5
                          ),
                           Text("${todayDate.difference(dob).inHours}",style: TextStyle(color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),),
                           
                          ],
                        ),
                        Column(
                          children: [
                            Text("MINUTES",style: TextStyle(color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),),
                          SizedBox(
                            height:5
                          ),
                           Text("${todayDate.difference(dob).inMinutes}",style: TextStyle(color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),),
                           
                          ],
                        ),
                      ]
                    ),
                  ),
                  
                ]
                
              ),
              
              
            ),
           
            ElevatedButton(onPressed: (){setState(() {
              todayDate=DateTime.now();
              dob=DateTime(2000,1,1);
              selectDOBDate(context);
            
            });}, child: Text("Reset"))
            ],
  
          ),
        ),
        )
        );
  }
}