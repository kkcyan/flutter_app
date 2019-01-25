import 'package:flutter/material.dart';


class SwitchDart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch'),
      ),
      body: new ThemeTextField(),
    );
  }
}

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() => new _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected=true; //维护单选开关状态
  bool _checkboxSelected=true;//维护复选框状态
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
          value: _switchSelected,//当前状态
          onChanged:(value){
            //重新构建页面
            setState(() {
              _switchSelected=value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red, //选中时的颜色
          onChanged:(value){
            setState(() {
              _checkboxSelected=value;
            });
          } ,
        )
      ],
    );
  }
}


class TextFieldDart extends StatelessWidget {

  //定义一个controller
  TextEditingController _unameController=new TextEditingController();
  TextEditingController _selectionController = new TextEditingController();


  @override
  void initState() {
    //监听输入改变
    _unameController.addListener((){
      debugPrint(_unameController.text);
    });

    _selectionController.text="hello world!";
    _selectionController.selection=TextSelection(
        baseOffset: 2,
        extentOffset: _selectionController.text.length
    );
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person)
            ),
            cursorColor: Colors.red,
            controller: _unameController, //设置controller
            onChanged: (value){
              initState();
            },
          ),
          TextField(
            decoration: InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                prefixIcon: Icon(Icons.lock)
            ),
            obscureText: true,
            cursorWidth: 6.0,
            cursorRadius: Radius.circular(3.0),
          ),

          TextField(
//          decoration: InputDecoration(
//              labelText: "密码2323",
//              hintText: "您的登录密码2332",
//              prefixIcon: Icon(Icons.lock)
//          ),
//          obscureText: true,
            controller: _selectionController,
          ),
          FlatButton(onPressed: (){
            debugPrint(_unameController.text);
          }, child: Text('click to show textfield content'),),
        ],
      ),
    );
  }
}

class ThemeTextField extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Theme(
        data: Theme.of(context).copyWith(
            hintColor: Colors.grey[200], //定义下划线颜色
            inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.grey),//定义label字体样式
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0)//定义提示文本样式
            )
        ),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "密码",
                  hintText: "您的登录密码",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0)
              ),
              obscureText: true,
            ),
            Container(
              child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "电子邮件地址",
                      prefixIcon: Icon(Icons.email),
                      border: InputBorder.none //隐藏下划线
                  )
              ),
              decoration: BoxDecoration(
                // 下滑线浅灰色，宽度1像素
                  border: Border(bottom: BorderSide(color: Colors.grey[200], width: 1.0))
              ),
            ),
          ],
        )
    );
  }
}



class FocusTestRoute extends StatefulWidget {
  @override
  _FocusTestRouteState createState() => new _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            focusNode: focusNode1,//关联focusNode1
            decoration: InputDecoration(
                labelText: "input1"
            ),
          ),
          TextField(
            focusNode: focusNode2,//关联focusNode2
            decoration: InputDecoration(
                labelText: "input2"
            ),
          ),
          Builder(builder: (ctx) {
            return Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("移动焦点"),
                  onPressed: () {
                    //将焦点从第一个TextField移到第二个TextField
                    // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                    // 这是第二种写法
                    if(null == focusScopeNode){
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(focusNode2);
                  },
                ),
                RaisedButton(
                  child: Text("隐藏键盘"),
                  onPressed: () {
                    // 当所有编辑框都失去焦点时键盘就会收起
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  },
                ),
              ],
            );
          },
          ),
        ],
      ),
    );
  }

}

