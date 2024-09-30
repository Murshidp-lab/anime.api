import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled9/repository/model%20class/anime%20model.dart';
import 'package:untitled9/ui/second.dart';

import '../Bloc/anime_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> name = ["HORROR", "MYSTERY", "THRILLER"];

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<AnimeBloc>(context).add(fetchAnimeEvent());
  }

  late Animemodel Anime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: (Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w, top: 10.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.menu,
                      size: 30.sp,
                    ),
                    SizedBox(
                      width: 110.w,
                    ),
                    Text(
                      'FilmKu',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF110E47),
                        fontSize: 16.sp,
                        fontFamily: 'Merriweather',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                    ),
                    Icon(
                      Icons.notifications_none,
                      size: 30.sp,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 50.h),
                child: Row(
                  children: [
                    Text(
                      'Now Showing',
                      style: TextStyle(
                        color: Color(0xFF110E46),
                        fontSize: 18.sp,
                        fontFamily: 'Merriweather',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      width: 120.w,
                    ),
                    Container(
                      width: 70.w,
                      height: 25.h,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 1.w, color: Color(0xFFE5E4EA)),
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'See more',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFFAAA8B0),
                            fontSize: 10.sp,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 20.h),
                child: SizedBox(
                  height: 300.h,
                  child: BlocBuilder<AnimeBloc, AnimeState>(
                    builder: (context, state) {
                      if (state is Animeloading) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (state is Animeerror) {
                        return RefreshIndicator(
                            child: Center(child: Text("somthinge is wrong")),
                            onRefresh: () async {
                              return BlocProvider.of<AnimeBloc>(context)
                                  .add(fetchAnimeEvent());
                            });
                      }
                      if (state is Animeloaded) {
                        Anime = BlocProvider.of<AnimeBloc>(context).animemodel;
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: Anime.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Second(image: Anime.data![index].image.toString(), title: Anime.data![index].title.toString(), generes: Anime.data![index].genres!, description: Anime.data![index].synopsis!.toString())));},
                              child: Container(
                                height: 100.h,
                                width: 200.w,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 200.w,
                                      height: 200.h,
                                      color: Colors.white,
                                      child: Image.network(
                                          fit: BoxFit.cover,
                                          Anime.data![index].image.toString()),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 20.w),
                                      child: Text(
                                        Anime.data![index].title.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.sp,
                                          fontFamily: 'Muli',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 50.w, top: 10.h),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          Text(
                                            '9.1/10 IMDb',
                                            style: TextStyle(
                                              color: Color(0xFF9B9B9B),
                                              fontSize: 12.sp,
                                              fontFamily: 'Muli',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 10.w,
                            );
                          },
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Row(
                  children: [
                    Text(
                      'Popular',
                      style: TextStyle(
                        color: Color(0xFF110E47),
                        fontSize: 16.sp,
                        fontFamily: 'Merriweather',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: Container(
                        width: 61.w,
                        height: 21.h,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.w, color: Color(0xFFE5E4EA)),
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'See more',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFFAAA8B0),
                              fontSize: 10.sp,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 300.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: BlocBuilder<AnimeBloc, AnimeState>(
                    builder: (context, state) {
                      if (state is Animeloading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is Animeerror) {
                        return RefreshIndicator(
                            child: Center(child: Text("somthing is wrong")),
                            onRefresh: () async {
                              return BlocProvider.of<AnimeBloc>(context)
                                  .add(fetchAnimeEvent());
                            });
                      }
                      if (state is Animeloaded) {
                        Anime = BlocProvider.of<AnimeBloc>(context).animemodel;
                        return ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemCount: Anime.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder:(_)=>Second(image: Anime.data![index].image.toString(), title: Anime.data![index].title.toString(), generes: Anime.data![index].genres!, description: Anime.data![index].synopsis!.toString())));},
                              child: Container(
                                height: 130.h,
                                width: double.infinity,
                                color: Colors.white,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 130.h,
                                      width: 110.w,
                                      child: Image.network(
                                          fit: BoxFit.cover,
                                          Anime.data![index].image.toString()),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 50.h,
                                          width: 210.w,
                                          child: Text(
                                            Anime.data![index].title.toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.sp,
                                              fontFamily: 'Muli',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            Text(
                                              '6.4/10 IMDb',
                                              style: TextStyle(
                                                color: Color(0xFF9B9B9B),
                                                fontSize: 12.sp,
                                                fontFamily: 'Muli',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                          width: 200.w,
                                          child: ListView.separated(
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                Anime.data![index].genres!.length,
                                            itemBuilder: (BuildContext context,
                                                int position) {
                                              return Container(
                                                height: 20.h,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFFDBE3FF),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.r),
                                                  ),
                                                ),
                                                child: Center(
                                                    child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 8.w),
                                                  child: Text(Anime.data![index]
                                                      .genres![position]
                                                      .toString()),
                                                )),
                                              );
                                            },
                                            separatorBuilder:
                                                (BuildContext context,
                                                    int index) {
                                              return SizedBox(
                                                width: 10,
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.access_time_sharp),
                                            Text(
                                              '1h 47m',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.sp,
                                                fontFamily: 'Muli',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 10.w,
                            );
                          },
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
