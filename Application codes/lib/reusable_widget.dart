import 'package:flutter/material.dart';

Container reusableRowContainer(double h, double w, Image im, String t) {
  return Container(
    height: 0.12 * h,
    width: 0.75 * w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      boxShadow: [
        BoxShadow(
          color: Color(0x3f000000),
          blurRadius: 10,
          offset: Offset(0, 4),
        ),
      ],
      color: Color(0xfffff5f5),
    ),
    child: Row(
      children: [
        Container(
          width: w * 0.35,
          height: h * 0.11,
          child: im,
        ),
        Text(
          t,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xfff16f00),
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}
Container reusableContainerButton(
    double h, double w, double fh, double fw, Image im, String t) {
  return Container(
    height: (fh) * h,
    width: fw * w,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: fw * w,
          height: fh * h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            color: Color(0xfffff5f5),
            boxShadow: [
              BoxShadow(
                color: Color(0x3f000000),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ), //
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              im,
              SizedBox(
                height: 0.02 * h,
              ),
              Text(
                t,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xfff16f00),
                  fontFamily: "BebasNeue",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Container reusableRectangleButton(double h, double w, String t) {
  return Container(
    width: 0.38 * w,
    height: 0.1 * h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(17),
      boxShadow: [
        BoxShadow(
          color: Color(0x3f000000),
          blurRadius: 4,
          offset: Offset(0, 4),
        ),
      ],
      color: Color(0xfffff5f5),
    ),
    alignment: Alignment.center,
    child: Text(
      t,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 20, color: Color(0xfff16f00), fontWeight: FontWeight.w600),
    ),
  );
}

AppBar reusableAppBar(double w, String title, BuildContext context) {
  return AppBar(
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Colors.black,
        )),
    title: Text(
      title,
      style: TextStyle(
          fontSize: 30,
          color: Colors.black,
          fontWeight: FontWeight.bold
      ),
    ),
    //   centerTitle: true,
    toolbarHeight: 90.2,
    toolbarOpacity: 0.8,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40), bottomLeft: Radius.circular(0)),
    ),
    elevation: 0.00,
    backgroundColor: Color(0xfffff5f5),
  );
}

Container ReusableTextFieldWithTitle(BuildContext context, String title,
    TextEditingController textEditingController, String hintText) {
  return Container(
    width: 0.9 * MediaQuery.of(context).size.width,
    height: 0.15 * MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage('Assets/Images/bg screen.png'), fit: BoxFit.cover),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Color(0x3f000000),
          blurRadius: 10,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      children: [
        SizedBox(height: 8),
        Flexible(
          child: Text(title,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color(0xfffff5f5),
              )),
        ),
        Container(
          width: 0.8 * MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Color(0xfffff5f5),
          ),
          child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(height: 8),
      ],
    ),
  );
}

Container ReusableTextFieldWithTitleForm(
    BuildContext context, String title, TextFormField tff) {
  return Container(
    width: 0.9 * MediaQuery.of(context).size.width,
    height: 0.15 * MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage('Assets/Images/bg screen.png'), fit: BoxFit.cover),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Color(0x3f000000),
          blurRadius: 10,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      children: [
        SizedBox(height: 8),
        Flexible(
          child: Text(title,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color(0xfffff5f5),
              )),
        ),
        Container(
          width: 0.8 * MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Color(0xfffff5f5),
          ),
          child: tff,
        ),
        SizedBox(height: 8),
      ],
    ),
  );
}

AppBar reusableAppBarOpp(double w, String title, BuildContext context) {
  return AppBar(
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color:Color(0xfffff5f5),
        )),
    title: Text(
      title,
      style: TextStyle(
          fontSize: 30,
          color: Color(0xfffff5f5),
          fontWeight: FontWeight.bold,
          fontFamily: 'BebasNeue'),
    ),
    //   centerTitle: true,
    toolbarHeight: 90.2,
    toolbarOpacity: 0.8,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40), bottomLeft: Radius.circular(0)),
    ),
    elevation: 0.00,
    flexibleSpace: Image(
        image: AssetImage('Assets/Images/bg screen.png'), fit: BoxFit.cover),
  );
}


Container reusableRowContainerBG(double h, double w, String t, Icon icon) {
  return Container(
    height: 0.12 * h,
    width: 0.75 * w,
    decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage('Assets/Images/bg screen.png'), fit: BoxFit.cover),
      borderRadius: BorderRadius.circular(4),
      boxShadow: [
        BoxShadow(
          color: Color(0x3f000000),
          blurRadius: 10,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Row(
      children: [
        Container(
          width: w * 0.25,
          height: h * 0.1,
          child: icon,
        ),
        Flexible(
          child: Text(
            t,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color(0xfffff5f5),
              fontSize: 22,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    ),
  );
}

Container ReusableDesignedButton(double h, double w, Icon icon, String t) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage('Assets/Images/bg screen.png'), fit: BoxFit.cover),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(width: w * 0.25, height: h * 0.1, child: icon),
        Text(
          t,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xfffff5f5),
            fontSize: 22,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}
