import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.73
    @State private var opacity = 0.8
    @State private var bites = 0
    
    var body: some View {
        
        if isActive {
            ContentView()
        } else {
            
//            Splash screen
            VStack {
                VStack {
                    Image("MagpieIcon")
                        .resizable()
                        .frame(width: 215, height: 215)
                        .font(.system(size: 80))
                        .foregroundColor(.red)
                }
                .offset(x: 0, y: -85)
                .frame(maxWidth: .infinity, maxHeight:.infinity)
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .background(Color.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}


struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}


