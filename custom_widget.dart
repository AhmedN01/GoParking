
import 'package:flutter/material.dart';


customelevated({
  Function(String)?onChanged,
  required  Function() callBack,
  Color? bgcolor,shadowColor,
  OutlinedBorder? shape,
  ButtonStyle? style,
  BorderSide? side,
  Widget?btnname,textStyle,


}){
  return Container(
    height: 52,
    width: 340,
    padding:  const EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: ElevatedButton(
      onPressed: () {
        callBack();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: bgcolor,
          shadowColor: shadowColor,
          side:const BorderSide(color: Color(0xffE53935)),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
      child: btnname,
    ),
  );
}

          customformtextfild({
            String? labeltext,hinttext,
            TextStyle? hintstyle,labelstyle,style,
}){
        return  Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 24),
          child: TextFormField(
            style: style,
                  decoration:  InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff75788D)),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff75788D)),
              ),
                hintText:hinttext,
                hintStyle:hintstyle,
                labelText:labeltext,
                labelStyle:labelstyle,
      ),
    ),
        );
}

   customimage({
     required void Function()? onPressed,
     TextStyle? styles,textStyle,
     required Image image,
     required Text text,
     ButtonStyle? style,
     Color? backgroundColor,
}){
  return   SizedBox(
    height: 52,
    width: 320,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            backgroundColor:backgroundColor,
            side: const BorderSide(color: Colors.black)),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image,
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text,

              ],
            ),
          ],
        )),
  );
}


 accountlist({
   Function()? onTap,String?text,image,Color? tileColor,color,
}){

  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
    child: GestureDetector(
     onTap:onTap,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        tileColor:tileColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        leading: Image(
          image: AssetImage(image),
          height: 44,
          width: 44,
        ),
        title: Text(
          text!,
          style: TextStyle(
              fontFamily: 'Gilroy',
              fontSize: 14,
              color:color,
              fontWeight: FontWeight.w700),
        ),
        trailing: const InkWell(
            // onTap: () {
            //   Navigator.push(context, MaterialPageRoute(
            //     builder: (context) {
            //       return myvehicle();
            //     },
            //   ));
            // },
            child: Image(
                image: AssetImage('assets/arrowright.png'),
                color:Colors.grey,
                width: 16,
                height: 17)),
      ),
    ),
  );
}

