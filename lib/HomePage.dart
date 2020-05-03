import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//TODO: link images
AssetImage cross=AssetImage("images/cross.png");
AssetImage circle=AssetImage("images/circle.png");
AssetImage edit=AssetImage("images/edit.png");
bool isCross=true;
String message;
List<String> gameState;

//TODO: initialize the state of box iwth empty
@override
void initState() {
  super.initState();
  setState(() {
      this.gameState=[
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",        
      ];
      this.message ="";
    }); 
}  

//TODO: playgame method
playGame(int index){
  if(this.gameState[index]=="empty"){
      setState(() {
          if(this.isCross){
            this.gameState[index]="CROSS";
          }
          else{
            this.gameState[index]="CIRCLE";
          }           
          this.isCross= !this.isCross;
          this.checkWin();
      });
  }
}
//TODO: Reset Game method
resetGame(){
  setState(() {
    this.gameState=[
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
     ];
    this.message="";

  });
}
//TODO: get image method
AssetImage getImage(String value){

    switch (value) {
        case ('empty'):
            return edit;
            break;
        case ('CROSS'):
            return cross;
            break;
        case ('CIRCLE'):
            return circle;
            break;
      }
}

//TODO: check for win logic
checkWin(){
    if((gameState[0]!='empty')&&(gameState[0]==gameState[1])&&(gameState[1])==gameState[2])
    {
      setState(() {
        this.message='${this.gameState[0]} Wins';
        });
    }
    else if((gameState[3]!='empty')&&(gameState[3]==gameState[4])&&(gameState[4])==gameState[5])
    {
      setState(() {
        this.message='${this.gameState[3]} Wins';
        });
    }
    else if((gameState[6]!='empty')&&(gameState[6]==gameState[7])&&(gameState[7])==gameState[8])
    {
      setState(() {
        this.message='${this.gameState[6]} Wins';
        });
    }
    else if((gameState[0]!='empty')&&(gameState[0]==gameState[3])&&(gameState[3])==gameState[6])
    {
      setState(() {
        this.message='${this.gameState[0]} Wins';
        });
    }
    else if((gameState[1]!='empty')&&(gameState[1]==gameState[4])&&(gameState[4])==gameState[7])
    {
      setState(() {
        this.message='${this.gameState[1]} Wins';
        });
    }
    else if((gameState[2]!='empty')&&(gameState[2]==gameState[5])&&(gameState[5])==gameState[8])
    {
      setState(() {
        this.message='${this.gameState[2]} Wins';
        });
    }
    else if((gameState[2]!='empty')&&(gameState[2]==gameState[4])&&(gameState[4])==gameState[6])
    {
      setState(() {
        this.message='${this.gameState[2]} Wins';
        });
    }
    else if((gameState[0]!='empty')&&(gameState[0]==gameState[4])&&(gameState[4])==gameState[8])
    {
      setState(() {
        this.message='${this.gameState[0]} Wins';
        });
    }
    else if(!gameState.contains('empty'))
    {
        setState(() {
          this.message=('GAME DRAW');
        });
    }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TicTacToe"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              
               child: GridView.builder(
                 padding: EdgeInsets.fromLTRB(20.0, 120.0, 20.0, 0.0),
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 3,
                   childAspectRatio: 1.0,
                   crossAxisSpacing: 10.0,
                   mainAxisSpacing: 10.0,
                 ),
                 itemCount: this.gameState.length,
                 itemBuilder: (context,i) => SizedBox(
                   height: 100.0,
                   width: 100.0,
                   
                   child: MaterialButton(
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(40.0),
                        ),
                    onPressed: ()
                     {
                       this.playGame(i);
                      },
                     child: Image(
                       image: this.getImage(this.gameState[i]),
                       ),
                    ), 
                 ),
               ), 
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(this.message,
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            MaterialButton(
              color: Colors.deepOrange,
              minWidth: 200.0,
              height: 50.0,
              shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
              
              child: Text(
                "RESET GAME",
                 style:TextStyle(
                   color: Colors.white,
                   fontSize: 20.0,
                )
              ),
              onPressed: (){
                  resetGame();
              },
              
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text("LearnCodeOnline.in",
                style: TextStyle(
                  fontSize: 18.0,
                ),),
              )
            ],
        ),
    );
  }
}