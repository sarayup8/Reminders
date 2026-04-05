//
//  ContentView.swift
//  Reminders
//
//  Created by Sarayu Pesala on 4/4/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isEditing: Bool = false
    // TODO: Add an @State property to hold a RemindersPage struct
    @State private var page: RemindersPage = RemindersPage(
        title: "Reminders",
        items: [],
        color: .blue
    )
    
    var body: some View {
        VStack {
            HStack {
                Text("9:09")
                    .bold()
                    .font(.system(size: 20))
                Spacer()
                Image(systemName: "cellularbars")
                Image(systemName: "wifi")
                Image(systemName: "battery.50percent")
            }
            .padding(.horizontal, 20)

            // TODO: Add header view
            HStack {
                Text(page.title)
                    .font(.system(size: 45))
                    .foregroundColor(page.color)
                    .bold()
                Spacer()
                Button {
                    isEditing = true
                } label: {
                Image(systemName: "pencil.circle")
                    .resizable()
                    .foregroundColor(page.color)
                    .frame(width: 22, height: 22)
                    .bold()
                }
            }
            .padding(.top, 25)
            
            List {
                // TODO: Loop through the page's reminders using ForEach
                ForEach($page.items) { $reminder in
                    // TODO: Display each reminder row
                    HStack {
                        Image(systemName: reminder.isCompleted ? "circle.fill" : "circle")
                            .foregroundColor(page.color)
                            .onTapGesture {
                                reminder.isCompleted.toggle()
                            }
                        TextField("", text: $reminder.title)
                            .foregroundColor(reminder.isCompleted ? Color.gray : Color.black)
                    }
                }
                .onDelete { indexSet in
                    page.items.remove(atOffsets: indexSet)
                }
            }
            .listStyle(.plain)
            
            // TODO: Add footer view
            Button {
                page.items.append(Reminder(title: ""))
            } label: {
                Spacer()
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .foregroundColor(page.color)
                    .frame(width: 40, height: 40)
            }
            .padding(25)

        }
        .sheet(isPresented: $isEditing) {
            // TODO: Add remaining binding
            EditSheet(title: $page.title, selectedColor: $page.color)
        }
        .padding()
        .ignoresSafeArea()
    }
}
#Preview {
    ContentView()
}
