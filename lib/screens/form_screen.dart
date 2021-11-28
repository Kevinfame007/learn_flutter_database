import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("แบบฟอร์มบันทึกข้อมูล"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: new InputDecoration(labelText: "ชื่อรายการ"),
                autofocus: true,
                validator: (String? str) {
                  //ชื่อรายาการเป็นค่าว่าง
                  if(str!.isEmpty) {
                    return "กรุณาป้อนชื่อรายการ";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: new InputDecoration(labelText: "จำนวนเงิน"),
                keyboardType: TextInputType.number,
                validator: (String? str) {
                  //ชื่อรายาการเป็นค่าว่าง
                  if(str!.isEmpty) {
                    return "กรุณาป้อนจำนวนเงิน";
                  }
                  if (double.parse(str)<=0) {
                    return "กรุณาป้อนตัวเลขมากกว่า 0";
                  }
                  return null;
                },
              ),
              FlatButton(
                child: Text("เพิ่มข้อมูล"),
                color: Colors.purple,
                textColor: Colors.white,
                onPressed: () {
                  if(formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
