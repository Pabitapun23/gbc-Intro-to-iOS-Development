//
//  ContentView.swift
//  Session4_AppDesign
//
//  Created by Tech on 2024-02-01.
//

import SwiftUI

struct ContentView: View {
    
    @State private var player : Bool = true
    //true - X, false - O
    @State private var board = [
        ["", "", ""],
        ["", "", ""],
        ["", "", ""],
    ]
    @State private var showAlert : Bool = false
    @State private var resultMessage : String = ""
    @State private var attempts : Int = 9
    @State private var xCount : Int = 0
    @State private var oCount : Int = 0
    @State private var showScore : Bool = false
    
    var body: some View {
        NavigationStack{
            VStack {
                ForEach(0..<3){ row in
                    HStack{
                        ForEach(0..<3){ col in
                            Button{
                                self.playGame(row: row, col: col)
                            }label: {
                                Text("\(self.board[row][col])")
                                    .foregroundColor(Color("TileTextColor"))
                                    .fontWeight(.bold)
                                    .font(.system(size: 40))
                                    .frame(minWidth : 70, minHeight: 70)
                                    .background(Color("TileColor"))
                            }//Button
                            .alert(isPresented: self.$showAlert){
                                Alert(title: Text("Game Result"),
                                      message: Text("\(self.resultMessage)"),
                                      dismissButton: .default(Text("Dismiss")){
                                    print("alert dismissed")
                                })
                            }
                        }//ForEach
                    }//HStack
                }//ForEach - row
                
                Text("Who's turn ? - \(self.player ? "X" : "O" )")
                
            }//VStack
            
            .padding()
        
        .navigationTitle("Tic Tac Toe")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Menu{
                    Button{
                        self.resetGame()
                    }label:{
                        Text("Reset Game")
                    }
                    
                    Button{
                        
                        self.resultMessage = "Player X won \(xCount) games \n Player O won \(oCount) games"
                        self.showAlert = true
                    }label: {
                        Text("Scoreboard")
                            .foregroundColor(Color(.red))
                    }
                    
                    
                }//Menu
                label: {
                    Image(systemName: "gear.circle.fill")
                        .foregroundColor(Color(.blue))
                }//Menu label
            }//ToolbarItem
        }//toolbar
        }//NavigationStack
        
    }
    
    private func playGame(row: Int, col : Int){
        
        if (self.board[row][col].isEmpty){
            self.board[row][col] = self.player ? "X" : "O"
            self.player.toggle()
            self.attempts -= 1
            
            //check for the winner
            
            //row winner
            if (!self.board[row][col].isEmpty &&
                self.board[row][0] == self.board[row][1] &&
                self.board[row][0] == self.board[row][2]){
                
                print("row winning condition. Player \(self.board[row][col]) wins")
                
                if (self.board[row][col] == "X"){
                    self.xCount += 1
                }else{
                    self.oCount += 1
                }
                print("Player X won \(xCount) games")
                print("Player O won \(oCount) games")
                
                self.resultMessage = "\(self.board[row][col]) wins"
                self.showAlert = true
                
                //reset the game
                self.resetGame()
            }
            
            //Task - add conditions to check column or diagonal winner
            
            //check for game over
            if (self.attempts <= 0){
                self.resultMessage = "Game Over"
                self.showAlert = true
                self.resetGame()
            }
        }//if
    }//playGame
    
    private func resetGame(){
        self.board = [
            ["", "", ""],
            ["", "", ""],
            ["", "", ""],
        ]
        
        self.player = Bool.random()
        self.attempts = 9
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
