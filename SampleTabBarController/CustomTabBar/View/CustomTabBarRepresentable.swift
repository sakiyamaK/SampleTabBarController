//
//  CustomTabBarRepresentable.swift
//  SampleTabBarController
//
//  Created by sakiyamaK on 2021/05/04.
//

import SwiftUI

struct CustomTabBarRepresentable: UIViewRepresentable {
  private let view = CustomTabBar()
  func makeUIView(context: Context) -> UIView {
    return view
  }

  func updateUIView(_ uiView: UIView, context: Context) {
    //
  }
}

// previewに反映させる
struct CustomTabBarRepresentable_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      CustomTabBarRepresentable()
        .previewLayout(.fixed(width: 400, height: 200))
        .previewDisplayName("400*200")
    }
  }
}
