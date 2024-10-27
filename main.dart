import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:math_expressions/math_expressions.dart';



void main(){
  runApp( const MaterialApp(
    home:CalculatorApp(),
  ));
}


class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {

  //variable declaration


  var input='';
  var output='';
  var operation='';

  onButtonclick(value){
  


  //if value is AC
  if(value=="AC"){
    input='';
    output='';

  }
  else if (value=="<"){
    if (input.isNotEmpty){
    input=input.substring(0,input.length-1);
  }
  }
  else if (value=="="){
    var userinput=input;
    userinput=input.replaceAll("X", "*");
    Parser p = Parser();
    Expression expression = p. parse(userinput) ;
    ContextModel cm = ContextModel();
    var finalvalue = expression.evaluate(EvaluationType.REAL, cm);
    output = finalvalue.toString();
  }

  else {
    input= input + value;
  }
  setState(() {
    
  });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [

          //input & output
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
             
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [
                  Text(input,style:  const TextStyle(
                    fontSize:40 ,
                    color:Colors.white,
                  ),
                  ),
                  const  SizedBox(
                    height: 30,
                  ),

                  Text(output,style: const TextStyle(
                    fontSize: 34,
                    color:Colors.white,
                  ),
                  ),
                 const  SizedBox(
                    height: 30,
                  ),
                ],
                
              ),
              ),
              ),

               
          //buttons Area
          Row(
            children: [
              button(text:"AC",tcolor: Colors.orange,buttonbgcolor: const Color.fromARGB(255, 19, 14, 14)),
              button(text:"<",tcolor: Colors.orange,buttonbgcolor: const Color.fromARGB(255, 19, 14, 14)),
              button(text:"",buttonbgcolor: Colors.transparent),
              button(text:"/",tcolor: Colors.orange,buttonbgcolor: const Color.fromARGB(255, 19, 14, 14)),
            ],
          ),
          Row(
            children: [
              button(text:"7"),
              button(text:"8"),
              button(text:"9"),
              button(text:"X",tcolor: Colors.orange,buttonbgcolor: const Color.fromARGB(255, 19, 14, 14)),
            ],
          ),
          Row(
            children: [
              button(text:"4"),
              button(text:"5"),
              button(text:"6"),
              button(text:"-",tcolor: Colors.orange,buttonbgcolor: const Color.fromARGB(255, 19, 14, 14)),
            ],
          ),
          Row(
            children: [
              button(text:"1"),
              button(text:"2"),
              button(text:"3"),
              button(text:"+",tcolor: Colors.orange,buttonbgcolor: const Color.fromARGB(255, 19, 14, 14)),
            ],
          ),
          Row(
            children: [
              button(text:"%"),
              button(text:"0"),
              button(text:"."),
              button(text:"=",tcolor: Colors.orange,buttonbgcolor: const Color.fromARGB(255, 19, 14, 14)),
            ],
          ),
          
        ],
      ),
    );
    
 
  }

Widget button({text,tcolor=Colors.white,buttonbgcolor=buttoncolor}){
 return Expanded(
              child: Container(
                margin: const EdgeInsets.all(8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(22),
                    backgroundColor:buttonbgcolor),
                  
                  onPressed: () => onButtonclick(text),
                   child:  Text(text,style: TextStyle(
                    fontSize: 18,
                    color: tcolor,
                    fontWeight: FontWeight.bold,
                   ),),
                   ),
              ),
              );
}
  
  
}

