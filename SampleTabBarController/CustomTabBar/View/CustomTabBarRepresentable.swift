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

  // 作ったViewにパラメータを与える
  func configure(selectedIndex: Int) -> CustomTabBarRepresentable {
    view.items = [UITabBarItem(), UITabBarItem(), UITabBarItem()]
    view.configure(selectedIndex: selectedIndex)    
    return self
  }
}

// previewに反映させる
struct CustomTabBarRepresentable_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      CustomTabBarRepresentable()
        .configure(selectedIndex: 0)
        .previewLayout(.fixed(width: 400, height: 200))
        .previewDisplayName("0")

      CustomTabBarRepresentable()
         .configure(selectedIndex: 2)
        .previewLayout(.fixed(width: 400, height: 200))
        .previewDisplayName("1")
    }
  }
}
