import 'package:flutter/material.dart';


class ImageDart extends StatelessWidget {

  String icons = "\uE914  \uE000  \uE90D";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Dart'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
//            Image(
//              image: AssetImage('images/img_1.jpeg'),
//              width: 100,
//            ),
//            Image.asset('images/img_2.jpeg'),
            
            Image.network(
              'http://5b0988e595225.cdn.sohucs.com/images/20171014/5cf02b6fe5b24bcdbd5a55e9538b5436.jpeg',
//              width: 100,
              color: Colors.blue,
              colorBlendMode: BlendMode.softLight,
            ),
            Image.network('http://5b0988e595225.cdn.sohucs.com/images/20171014/5cf02b6fe5b24bcdbd5a55e9538b5436.jpeg'),
//            Image.network('http://www.visitbeijing.com.cn/uploads/file/2016/0919/20160919053904295.jpg'),
          
          Text(icons,
            style: TextStyle(
              fontFamily: "MaterialIcons",
              fontSize: 44.0,
              color: Colors.red,
            ),
          ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.accessible,color: Colors.green,),
                Icon(Icons.error,color: Colors.blue,),
                Icon(Icons.fingerprint,color: Colors.cyan,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}