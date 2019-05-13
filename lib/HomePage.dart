import 'package:flutter/material.dart';
import 'dart:io';
import '';
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

   @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //TODO: Link the Images to States
  bool isCross = true;
  String message;
  List<String> gameState;

  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");

  //TODO: Initilize the State of Box With Empty
  @override
  void initState() {
    super.initState();
    setState(() {
      this.message = "";
      this.gameState = [
        'empty','empty','empty',
        'empty','empty','empty',
        'empty','empty','empty'
      ];
    });
  }

  //TODO: Play Game Method(Takes the Indexes Of Each Button):
  playGame(int index){
    if(this.gameState[index]=="empty"){
      setState(() {
        if(this.isCross){
          this.gameState[index] = "cross";
        }else{
          this.gameState[index] = "circle";
        }
        this.isCross = !this.isCross;
        this.checkWin();
      });
    }
  }
  //TODO: Reset Game Method:
  resetGame(){
    setState(() {
      this.message = "";
      this.gameState = [
        'empty','empty','empty',
        'empty','empty','empty',
        'empty','empty','empty'
      ];
    });
  }

  //TODO: Get Image Method(Function):
  AssetImage getImage(String value){
    switch(value){
      case("empty"):
        return edit;
        break;
      case("cross"):
        return cross;
        break;
      case("circle"):
        return circle;
        break;
    }
  }

  //TODO: Checking If a User Wins:
  checkWin(){
    if( (gameState[0]!="empty") && gameState[1]==gameState[0] && 
    gameState[1]==gameState[2] ){
        setState(() {
          this.message = "${gameState[0]} Wins The Game. Wait 2 Seconds";
          
        });
        Future.delayed(const Duration(milliseconds: 2000), () {

        // Here you can write your code
          this.resetGame();
          
        
        });
    }else if( (gameState[0]!="empty") && gameState[0]==gameState[3] && 
    gameState[3]==gameState[6] ){
        setState(() {
          this.message = "${gameState[0]} Wins The Game. Wait 2 Seconds";
        });
        Future.delayed(const Duration(milliseconds: 2000), () {

        // Here you can write your code
          this.resetGame();
          
        
        });
    }else if( (gameState[1]!="empty") && gameState[4]==gameState[1] && 
    gameState[7]==gameState[4] ){
        setState(() {
          this.message = "${gameState[1]} Wins The Game. Wait 2 Seconds";
        });
        Future.delayed(const Duration(milliseconds: 2000), () {

        // Here you can write your code
          this.resetGame();
          
        
        });
    }else if( (gameState[2]!="empty") && gameState[5]==gameState[2] && 
    gameState[5]==gameState[8] ){
        setState(() {
          this.message = "${gameState[2]} Wins The Game. Wait 2 Seconds";
        });
        Future.delayed(const Duration(milliseconds: 2000), () {

        // Here you can write your code
          this.resetGame();
          
        
        });
    }else if( (gameState[3]!="empty") && gameState[4]==gameState[3] && 
    gameState[5]==gameState[4] ){
        setState(() {
          this.message = "${gameState[3]} Wins The Game. Wait 2 Seconds";
        });
        Future.delayed(const Duration(milliseconds: 2000), () {

        // Here you can write your code
          this.resetGame();
          
        
        });

    }else if( (gameState[6]!="empty") && gameState[6]==gameState[7] && 
    gameState[7]==gameState[8] ){
        setState(() {
          this.message = "${gameState[6]} Wins The Game. Wait 2 Seconds";
        });

        Future.delayed(const Duration(milliseconds: 2000), () {

        // Here you can write your code
          this.resetGame();
          
        
        });
    }else if( (gameState[0]!="empty") && gameState[4]==gameState[0] && 
    gameState[8]==gameState[4] ){
        setState(() {
          this.message = "${gameState[0]} Wins The Game. Wait 2 Seconds";
        });
        Future.delayed(const Duration(milliseconds: 2000), () {
          this.resetGame();
        });

    }else if( (gameState[2]!="empty") && gameState[2]==gameState[4] && 
    gameState[4]==gameState[6] ){
        setState(() {
          this.message = "${gameState[2]} Wins The Game. Wait 2 Seconds";
        });
        Future.delayed(const Duration(milliseconds: 2000), () {
          this.resetGame();
        });
    }else if(!gameState.contains("empty")){

        setState(() {
           this.message = "Game is Draw. Wait 2 Seconds";
          });
        //This is For Delay:
        Future.delayed(const Duration(milliseconds: 2000), () {
          this.resetGame();

        });
        
    
    }
    
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //Expended is Used TO Utilize Full Screen Of the Devise Despite Its
            //Size, IF WE NEED TO USE GRID VIEW WE NEED TO USE EXPANDED()
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(10.0),
                //Deligat--> Grid Class Cannot Go Directly, so We Need to
                // Send a Deligate(ALWAYS HAVE)
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //Saying the Grid that We are Going to Insert 3
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  //This means the Space Between Them(Each Element)
                  crossAxisSpacing: 10.0,
                  //This Means Spacing From Top and Bottom
                  mainAxisSpacing: 10.0
                ),
                //This is How Much Of the Elements We Want
                itemCount: this.gameState.length,
                //This is Much Like a Loop For Our Buttons
                itemBuilder: (context,i)=> SizedBox(
                  width: 100.0,
                  height: 100.0,
                  //Since This is Going to Have a Button We Give Material Button
                  //ALL THE ABOVE CODE IS LIKE CSS AND NOW IS THE ACTUAL FUNCTIONALITY
                  child: MaterialButton(
                    // "i" is Provided By Item-Builder and This is Index Of the Element(Which Should Be Passed Onto Function -> PlaGame)
                    onPressed: (){
                      this.playGame(i);
                    },
                    child: Image(
                      //Shows the Image on Position "i"
                        image: this.getImage(this.gameState[i]),
                      ),
                  ),
                ),
              ),
            ),
            
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                this.message,
                
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                ),
            ),
        
            MaterialButton(
              onPressed: (){
                this.resetGame();
              },
              child: Text("Reset Now",
                          style: TextStyle(color: Colors.white,
                                  fontSize: 20.0),),
              color: Colors.lightGreenAccent,
              minWidth: 300.0,
              height: 50.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text("Harsath's Game",
                 style: TextStyle(fontSize: 20.0),),
            ),
          ],
        ),
        
    );
    
  }
}