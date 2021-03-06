import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
class Moive extends StatefulWidget {
  const Moive({Key? key}) : super(key: key);

  @override
  State<Moive> createState() => _Moive();
}

class _Moive extends State<Moive> {
  void initState() {
    super.initState();
    getData();
  }

  Future<Response> getData() async {
    Dio dio = new Dio();
    Response res = await dio.get(
      "https://www.dillonl.com/toutiao/movie");
    return res;
  }

  Future<void> _onRefresh() async {
    getData();
  }
  Widget getItem(dynamic v,int i){
      return Container(
              width: 340.0,
              margin:
              const EdgeInsets.only(left: 10.0, right: 10.0),
              padding:
              const EdgeInsets.only(top: 12.0, bottom: 20.0),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1,
                          color:
                          Color.fromRGBO(242, 242, 242, 1)))),
              child: Column(children: [
                Container(
                  width: 340.0,
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // 两端对齐
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 6.0),
                        child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          v['title'],
                                          style: const TextStyle(
                                              fontSize: 15.0,
                                              fontWeight:
                                              FontWeight.w800),
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.only(
                                              left: 8.0, top: 2.0),
                                          child: Row(children: v['tagList'].map<Widget>((e) {
                                            return Container(
                                              decoration:
                                              const BoxDecoration(
                                                color: Color.fromRGBO(
                                                    233, 233, 233, 1),
                                                borderRadius:
                                                BorderRadius.all(
                                                  Radius.circular(2.0),
                                                ),
                                              ),
                                              margin:
                                              const EdgeInsets.only(
                                                  right: 6.0),
                                              padding:
                                              const EdgeInsets.only(
                                                  left: 2.6,
                                                  top: 1.0,
                                                  right: 2.0,
                                                  bottom: 1.0),
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                    fontSize: 9.0,
                                                    color:
                                                    Color.fromRGBO(
                                                        120,
                                                        120,
                                                        120,
                                                        1)),
                                              ),
                                            );
                                          }).toList(),)),
                                    ],
                                  )),
                              Container(
                                  child: Text(
                                    v['subTitle'],
                                    style: const TextStyle(
                                        color: Color.fromRGBO(
                                            157, 157, 157, 1),
                                        fontSize: 11.0),
                                  ))
                            ]),
                      ),
                      Container(
                        child: Row(
                          children: [
                            const Icon(
                                IconData(0xe686,
                                    fontFamily: 'iconfont'),
                                size: 16.0,
                                color:
                                Color.fromRGBO(72, 72, 72, 1)),
                            Container(
                                margin: const EdgeInsets.only(
                                    left: 20.0, top: 3.0),
                                child: const Icon(
                                    IconData(0xec1c,
                                        fontFamily: 'iconfont'),
                                    color: Color.fromRGBO(
                                        72, 72, 72, 1),
                                    size: 14.0))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 200.0,
                  color: const Color.fromRGBO(214, 214, 214, 1),
                  child: Stack(children: [
                    Positioned(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network(
                                v['coverList'][1]['url'],
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.fill))),
                    Positioned(
                        left: 150.0,
                        top: 90.0,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.4),
                            borderRadius: BorderRadius.all(
                              Radius.circular(36.0),
                            ),
                          ),
                          child: const Icon(
                              IconData(0xea82,
                                  fontFamily: 'iconfont'),
                              color: Colors.white,
                              size: 20.0),
                        )),
                    Positioned(
                        right: 4.0,
                        bottom: 3.0,
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 2.0,
                              left: 6.0,
                              right: 6.0,
                              bottom: 2.0),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.4),
                            borderRadius: BorderRadius.all(
                              Radius.circular(36.0),
                            ),
                          ),
                          child: Text('3集全',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9.0)),
                        )),
                  ]),
                ),
              ]));
  }
  List<Widget> elemGrid(List<dynamic> mlist) {
    List<Widget> list = [];
    for (int i = 0; i < mlist.length; i++) {
      list.add(getItem(mlist[i], i));
    }
    return list;
  }
  @override
  Widget build(BuildContext context) {
          return Stack(
            children: <Widget>[
              Positioned(
                child: Container(
                  width: double.infinity,
                  height: 80.0,
                  color: Colors.red,
                  child: Center(
                    child: Container(
                        margin: EdgeInsetsDirectional.only(start: 0, top: 30),
                        width: 340.0,
                        height: 36.0,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(36)),
                        ),
                        child: Center(
                          child: Container(
                              width: 320.0,
                              height: 32.0,
                              child: Row(
                                children: [
                                  Container(
                                    width: 30,
                                    child: const Icon(
                                      Icons.search_outlined,
                                      color: Color.fromRGBO(167, 167, 167, 1),
                                      size: 20, // 图标大小
                                    ),
                                  ),
                                  Container(
                                    width: 280.0,
                                    height: 25.0,
                                    child: const TextField(
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: "请输入要搜索的内容",
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        //去除下边框
                                        contentPadding:
                                        EdgeInsets.symmetric(vertical: 0),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        )),
                  ),
                ),
              ),
              FutureBuilder(
                    future: getData(),
                    builder: (BuildContext context, AsyncSnapshot<Response> snapshot){
                      if(snapshot.hasData){
                        List mlist = json.decode(snapshot.data!.data)['Data'];
                        return Container(
                              margin: const EdgeInsets.only(top: 80),
                              child: ListView.builder(
                                  itemBuilder: (BuildContext context, int i) {
                                    return Column(
                                        children: elemGrid(mlist));
                                  },
                                  physics: const PageScrollPhysics()));
                      }else{
                        return const Center(child:Text("加载中...",style: TextStyle(fontSize:12.0,color: Color.fromRGBO(129, 129, 129, 1)),));
                      }
                    }
                ),

            ],
          );

  }
}
