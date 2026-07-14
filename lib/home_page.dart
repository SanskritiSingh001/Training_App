import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/video_info.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info=[];
  _initData() async {
    String value =
    await DefaultAssetBundle.of(context).loadString("assets/json/info.json");

    print(value); // Should print the entire JSON

    setState(() {
      info = json.decode(value);
    });

    print(info.length); // Should print 5 (or however many items you have)
  }
  
  @override
  void initState(){
    super.initState();
    _initData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColors.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top:70,left: 30,right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Training",
                  style: TextStyle(
                    fontSize: 30,
                    color: color.AppColors.homePageTitle,
                  ),
                ),
                Expanded(child: Container()),
                Icon(Icons.arrow_back_ios,
                size: 20,
                  color: color.AppColors.homePageIcons,
                ),
                SizedBox(width: 10,),
                Icon(Icons.calendar_today_outlined,
                size: 20,),
                SizedBox(width: 10,),
                Icon(Icons.arrow_forward_ios,
                  size: 20,
                  color: color.AppColors.homePageIcons,
                ),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Text(
                  "Your program",
                  style: TextStyle(
                    fontSize: 25,
                    color: color.AppColors.homePageSubtitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 25,
                    color: color.AppColors.homePageDetail,
                  ),
                ),
                SizedBox(width: 5,),
                InkWell(
                  onTap: (){
                    Get.to(()=>VideoInfo());
                  },
                  child: Icon(Icons.arrow_forward,
                    size: 20,
                    color: color.AppColors.homePageIcons,
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      color.AppColors.gradientSecond.withOpacity(0.9),
                      color.AppColors.gradientFirst.withOpacity(0.8),
                    ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(80),
                ),
                boxShadow:[
                  BoxShadow(
                      offset: Offset(5, 10),
                      blurRadius: 10,
                      color: color.AppColors.gradientSecond.withOpacity(0.3)
                  )
                ]
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20,top: 25,right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Next workout",
                      style: TextStyle(
                        fontSize: 16,
                        color: color.AppColors.homePageContainerTextSmall,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      "Legs Toning",
                      style: TextStyle(
                        fontSize: 25,
                        color: color.AppColors.homePageContainerTextSmall,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      "and Glutes Workout",
                      style: TextStyle(
                        fontSize: 25,
                        color: color.AppColors.homePageContainerTextSmall,
                      ),
                    ),
                    SizedBox(height: 25,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.timer,size: 20,color: color.AppColors.homePageContainerTextSmall,),
                            SizedBox(width: 10,),
                            Text(
                              "60 min",
                              style: TextStyle(
                                fontSize: 14,
                                color: color.AppColors.homePageContainerTextSmall,
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            boxShadow: [
                              BoxShadow(
                                color: color.AppColors.gradientFirst,
                                blurRadius: 10,
                                offset: Offset(4, 8),
                              )
                            ]
                          ),
                          child: Icon(Icons.play_circle_fill,
                            color: Colors.white,size: 60,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),

            ),
            SizedBox(height: 5,),
            Container(
              height: 180,
              margin: const EdgeInsets.only(top: 30),
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:AssetImage(
                            "assets/image/images.jpg",
                          ),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 40,
                          offset: Offset(8, 10),
                          color: color.AppColors.gradientSecond.withOpacity(0.3),
                        ),
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(-1, -5),
                          color: color.AppColors.gradientSecond.withOpacity(0.3),
                        )
                      ]
                    ),
                  ),
                  Positioned(
                    left: 170,
                    top: 35,
                    right: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You are doing great",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: color.AppColors.homePageDetail,
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          "keep it up",
                          style: TextStyle(
                            fontSize: 14,
                            color: color.AppColors.homePagePlanColor,
                          ),
                        ),
                        Text(
                          "stick to your plan",
                          style: TextStyle(
                            fontSize: 14,
                            color: color.AppColors.homePagePlanColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "Area of focus",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: color.AppColors.homePageTitle,
                  ),
                )
              ],
            ),
            Expanded(
                child: OverflowBox(
                  maxWidth: MediaQuery.of(context).size.width,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                        itemCount: (info.length / 2).ceil(),
                        itemBuilder: (_,i){
                          int a = 2*i;//0,2
                          int b = 2*i + 1;//1,3
                          return Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(bottom: 5),
                                width: (MediaQuery.of(context).size.width-90)/2,
                                height: 170,
                                margin: EdgeInsets.only(left:30,bottom: 15,top: 15),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          info[a]['img']
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        offset: Offset(5, 5),
                                        color: color.AppColors.gradientSecond.withOpacity(0.1),
                                      ),
                                      BoxShadow(
                                        blurRadius: 3,
                                        offset: Offset(-5,-5),
                                        color: color.AppColors.gradientSecond.withOpacity(0.1),
                                      )
                                    ]
                                ),
                                child: Center(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      info[a]["title"],
                                    ),
                                  ),
                                ),
                              ),
                              if (b < info.length)
                                Container(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  width: (MediaQuery.of(context).size.width-90)/2,
                                  height: 170,
                                  margin: EdgeInsets.only(left:30,bottom: 15,top: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            info[b]['img']
                                        ),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3,
                                          offset: Offset(5, 5),
                                          color: color.AppColors.gradientSecond.withOpacity(0.1),
                                        ),
                                        BoxShadow(
                                          blurRadius: 3,
                                          offset: Offset(-5,-5),
                                          color: color.AppColors.gradientSecond.withOpacity(0.1),
                                        )
                                      ]
                                  ),
                                  child: Center(
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        info[b]["title"],
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        }
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
