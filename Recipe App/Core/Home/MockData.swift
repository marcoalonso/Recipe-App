//
//  MockData.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 17/01/24.
//

import Foundation

struct MockData {
    static let recipes = [
        RecipeModel(owner: "Marco Alonso", coverPictureUrl: "https://www.recetasnestle.com.mx/sites/default/files/srh_recipes/f395e167c1613770edb2b32d44260c80.jpg", stepsPictureUrl: "https://depor.com/resizer/iKuIRVVSoS2-EZT-szBYuDAQQ60=/1200x1200/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/INQGMHTMCVDSNFMGVWFPRKKFOI.jpg", foodName: "Hot Cakes", descriptionPreparation: "Mezcla 1.  Mezcla la Leche Evaporada CARNATION® CLAVEL® con el huevo, 2 cucharadas de mantequilla fundida, la esencia de vainilla y la harina para hot cakes. Calienta 2.  Calienta una sartén, agrega un poco de mantequilla y con ayuda de un cucharón vierte un poco de la mezcla para formar los hot cakes; cocina por ambos lados y repite el procedimiento con el resto de la preparación. Consejo culinario 3.  Sirve los hot cakes, decora con moras azules, fresas, las hojas de menta y con un poco de Leche Condensada LA LECHERA® Sirve Fácil. Ofrece.", ingredients: [
            "1.- Harina",
            "2.- Huevo",
            "3.- Leche",
            "4.- Mantequilla"
        ], minutesPreparation: 30, steps: "Mezcla 1.  Mezcla la Leche Evaporada CARNATION® CLAVEL® con el huevo, 2 cucharadas de mantequilla fundida, la esencia de vainilla y la harina para hot cakes. Calienta 2.  Calienta una sartén, agrega un poco de mantequilla y con ayuda de un cucharón vierte un poco de la mezcla para formar los hot cakes; cocina por ambos lados y repite el procedimiento con el resto de la preparación. Consejo culinario 3.  Sirve los hot cakes, decora")
    ]
    
    static let imagePlaceholder = "https://cdn-icons-png.flaticon.com/512/527/527107.png"
}
