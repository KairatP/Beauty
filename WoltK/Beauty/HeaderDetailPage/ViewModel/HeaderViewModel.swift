//
//  HeaderViewModel.swift
//  WoltK
//
//  Created by Kairat on 8/7/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import Foundation

class HeaderViewModel {
    
    var titleImageNmae: String
    
    
    init(title: String) {
        self.titleImageNmae = title
    }
    
    let introductionText: [HeaderDetailModel] = [
        HeaderDetailModel(text: "let headerModel = HeaderDetailModel(intruductionText: acsgvhcbjnkmas sdf  fwe few f ew few f we fwe  rwe gvd x vfn fg b vdsz`  vrdbb dsd fv s vdr v rsd  vs v sd vdr v rd vdrb ny tre sfdr tfh bv dbv d fsvrdgsg rdb rd g rd bdr bg rdg bdr b dr b drb brd bv d v dr gb dr vd, intruductionImage: 5, conclusionText: av sdcbk sn asj cas cs c jascjsc, conclusionImage: 7", image: "12"),
        HeaderDetailModel(text: "Discussion Views are the fundamental building blocks of your app's user interface, and the UIView class defines the behaviors that are common to all views. A view object renders content within its bounds rectangle and handles any interactions with that content. The UIView class is a concrete class that you can instantiate and use to display a fixed background color. You can also subclass it to draw more sophisticated content. To display labels, images, buttons, and other interface elements commonly found in apps, use the view subclasses provided by the UIKit framework rather than trying to define your own. Because view objects are the main way your application interacts with the user, they have a number of responsibilities. Here are just a few: Drawing and animation Views draw content in their rectangular area using UIKit or Core Graphics. Some view properties can be animated to new values. Layout and subview management Views may contain zero or more subviews. Views can adjust the size and position of their subviews. Use Auto Layout to define the rules for resizing and repositioning your views in response to changes in the view hierarchy. Event handling A view is a subclass of UIResponder and can respond to touches and other types of events. Views can install gesture recognizers to handle common gestures. Views can be nested inside other views to create view hierarchies, which offer a convenient way to organize related content. Nesting a view creates a parent-child relationship between the child view being nested (known as the subview) and the parent (known as the superview). A parent view may contain any number of subviews but each subview has only one superview. By default, when a subview’s visible area extends outside of the bounds of its superview, no clipping of the subview's content occurs. Use the clipsToBounds property to change that behavior. The geometry of each view is defined by its frame and bounds properties. The frame property defines the origin and dimensions of the view in the coordinate system of its superview. The bounds property defines the internal dimensions of the view as it sees them and is used almost exclusively in custom drawing code. The center property provides a convenient way to reposition a view without changing its frame or bounds properties directly For detailed information about how to use the UIView class, see View Programming Guide for iOS. Open in Developer Documentation", image: "7")
    ]
    
//    let textImage: [String] = ["12"]
//    let introductionText: [String] = ["let headerModel = HeaderDetailModel(intruductionText: acsgvhcbjnkmas sdf  fwe few f ew few f we fwe  rwe gvd x vfn fg b vdsz`  vrdbb dsd fv s vdr v rsd  vs v sd vdr v rd vdrb ny tre sfdr tfh bv dbv d fsvrdgsg rdb rd g rd bdr bg rdg bdr b dr b drb brd bv d v dr gb dr vd, intruductionImage: 5, conclusionText: av sdcbk sn asj cas cs c jascjsc, conclusionImage: 7", "12", "Discussion Views are the fundamental building blocks of your app's user interface, and the UIView class defines the behaviors that are common to all views. A view object renders content within its bounds rectangle and handles any interactions with that content. The UIView class is a concrete class that you can instantiate and use to display a fixed background color. You can also subclass it to draw more sophisticated content. To display labels, images, buttons, and other interface elements commonly found in apps, use the view subclasses provided by the UIKit framework rather than trying to define your own. Because view objects are the main way your application interacts with the user, they have a number of responsibilities. Here are just a few: Drawing and animation Views draw content in their rectangular area using UIKit or Core Graphics. Some view properties can be animated to new values. Layout and subview management Views may contain zero or more subviews. Views can adjust the size and position of their subviews. Use Auto Layout to define the rules for resizing and repositioning your views in response to changes in the view hierarchy. Event handling A view is a subclass of UIResponder and can respond to touches and other types of events. Views can install gesture recognizers to handle common gestures. Views can be nested inside other views to create view hierarchies, which offer a convenient way to organize related content. Nesting a view creates a parent-child relationship between the child view being nested (known as the subview) and the parent (known as the superview). A parent view may contain any number of subviews but each subview has only one superview. By default, when a subview’s visible area extends outside of the bounds of its superview, no clipping of the subview's content occurs. Use the clipsToBounds property to change that behavior. The geometry of each view is defined by its frame and bounds properties. The frame property defines the origin and dimensions of the view in the coordinate system of its superview. The bounds property defines the internal dimensions of the view as it sees them and is used almost exclusively in custom drawing code. The center property provides a convenient way to reposition a view without changing its frame or bounds properties directly For detailed information about how to use the UIView class, see View Programming Guide for iOS. Open in Developer Documentation"]
    
    
//    let headerModel = HeaderDetailModel(intruductionText: "acsgvhcbjnkmas sdf  fwe few f ew few f we fwe  rwe gvd x vfn fg b vdsz`  vrdbb dsd fv s vdr v rsd  vs v sd vdr v rd vdrb ny tre sfdr tfh bv dbv d fsvrdgsg rdb rd g rd bdr bg rdg bdr b dr b drb brd bv d v dr gb dr vd", intruductionImage: "5", conclusionText: "av sdcbk sn asj cas cs c jascjsc", conclusionImage: "7")
//
//    var intruductionText: String {
//        return headerModel.intruductionText
//    }
//
//    var intruductionImage: String {
//        return headerModel.intruductionImage
//    }
//
//    var conclusionText: String {
//        return headerModel.conclusionText
//    }
//
//    var conclusionImage: String {
//        return headerModel.conclusionImage
//    }
    
}
