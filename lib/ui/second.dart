import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Second extends StatefulWidget {
  final String image;
  final String title;
  final List<dynamic> generes;
  final String description;

  const Second({super.key, required this.image, required this.title, required this.generes, required this.description});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {

  List<String> name = ["HORROR", "MYSTERY", "THRILLER"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: (Column(
          children: [
            Stack(children: [
              Container(height: 250.h,width: double.infinity,
                  child: Image.network(widget.image,fit: BoxFit.cover,)),
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 20.w),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 30.sp,
                          color: Colors.white,
                        )),
                    SizedBox(
                      width: 260.w,
                    ),
                    Icon(
                      Icons.menu,
                      size: 30.sp,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ]),
            Container(
              width: 375.w,
              height: 440.h,
              decoration: ShapeDecoration(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10.w, top: 10.h),
                child: Row(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(height: 100.h,width: 250.w,
                                child: Text(
                                  widget.title,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontFamily: 'Muli',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 50.w,
                              ),
                              Icon(
                                Icons.bookmark_border,
                                size: 30.sp,
                                color: Colors.white,
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 240.w, top: 10.h),
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
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 90.w, top: 20.h),
                            child: SizedBox(
                              height: 20.h,
                              width: 250.w,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount:widget.generes.length ,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    height: 20.h,
                                    width: 70.w,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFDBE3FF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                      ),
                                    ),
                                    child: Center(child: Text( widget.generes[index].toString()
                                    )),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    width: 10,
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 100.w, top: 20.h),
                            child: Row(
                              children: [
                                Text(
                                  'Length',
                                  style: TextStyle(
                                    color: Color(0xFF9B9B9B),
                                    fontSize: 12.sp,
                                    fontFamily: 'Muli',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  width: 40.w,
                                ),
                                Text(
                                  'Language',
                                  style: TextStyle(
                                    color: Color(0xFF9B9B9B),
                                    fontSize: 12.sp,
                                    fontFamily: 'Muli',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  width: 40.w,
                                ),
                                Text(
                                  'Rating',
                                  style: TextStyle(
                                    color: Color(0xFF9B9B9B),
                                    fontSize: 12.sp,
                                    fontFamily: 'Muli',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 100.w),
                            child: Row(
                              children: [
                                Text(
                                  '2h 28min',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontFamily: 'Muli',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                                Text(
                                  'English',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontFamily: 'Muli',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 50.w,
                                ),
                                Text(
                                  'PG-13',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontFamily: 'Muli',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 230.w, top: 20.h),
                            child: Text(
                              'Description',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontFamily: 'Merriweather',
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(right: 40.w),
                            child: SizedBox(height: 70.h,width: 300.w,
                              child: Text(
                                widget.description,
                                style: TextStyle(
                                  color: Color(0xFF9B9B9B),
                                  fontSize: 12.sp,
                                  fontFamily: 'Muli',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),SizedBox(height: 20.h,),
                          Row(
                            children: [
                              Text(
                                'Cast',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontFamily: 'Merriweather',
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                             SizedBox(width: 200.w,), Container(
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
                              )
                            ],
                          ),
                              Row(
                                children: [
                                  Image.asset("assets/d.png",height: 70.h,width: 75.w,),
                                  SizedBox(width: 10.w,), Image.asset("assets/e.png",height: 70.h,width: 75.w),
                                  SizedBox(width: 10.w,), Image.asset("assets/f.png",height: 70.h,width: 75.w),
                                  SizedBox(width: 10.w,),Image.asset("assets/g.png",height: 70.h,width: 75.w),],
                              ),

                          Padding(
                            padding:  EdgeInsets.only(right: 20.w),
                            child: Row(
                              children: [
                                Text(
                                  'Tom Holland',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontFamily: 'Muli',
                                    fontWeight: FontWeight.w400,

                                  ),
                                ),
                              SizedBox(width: 20.w,),  Text(
                                  'Zendaya',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontFamily: 'Muli',
                                    fontWeight: FontWeight.w400,

                                  ),
                                ),
                                SizedBox(width: 20.w,),Text(
                                  'Benedict\nCumberbatch',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontFamily: 'Muli',
                                    fontWeight: FontWeight.w400,

                                  ),
                                ),
                                SizedBox(width: 20.w,),Text(
                                  'Jacon\nBatalon',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontFamily: 'Muli',
                                    fontWeight: FontWeight.w400,

                                  ),
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
