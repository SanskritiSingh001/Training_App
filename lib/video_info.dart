import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'colors.dart'as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoinfo=[];

  _initData() async {
    String value =
    await DefaultAssetBundle.of(context).loadString("assets/json/videoinfo.json");

    print(value); // Should print the entire JSON

    setState(() {
      videoinfo = json.decode(value);
    });

    print(videoinfo.length); // Should print 5 (or however many items you have)
  }

  @override
  void initState(){
    super.initState();
    _initData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.AppColors.gradientFirst.withOpacity(0.9),
              color.AppColors.gradientSecond,
            ],
            begin: const FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          )
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 70,left: 30,right: 30),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Container()),
                      InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back_ios,size: 20,
                        color: color.AppColors.secondPageTopIconColor,
                        ),
                      ),
                      SizedBox(width: 290),
                      Icon(Icons.info_outline,size: 20,
                        color: color.AppColors.secondPageTopIconColor,
                      )
                    ],
                  ),
                  SizedBox(height: 30,),
                  Text(
                    "Legs Toning",
                    style: TextStyle(
                      fontSize: 25,
                      color: color.AppColors.secondPageTitleColor
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    "and Glutes Workout",
                    style: TextStyle(
                      fontSize: 25,
                      color: color.AppColors.secondPageTitleColor
                    ),
                  ),
                  SizedBox(height: 50,),
                  Row(
                    children: [
                      Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              color.AppColors.secondPageContainerGradient1stColor,
                              color.AppColors.secondPageContainerGradient2ndColor,
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.timer,size: 20,
                            color: color.AppColors.secondPageIconColor,),
                            SizedBox(width: 5,),
                            Text(
                              "68 min",
                              style:  TextStyle(
                                fontSize: 16,
                                color: color.AppColors.secondPageIconColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  color.AppColors.secondPageContainerGradient1stColor,
                                  color.AppColors.secondPageContainerGradient2ndColor,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.handyman_outlined,size: 20,
                                color: color.AppColors.secondPageIconColor,),
                              SizedBox(width: 5,),
                              Flexible(
                                child: Text(
                                  "Resistent band , kettebell",
                                  overflow: TextOverflow.ellipsis,
                                  style:  TextStyle(
                                    fontSize: 16,
                                    color: color.AppColors.secondPageIconColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            Expanded(child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(70)),
              ),
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      SizedBox(width: 30,),
                      Text(
                        "Circuit 1: Legs Toning",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: color.AppColors.circuitsColor,
                        ),
                      ),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          Icon(Icons.loop,size: 30,color: color.AppColors.loopColor,),
                          SizedBox(width: 10,),
                          Text(
                            "3 sets",
                            style: TextStyle(
                              fontSize: 15,
                              color: color.AppColors.setsColor,
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 20,),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Expanded(child: _listView()),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
  _listView(){
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 8),
        itemCount: videoinfo.length,
        itemBuilder: (_,int index){
          return GestureDetector(
            onTap: (){
              debugPrint(index.toString());
            },
            child: _buildCard(index),
          );
        });
  }
  _buildCard(int index){
    return Container(
      height: 135,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(
                            videoinfo[index]["thumbnail"]
                        ),
                        fit: BoxFit.cover
                    )
                ),
              ),
              SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoinfo[index]["title"],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Text(
                      videoinfo[index]["time"],
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 18,),
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0xFFeaeefc),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "15s rest",
                    style: TextStyle(
                      color: Color(0xFF839fed),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  for(int i=0; i<70; i++)
                    i.isEven?Container(
                      width: 3,
                      height: 1,
                      decoration: BoxDecoration(
                          color: Color(0xFF839fed),
                          borderRadius: BorderRadius.circular(2)
                      ),
                    ):Container(
                      width: 3,
                      height: 1,
                      color: Colors.white,
                    ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
