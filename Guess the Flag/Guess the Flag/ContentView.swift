//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Andrew Park on 2/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var countries  = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0 // Add an @State property to store the user’s score
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(userScore)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            if userScore == 8 {
                Button("Reset", action: reset)
            }
            else {
                Button("Continue", action: askQuestion)
            }
        } message: {
                Text("Your score is \(userScore)") // then display it in the alert and in the score label
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer && userScore == 7 {
            scoreTitle = "Game over. You won!"
            userScore += 1
            showingScore = true
            
            
        } else if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 1 // modify score
            showingScore = true
            
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])" // When someone chooses the wrong flag, tell them their mistake in your alert message – something like “Wrong! That’s the flag of France,” for example.
            if userScore != 0 {
                userScore -= 1 // modify score
            }
            showingScore = true
            
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset() {
        userScore = 0 // reset
        askQuestion()
    }
}

#Preview {
    ContentView()
}
