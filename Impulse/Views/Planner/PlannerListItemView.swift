//
//  PlannerListItemView.swift
//  Impulse
//
//  Created by Parish Gutierrez on 4/13/24.
//

import SwiftUI

struct PlannerListItemView: View {
    @StateObject var viewModel = PlannerListItemViewViewModel()
    let item: PlannerItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            }label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            }
        }
    }
}

#Preview {
    PlannerListItemView(item: .init(id: "123", title: "Get Milk", dueDate: Date().timeIntervalSince1970, createDate: Date().timeIntervalSince1970, isDone: true))
}
