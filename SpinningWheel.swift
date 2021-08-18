//
//  SpinningWheel.swift
//  IndianFlag
//
//  Created by Shreyas Vilaschandra Bhike on 15/08/21.
//

import SwiftUI

struct SpinningWheel: View {
    
    @State private var rotateAshoka = false
    @State private var moveAshoka = false
   
    
    @State private var outlinecircle: CGFloat = 0.0
         
    let outlineTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        
        
        
        
        ZStack{
            
            ZStack{
            AshokaChakra()
                .rotationEffect(.degrees(moveAshoka ? 360 : 0))
                .offset(x: moveAshoka ? -65 : 0, y: 0)
                .animation(Animation.linear(duration: 5).repeatCount(1))
                    .onAppear() {
                        self.moveAshoka.toggle()
                                    }
               
                
            }
                
            
            SpinningWheelBody()
               
            
           
            
            Circle()
                .trim( from: 0, to: self.outlinecircle)
                .stroke(Color("Ashok"), style: StrokeStyle(lineWidth: 5, lineCap: .round)).opacity(0.9)
                .frame(width: 50, height: 50, alignment: .center)
                .offset(x: -50, y: 130)
                .rotationEffect(.degrees(-90))
                               .onReceive(outlineTimer) { _ in
                                   withAnimation {
                                    guard self.outlinecircle < 1 else { return }
                                    self.outlinecircle += 1
                                   }
                               }
                
                
        }
        
        
    }
}




struct SpinningWheelBody: View {
   
    @State private var lineanimate = false
   
    var body: some View {
        
        ZStack{
            Rectangle()
                .frame(width:  20, height: lineanimate ? 100 : 0, alignment:.center)
                .foregroundColor(Color("Ashok"))
                .offset(x: -65, y: 75)
            
            Rectangle()
                .frame(width: lineanimate ? 200 : 0, height: 10, alignment:.center)
                .foregroundColor(Color("Ashok"))
                .offset(x: 30, y: 100)
            
            Rectangle()
                .frame(width: lineanimate ? 250 : 0, height: 5, alignment:.center)
                .foregroundColor(Color("Ashok"))
                .offset(x: 30, y: 125)
            
            
                Rectangle()
                    .frame(width: 20, height: lineanimate ? 70 : 0, alignment:.center)
                    .foregroundColor(Color("Ashok"))
                    .offset(x: 130, y: 90)
            
            
            Rectangle()
                .frame(width: lineanimate ? 200 : 0, height: 4, alignment:.center)
                .foregroundColor(Color("Ashok"))
                .rotationEffect(.degrees(12))
                .offset(x: 30, y: 30)
            
            
        }.animation(Animation.easeInOut(duration: 5).repeatCount(1))
             .onAppear() {
            self.lineanimate.toggle()
                        }
        
    }
}
    


struct SpinningWheel_Previews: PreviewProvider {
    static var previews: some View {
        SpinningWheel()
    }
}



