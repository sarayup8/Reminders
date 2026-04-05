//
//  EditSheet.swift
//  Reminders
//
//  Created by Sarayu Pesala on 4/4/26.
//

import SwiftUI

struct EditSheet: View {
    // TODO: Add title binding
    @Binding var title: String
    @Binding var selectedColor: Color
    
    var body: some View {
        VStack(spacing: 20) {
                // TODO: Add list.bullet.circle.fill icon and TextField
            Text("List Info")
                .bold()
                .foregroundColor(selectedColor)
                .font(.system(size: 25))
            VStack {
                Image(systemName: "list.bullet.circle.fill")
                    .resizable()
                    .frame(width: 90, height: 90)
                TextField("List name", text: $title)
                    .bold()
                    .padding()
                    .background(Color.secondary.opacity(0.15), in: RoundedRectangle(cornerRadius: 16))
            }
            .padding(20)
            .background(Color.secondary.opacity(0.15), in: RoundedRectangle(cornerRadius: 16))

            
            ColorChooser(selectedColor: $selectedColor)
            
            Spacer()
        }
        .foregroundStyle(selectedColor)
        .padding()
    }
    
}

#Preview {
    @Previewable @State var title: String = ""
    @Previewable @State var selectedColor: Color = .red
    
    EditSheet(title: $title, selectedColor: $selectedColor)
        .preferredColorScheme(.light)
}
