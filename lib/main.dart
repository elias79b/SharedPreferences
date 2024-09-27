import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
TextEditingController _controller = TextEditingController();
//کلید برای شناختن دیتای مورد نظر
var name = '';
//برای مقداری دهی کردن دیتا داخل این ذخیره می شه
late SharedPreferences _preferences;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    ReadData();
  }
  //برای ادد کرد دیتا رئی شیرد
void SaveData(var txt) async{
  //نمونه ساختن از کلاس شیرد
  _preferences = await SharedPreferences.getInstance();
  //برای ذخیره کردن برای نوع ذخیره
  // name کلید
  //برای ذخیره کردن
  _preferences.setString('name',txt);
  ReadData();
}

//خوندن دیتا از روی شیرد
void ReadData()async{
  _preferences = await SharedPreferences.getInstance();
  //کلید برای پاک کردن دیتا
  // _preferences.remove('name');
  //برای دریافت اطلاعات
setState(() {
  name= _preferences.getString("name")!;
});
}

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Name $name'),
            SizedBox(height: 20,),
            TextButton(onPressed: (){
              var text = _controller.text.toString();
              SaveData(text);
              ReadData();
            }, child: Text('save')),
            SizedBox(height: 20,),
            Container(
              width: 150,
              child: TextField(
                controller: _controller,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
