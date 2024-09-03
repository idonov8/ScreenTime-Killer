//
//  TimePicker.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 26/08/2024.
//
// Uses code from: https://www.youtube.com/watch?v=tv3gZq01qUw

import SwiftUI

struct TimePicker: View {
    var style: AnyShapeStyle = .init(.bar)
    @Binding var hour: Int
    @Binding var minutes: Int
    var body: some View {
        HStack(spacing: 0) {
            CustomView("hours", 0...12, $hour)
            CustomView("mins", 0...59, $minutes)
        }
        .offset(x: -25)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(style)
                .frame(height:35)
        }
        
    }
    
    @ViewBuilder
    private func CustomView(_ title: String, _ range: ClosedRange<Int>, _ selection: Binding<Int>) -> some View {
        PickerViewWithoutIndicator(selection: selection) {
            ForEach(range, id: \.self) { value in
                Text("\(value)").tag(value)
            }
        }
        .overlay {
            Text(title)
                .font(.callout)
                .frame(width: 50, alignment: .leading)
                .lineLimit(1)
                .offset(x: 50)
        }
    }
}

#Preview {
    SetGoalView()
}

// Helpers

struct PickerViewWithoutIndicator<Content: View, Selection: Hashable>: View {
    @Binding var selection: Selection
    @ViewBuilder var content: Content
    @State private var isHidden: Bool = false
    
    var body: some View {
        Picker("", selection: $selection) {
            // TODO: fix it, the background is not removed for the second wheel.
            if !isHidden {
                RemovePickerIndicator {
                    isHidden = true
                }
            }
            content

        }
        .pickerStyle(.wheel)
    }
}

fileprivate
struct RemovePickerIndicator: UIViewRepresentable {
    var result: () -> ()
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .clear
        DispatchQueue.main.async {
            if let pickerView = view.pickerView {
//                print(pickerView)
                if pickerView.subviews.count >= 2 {
                    pickerView.subviews[1].backgroundColor = .clear
                }
            }
        }
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) { }
}

fileprivate
extension UIView {
    var pickerView: UIPickerView? {
        if let view = superview as? UIPickerView {
            return view
        }
        return superview?.pickerView
    }
}
