import 'package:flutter/material.dart';
import 'package:fluttersetup/modules/demo_module/src/ui/login_screen.dart';
import 'package:fluttersetup/modules/demo_module/src/ui/seo/havecard.dart';
import 'package:fluttersetup/modules/demo_module/src/ui/seo/nocard.dart';
import 'package:fluttersetup/ultilites/hex_color.dart';
import 'package:fluttersetup/ultilites/ultility.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SeoPage extends StatefulWidget {
  @override
  _SeoPageState createState() => _SeoPageState();
}

class _SeoPageState extends State<SeoPage> with SingleTickerProviderStateMixin {
  TabController tabController;
 String fullName ='';
@override
   void initState()  {
    // TODO: implement initState
  tabController = TabController(vsync: this, length: 2);
    super.initState();
  getRefer();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    tabController?.dispose();
    super.dispose();
  }
  getRefer() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs == null)
      prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString("fullname");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
                  HexColor("007F55"),
                  Colors.green
                ]),
              ),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      child: FlutterLogo(colors: Colors.green,size: 80.0,),
                    ),
                    Container(child: Text(fullName,style: TextStyle(color: Colors.white),))
                  ],
                ),
              ),

            ),
            CustomListTile(Icons.person,"Thông tin",(){}),
            CustomListTile(Icons.settings,"Cài đặt",(){}),
            CustomListTile(Icons.notifications,"Thông báo",(){}),
            CustomListTile(Icons.exit_to_app,"Đăng xuất",(){navigatorPushReplacement(context,LoginPage(),true);}),
          ],
        ),
      ),
      appBar: AppBar(

        centerTitle: true,
        title: Text(
          'Quản lý khách hàng',
          style: TextStyle(
            fontFamily: 'Distant Galaxy',
          ),
        ),
        bottom: TabBar(
          unselectedLabelColor: Colors.green,
          controller: tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 3.0,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.filter_1),text: "Đã có thẻ",),
            Tab(icon: Icon(Icons.filter_2),text: "Đăng ký thẻ",)
          ],
        ),

      ),
      body: TabBarView(
      controller: tabController,
        children: <Widget>[
          HaveCardPage(),
          NoCardPage(),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  IconData iconData;
  String text;
  Function onTap;
  CustomListTile(this.iconData,this.text,this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
      child:Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.green))
        ),
        child: InkWell(
          splashColor: Colors.green,
          onTap: onTap,
          child: Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(iconData,color: Colors.green ,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(text,style: TextStyle(fontSize: 16.0),),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
