

import 'package:flutter/material.dart';

void main() {
  runApp(XO());
}


class XO extends StatefulWidget {
 

  @override
  _XOState createState() => _XOState();
}

class _XOState extends State<XO> {
  int count=1;
 List<String>input=['','','','','','','','',''];
  String inp='';
  String Winner;
  int xscore=0;
  int oscore=0;
  String role='X';
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
          
          backgroundColor: Colors.blueGrey,
          body:SafeArea(
                      child: Column(children: [
              
                Expanded(
                  flex: 1,
                  child: Row(
                    children:[
                      
                        
                          Column(children: [
                            Text('Player X',style:TextStyle(color: Colors.white,fontSize:30)),
                            Text(xscore.toString(),style:TextStyle(color: Colors.white,fontSize:30)),
                          ],),

                           Spacer(),

                       Text('role ',style: TextStyle(fontSize: 30,color: Colors.white),),
                       Text(role,style: TextStyle(fontSize: 30,color: Colors.white),),

                          Spacer(),

                          Column(children: [
                            Text('Player O',style:TextStyle(color: Colors.white,fontSize:30)),
                            Text(oscore.toString(),style:TextStyle(color: Colors.white,fontSize:30)),
                          ],)
                          
                          
                        
                      
                    ]
                  )
                  
                   ),

                   Expanded(
                     
                     flex: 3,
                     
                         child: GridView.builder(
                           itemCount: 9,
                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
                           itemBuilder: (context,index)
                           {
                             return InkWell(
                               onTap: (){
                                
                                
                               if(count.isOdd&&input[index]==''){
                                 setState(() {
                                    role='O';
                                   input[index]='X';
                                  
                                  count++;
                                  
                                  
                                 });
                                 
                                 
                               }
                               else if(count.isEven&&input[index]==''){
                                 setState(() {
                                  role='X';
                                    input[index]='O'; 
                                     count++;
                                     
                                 
                                 });
                                
                                 
                               }
                                win(); 
                                    score();
                              
                               },
                              
                             child:Container(
                              decoration: BoxDecoration(
                               border: Border.all(color:Colors.white),
                                
                              ),
                              
                             child: Center(child: Text(input[index],
                              style: TextStyle(fontSize: 30,color: Colors.white),)),

                             ));
                           }
                           
                           ),
                      
                     
                     ),

                     //SizedBox(height:80),
Expanded(
                     flex: 1,
                     child: Container(
                       child: Column(children: [
      
                           InkWell(
                             onTap: (){
                               setState(() {
                                 for(int i=0;i<9;++i){
                                 input[i]='';
                               }
                               count=1;
                               role='X';
                               });
                               
                             },
                             child: Container(
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(18)
                              ),
                              width: 300,
                              height: 70,
                              child: Align(
                                alignment:Alignment.center,
                                child: Text(
                                  'Play Again',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white
                                    ),)),),
                           ),

                        SizedBox(height: 10,),

                        InkWell(
                           onTap: (){
                               setState(() {
                                 for(int i=0;i<9;++i){
                                 input[i]='';
                                 }
                                 xscore=0;
                                 oscore=0;
                                 
                               
                               });
                               
                             },
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(18)
                              ),
                              width: 300,
                              height: 70,
                            child: Center(
                              child: Text(
                                'End Game',style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white
                                  ),))),
                        ),

                       ],),
                     )
                     )
                   

              ],),
          ),
       
        ),
      
    );
  }
void win(){
if(input[0]==input[1]&&input[1]==input[2]&&input[2]!=''){

  setState(() {
  Winner=input[2];
  
});
}

else if(input[3]==input[4]&&input[4]==input[5]&&input[5]!=''){

setState(() {
  Winner=input[5];
   
  
});
}

else if(input[6]==input[7]&&input[7]==input[8]&&input[8]!=''){

  setState(() {
  Winner=input[8];
 
  
});
}

else if(input[0]==input[3]&&input[3]==input[6]&&input[6]!=''){

 setState(() {
  Winner=input[6];
  
  
});
}

else if(input[1]==input[4]&&input[4]==input[7]&&input[7]!=''){

  setState(() {
  Winner=input[7];
  
  
});
}

else if(input[2]==input[5]&&input[5]==input[8]&&input[8]!=''){

 setState(() {
  Winner=input[8];
 
  
});
}

else if(input[0]==input[4]&&input[4]==input[8]&&input[8]!=''){

setState(() {
  Winner=input[8];
  
  
});
}

else if(input[2]==input[4]&&input[4]==input[6]&&input[6]!=''){
setState(() {
  Winner=input[6];
  
  
});
  
}

}

void score(){
if(Winner=='X'){

  setState(() {
    xscore++;
    Winner='q';
    for(int i=0;i<9;++i){
    input[i]='';
     
  }
 count=1;
    
  });
}

else if(Winner=='O'){

  setState(() {
    oscore++;
    Winner='q';
    for(int i=0;i<9;++i){
    input[i]='';
  }
  
     count=1;
  });
}
}


}
