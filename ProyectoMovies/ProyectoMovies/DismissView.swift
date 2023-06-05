//
//  DismissView.swift
//  ProyectoMovies
//
//  Created by Paulina on 21/05/23.
//

import SwiftUI

struct DismissView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        HStack{
            Spacer()
            Button("Cerrar")
            {
                dismiss()
            }.tint(.black).padding(.trailing,12).foregroundColor(.white)
            
        }.buttonStyle(.bordered)
    }
}

struct DismissView_Previews: PreviewProvider {
    static var previews: some View {
        DismissView()
    }
}
