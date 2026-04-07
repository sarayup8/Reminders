//
//  ReminderDetailView.swift
//  Reminders
//
//  Created by Sarayu Pesala on 4/6/26.
//


import SwiftUI

struct ReminderDetailView: View {
    // TODO: Fill in necessary bindings (Hint: you need 4)
    @Binding var title: String
    @Binding var description: String
    @Binding var date: Date
    @Binding var isCompleted: Bool
    @Binding var color: Color
    @State private var isEditing: Bool = false
    
    var body: some View {
        // TODO: Recreate the view in the write-up video
        List {
            Section {
                Text(description)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .multilineTextAlignment(.center)
                    .listRowBackground(Color.clear)
            }
            
            Section(header: Text("Title & Description").foregroundColor(color)) {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            
            Section(header: Text("Date").foregroundColor(color)) {
                DatePicker("Date", selection: $date)
                    .datePickerStyle(.compact)
            }
        }
        // TODO: Add Toolbar for Todo Info
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isEditing = true
                } label: {
                    Image(systemName: "pencil.circle")
                        .foregroundColor(color)
                }
            }
        }
        .sheet(isPresented: $isEditing) {
            EditSheet(title: $title, selectedColor: $color)
        }
				//TODO: Add NavigationTitle
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    // TODO: Create necessary @State properties to pass into preview (Hint: use @Previewable)
    @Previewable @State var title: String = ""
    @Previewable @State var description: String = ""
    @Previewable @State var date: Date = .now
    @Previewable @State var color: Color = .blue
    @Previewable @State var isCompleted: Bool = false
    
    NavigationStack {
        ReminderDetailView(
            title: $title,
            description: $description,
            date: $date,
            isCompleted: $isCompleted,
            color: $color
        )
    }
}
