import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'colors.dart'as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoinfo=[];
  bool _playArea = false;
  bool _isPlaying=false;
  bool _dispose=false;
  int _isPlayingIndex=-1;
  VideoPlayerController? _controller;
  _initData() async {
    String value = await DefaultAssetBundle.of(context)
        .loadString("assets/json/videoinfo.json");

    videoinfo = json.decode(value);

    setState(() {});

    if (videoinfo.isNotEmpty) {
      _initializeVideo(0);
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initData();
    });
  }
  @override
  void dispose(){
    _dispose=true;
    _controller?.pause();
    _controller?.dispose();
    _controller=null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _playArea==false? BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.AppColors.gradientFirst.withOpacity(0.9),
              color.AppColors.gradientSecond,
            ],
            begin: const FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          )
        ):BoxDecoration(
          color: color.AppColors.gradientSecond,
        ),
        child: Column(
          children: [
            _playArea==false? Container(
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
                      Expanded(child: Container()),
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
            ):Expanded(
              flex: 2,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    padding: const EdgeInsets.only(top: 50,right: 30,left: 30),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: Icon(Icons.arrow_back_ios,
                          size: 20,
                            color: color.AppColors.secondPageTopIconColor,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                            child: Container()),
                        Icon(Icons.info_outline,
                        size: 20,
                          color: color.AppColors.secondPageTopIconColor,
                        )
                      ],
                    ),
                  ),
                  Expanded(child: _playView(context)),
                  _controlView(context),
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
  String convertTwo(int value){
    return value < 10 ? "0$value" : "$value";
  }

  Widget _controlView(BuildContext context){
    final noMute = (_controller?.value?.volume??0)>0;
    final duration = _duration?.inSeconds ?? 0;
    final head = _position?.inSeconds?? 0;
    final remained = max(0, duration - head);
    final mins = convertTwo(remained ~/ 60.0);
    final secs = convertTwo(remained % 60);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.red[700],
              inactiveTrackColor: Colors.red[100],
              trackShape: const RoundedRectSliderTrackShape(),
              trackHeight: 2.0,

              thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: 12.0,
              ),
              thumbColor: Colors.redAccent,

              overlayColor: Colors.red.withOpacity(0.12),
              overlayShape: const RoundSliderOverlayShape(
                overlayRadius: 28.0,
              ),

              tickMarkShape: const RoundSliderTickMarkShape(),
              activeTickMarkColor: Colors.red[700],
              inactiveTickMarkColor: Colors.red[100],

              valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
              valueIndicatorColor: Colors.redAccent,
              valueIndicatorTextStyle: const TextStyle(
                color: Colors.white,
              ),
            ),
            child:Slider(
              value: max(0, min(_progress * 100, 100)),
              min: 0,
              max: 100,
              divisions: 100,
              label: _position == null
                  ? "00:00"
                  : _position.toString().split(".").first,
              onChanged: (value) {
                setState(() {
                  _progress = value * 0.01;
                });
              },
              onChangeStart: (value) {
                _controller?.pause();
              },
              onChangeEnd: (value) {
                final duration = _controller?.value.duration;
                if (duration != null) {
                  var newValue = max(0, min(value, 99)) * 0.01;
                  var millis =
                  (duration.inMilliseconds * newValue).toInt();
                  _controller?.seekTo(
                    Duration(milliseconds: millis),
                  );
                  _controller?.play();
                }
              },
            )
        ),
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(bottom: 5),
          color: color.AppColors.gradientSecond,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0, 0.0),
                          blurRadius: 4.0,
                          color:Color.fromARGB(50,0,0,0),
                        )
                      ]
                    ),
                    child: Icon(
                      noMute? Icons.volume_up:Icons.volume_off,
                    color: Colors.white,
                    ),
                  ),
                ),
                onTap: () {
                  if(noMute){
                    _controller?.setVolume(0);
                  }else{
                    _controller?.setVolume(1.0);
                  }
                  setState(() {
                  });
                },
              ),
              TextButton(
                  onPressed: ()async{
                    final index = _isPlayingIndex-1;
                    if (index >= 0 && index < videoinfo.length){
                      _initializeVideo(index);
                    }else{
                      Get.snackbar("Video List", "",
                          snackPosition: SnackPosition.BOTTOM,
                          icon: Icon(Icons.face,
                            size: 30,
                            color: Colors.white,
                          ),
                          backgroundColor: color.AppColors.gradientSecond,
                          colorText: Colors.white,
                          messageText: Text(
                            "No video ahead !",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          )
                      );
                    }
                  },
                  child: Icon(Icons.fast_rewind,
                  size: 36,
                    color: Colors.white,
                  )
              ),
              TextButton(
                onPressed: () {
                  if (_isPlaying) {
                    _controller?.pause();
                  } else {
                    _controller?.play();
                  }

                  setState(() {
                    _isPlaying = !_isPlaying;
                  });
                },
                  child: Icon(_isPlaying?Icons.pause: Icons.play_arrow,
                    size: 36,
                    color: Colors.white,
                  ),
              ),
              TextButton(
                  onPressed: ()async{
                    final index = _isPlayingIndex+1;
                    if(index<=videoinfo.length-1){
                      _initializeVideo(index);
                    }else{
                      Get.snackbar("Video List", "",
                      snackPosition: SnackPosition.BOTTOM,
                        icon: Icon(Icons.face,
                        size: 30,
                          color: Colors.white,
                        ),
                        backgroundColor: color.AppColors.gradientSecond,
                        colorText: Colors.white,
                        messageText: Text(
                          "You have finished all video. Congrats !",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )
                      );
                    }
                  },
                  child: Icon(Icons.fast_forward,
                    size: 36,
                    color: Colors.white,
                  )
              ),
              Text(
                "$mins:$secs",
                style: TextStyle(
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0.0,1.0),
                      blurRadius: 4.0,
                      color: Color.fromARGB(150,0,0,0),
                    )
                  ]
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;

    if (controller != null && controller.value.isInitialized) {
      return SizedBox(
        height: 220,
        width: double.infinity,
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ),
      );
    } else {
      return SizedBox(
        height: 220,
        width: double.infinity,
        child: const Center(
          child: Text(
            "Preparing...",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white60,
            ),
          ),
        ),
      );
    }
  }
  Duration? _duration;
  Duration? _position;
  var _progress = 0.0;
  var _onUpdateControllerTime;
  void _onControllerUpdate() async {
    if (_dispose) return;

    final controller = _controller;

    if (controller == null) return;

    if (!controller.value.isInitialized) return;

    _duration = controller.value.duration;

    final position = await controller.position;

    if (position == null) return;

    _position = position;

    _progress =
        position.inMilliseconds / _duration!.inMilliseconds;

    _isPlaying = controller.value.isPlaying;

    if (mounted) {
      setState(() {});
    }
  }

  _initializeVideo(int index) async {
    print("Index: $index");
    print("URL: ${videoinfo[index]["videoUrl"]}");

    final controller = VideoPlayerController.networkUrl(
      Uri.parse(videoinfo[index]["videoUrl"]),
    );

    final old = _controller;
    _controller = controller;

    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
      await old.dispose();
    }

    setState(() {});

    try {
      await controller.initialize();

      _duration = controller.value.duration;
      _position = Duration.zero;
      _progress = 0.0;

      controller.addListener(_onControllerUpdate);

      controller.play();

      setState(() {});
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      debugPrint(stackTrace.toString());
    }

    controller.addListener(_onControllerUpdate);

    setState(() {});

    controller.play();
  }
  _onTapVideo(int index){
    _initializeVideo(index);
  }
  _listView(){
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 8),
        itemCount: videoinfo.length,
        itemBuilder: (_,int index){
          return GestureDetector(
            onTap: (){
              _onTapVideo(index);
              debugPrint(index.toString());
              setState(() {
                if(_playArea==false){
                  _playArea=true;
                }
              });
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
