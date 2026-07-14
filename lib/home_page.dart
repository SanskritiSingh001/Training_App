import 'package:flutter/material.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                Icon(Icons.arrow_forward,
                  size: 20,
                  color: color.AppColors.homePageIcons,
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
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    margin: const EdgeInsets.only(left: 150,top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You are doing great",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: color.AppColors.homePageDetail,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "keep it up",
                          style: TextStyle(
                            fontSize: 16,
                            color: color.AppColors.homePagePlanColor,
                          ),
                        ),
                        Text(
                          "stick to your plan",
                          style: TextStyle(
                            fontSize: 16,
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

          ],
        ),
      ),
    );
  }
}
