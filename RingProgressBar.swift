//
// Created By: Mobile Apps Academy
// Subscribe : https://www.youtube.com/@MobileAppsAcademy?sub_confirmation=1
// Medium Blob : https://medium.com/@mobileappsacademy
// LinkedIn : https://www.linkedin.com/company/mobile-apps-academy
// Twitter : https://twitter.com/MobileAppsAcdmy
// Lisence : https://github.com/Mobile-Apps-Academy/MobileAppsAcademyLicense/blob/main/LICENSE.txt
//


import SwiftUI

struct RingProgressBar: View {
    
    @Binding var animateTheRings: Bool
    
    @Binding var progressValueOne: CGFloat
    @Binding var progressValueTwo: CGFloat
    @Binding var progressValueThree: CGFloat
    
    let strawberry = Color(#colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1))
    let lime = Color(#colorLiteral(red: 0.5563425422, green: 0.9793455005, blue: 0, alpha: 1))
    let ice = Color(#colorLiteral(red: 0.4513868093, green: 0.9930960536, blue: 1, alpha: 1))
    
    let animation = Animation.easeOut(duration: 3)
    
    var body: some View {
        ZStack {
            Color.black
            ring(for: strawberry, progress: progressValueOne)
                .frame(width: 165)
            ring(for: lime, progress: progressValueTwo)
                .frame(width: 128)
            ring(for: ice, progress: progressValueThree)
                .frame(width: 92)
        }
        .animation(animation, value: animateTheRings)
        .ignoresSafeArea()
    }
    
    
    @ViewBuilder
    private func ring(for color: Color, progress value: CGFloat) -> some View {
        Circle()
            .stroke(style: StrokeStyle(lineWidth: 16))
            .foregroundStyle(.tertiary)
            .overlay {
                Circle()
                    .trim(from: 0, to: value)
                    .stroke(color.gradient, style: StrokeStyle(lineWidth: 16, lineCap: .round))
            }
            .rotationEffect(.degrees(-90))
    }
    
}

