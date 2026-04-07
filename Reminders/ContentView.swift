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
        NavigationStack {
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
                }
                .padding(.top, 25)
                
                List {
                    // TODO: Loop through the page's reminders using ForEach
                    ForEach($page.items) { $reminder in
                        // TODO: Display each reminder row
                        NavigationLink {
                            ReminderDetailView(
                                title: $reminder.title,
                                description: $reminder.description,
                                date: $reminder.date,
                                isCompleted: $reminder.isCompleted,
                                color: $page.color)
                        } label: {
                            HStack {
                                Button {
                                    reminder.isCompleted.toggle()
                                } label: {
                                    Image(systemName: reminder.isCompleted ? "circle.fill" : "circle")
                                        .foregroundColor(page.color)
                                }
                                .buttonStyle(.borderless)
                                
                                Text(reminder.title.isEmpty ? "" : reminder.title)
                                        .foregroundColor(reminder.isCompleted ? Color.gray : Color.black)
                                Spacer()
                                Text(reminder.date, style: .relative).foregroundColor(.gray)
                            }
                            .alignmentGuide(.listRowSeparatorLeading) { _ in 0}
                        }
                    }
                    .onDelete { indexSet in
                        page.items.remove(atOffsets: indexSet)
                    }
                }
                .listStyle(.plain)
                
                
                // TODO: Add footer view
                Button {
                    page.items.append(Reminder(title: "", description: "", date: .now, isCompleted: false))
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
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isEditing = true
                    } label: {
                        Image(systemName: "pencil.circle")
                            .foregroundColor(page.color)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
