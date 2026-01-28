//
//  ContentView.swift
//  lucasclassapp
//
//  Created by Sudhindran Senthilkumar on 1/28/26.
//

import SwiftUI



struct Mood: Identifiable {
    let id = UUID()
    let emoji: String
    let date: Date
}

struct ContentView: View {
    
    @State private var moods: [Mood] = []
    
    let moodEmojis = ["😊", "😐", "😢", "😡", "🤩"]
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("How are you feeling?")
                    .font(.title)
                    .padding()
                
                HStack(spacing: 20) {
                    ForEach(moodEmojis, id: \.self) { emoji in
                        Button(action: {
                            addMood(emoji)
                        }) {
                            Text(emoji)
                                .font(.largeTitle)
                        }
                    }
                }
                .padding()
                
                List(moods) { mood in
                    HStack {
                        Text(mood.emoji)
                            .font(.largeTitle)
                        Spacer()
                        Text(mood.date, style: .time)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Mood Tracker")
        }
    }
    
    func addMood(_ emoji: String) {
        let newMood = Mood(emoji: emoji, date: Date())
        moods.insert(newMood, at: 0)
    }
}

#Preview {
    ContentView()
}

