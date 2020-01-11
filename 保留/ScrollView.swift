//
//  ScrollView.swift
//  Collect Photo
//
//  Created by 内藤大輝 on 2020/01/09.
//  Copyright © 2020 Hiroki Naito. All rights reserved.
//

import UIKit
import RealmSwift

class ScrollView: UIView,UIScrollViewDelegate {
    var currentYear:Int = 0
    var currentMonth:Int = 0
    var currentDay:Int = 0
    var scrollView:UIScrollView!
    
    override init(frame:CGRect){
        super.init(frame: frame)

        scrollView = UIScrollView(frame: self.bounds)
        scrollView.backgroundColor = UIColor.clearColor()
        scrollView.contentSize   = CGSize(scrollview.frame.size.width * 3.0,scrollview.frame.size.height);
        scrollView.contentOffset = CGPoint(scrollview.frame.size.width , 0.0);
        scrollView.delegate = self;
        scrollView.pagingisEnabled = true;
        scrollView.showsHorizontalScrollIndicator = false;
        scrollView.showsVerticalScrollIndicator = false;
        scrollView.scrollsToTop = false;
        addSubview(scrollView)
        
        currentMonthView = MonthView(frame: CGRectMake(frame.size.width, 0, frame.size.width,frame.size.height),
                   year:currentYear,month:currentMonth)

               //翌月
        var ret = self.getNextYearAndMonth()
        nextMonthView =  MonthView(frame: CGRectMake(frame.size.width * 2.0, 0, frame.size.width,frame.size.height),
                   year:ret.year,month:ret.month)

               //前月
        ret = self.getPrevYearAndMonth()
        prevMonthView = MonthView(frame: CGRectMake(0.0, 0, frame.size.width,frame.size.height),
        year:ret.year,month:ret.month)

        scrollView.addSubview(currentMonthView);
        scrollView.addSubview(nextMonthView);
        scrollView.addSubview(prevMonthView);

    }
}
