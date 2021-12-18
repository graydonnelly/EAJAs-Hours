//
//  DropdownSelector.swift
//  EAJA Hours 3
//
//  Created by Isi Donnelly on 8/4/21.
//
//unaltered source code: https://emmanuelkehinde.io/creating-a-simple-and-reusable-dropdown-selector-in-swiftui/

import SwiftUI

struct DropdownRow: View {
    var option: Cases
    var onOptionSelected: ((_ option: Cases) -> Void)?

    var body: some View {
        Button(action: {
            if let onOptionSelected = self.onOptionSelected {
                onOptionSelected(self.option)
            }
        }) {
            HStack {
                VStack(alignment:.leading) {
                    Text(option.name)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                    Text(option.descriptionX ?? "")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 5)
    }
}

struct Dropdown: View {
    var options: [Cases]
    var onOptionSelected: ((_ option: Cases) -> Void)?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(self.options, id: \.self) { option in
                    DropdownRow(option: option, onOptionSelected: self.onOptionSelected)
                }
            }
        }
        //.frame(minHeight: CGFloat(options.count) * 600, maxHeight: 250000)
        .frame(minHeight: 200)
        .padding(.vertical, 5)
        .background(Color.white)
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

struct DropdownSelector: View {
    @State private var shouldShowDropdown = false
    @State private var selectedOption: Cases? = nil
    var placeholder: String
    var options: [Cases]
    var onOptionSelected: ((_ option: Cases) -> Void)?
    var onDropdownToggle: ((_ dropdownShown: Bool) -> Void)?
    private let buttonHeight: CGFloat = 45

    var body: some View {
        Button(action: {
            self.shouldShowDropdown.toggle()
            self.onDropdownToggle?(self.shouldShowDropdown)
        }) {
            HStack {
                Text(selectedOption == nil ? placeholder : selectedOption!.name)
                    .font(.system(size: selectedOption == nil ? 14:20))
                    .fontWeight(selectedOption == nil ? .regular:.bold)
                    .foregroundColor(selectedOption == nil ? Color.gray: Color.black)

                Spacer()

                Image(systemName: self.shouldShowDropdown ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                    .resizable()
                    .frame(width: 9, height: 5)
                    .font(Font.system(size: 9, weight: .medium))
                    .foregroundColor(Color.black)
            }
        }
        .padding(.horizontal)
        .cornerRadius(5)
        .frame(height: self.buttonHeight)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray, lineWidth: 1)

        )
        .overlay(
            VStack {
                if self.shouldShowDropdown {
                    Spacer(minLength: buttonHeight + 10)
                    Dropdown(options: self.options, onOptionSelected: { option in
                        shouldShowDropdown = false
                        self.onDropdownToggle?(self.shouldShowDropdown)
                        selectedOption = option
                        self.onOptionSelected?(option)
                    })
                }
            }, alignment: .topLeading
        )
        .background(
            RoundedRectangle(cornerRadius: 5).fill(Color.white)
        ).padding(.leading, 10)
        .padding(.trailing, 10)
    }
}
