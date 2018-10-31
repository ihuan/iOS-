//
//  CGView.swift
//  03-绘图
//
//  Created by LTH on 2018/10/30.
//  Copyright © 2018 Tony. All rights reserved.
//

/*
 refer to : https://www.jianshu.com/p/491b50cb19cb
            https://www.jianshu.com/p/1e4bc8378c36
 */
import UIKit

class CGView: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        //self.draw1()
        
        //self.draw2()
        
        //self.draw3()
        
        //self.draw4()
        
        self.draw5()
    }
    
    // MARK: - 绘制文字
    func draw5() {
        
    }
    
    // MARK: - 其他图形的绘制
    func draw4() {
        // 椭圆
        // 宽高相等就是‘圆’
        let rect = CGRect(x: 20, y: 180, width: 100, height: 120)
        let context = UIGraphicsGetCurrentContext()
        context?.addEllipse(in: rect)
        UIColor.gray.set()
        context?.drawPath(using: .fill)
        
        // 弧形
        /*
         添加弧形对象
         x:中心点x坐标
         y:中心点y坐标
         radius:半径
         startAngle:起始弧度
         endAngle:终止弧度
         closewise:是否逆时针绘制，0则顺时针绘制
         */
        context?.addArc(center: CGPoint(x: 200, y: 250), radius: 50, startAngle: 0, endAngle: CGFloat(Double.pi), clockwise: false)
        UIColor.green.set()
        context?.drawPath(using: .fill)
        
        // 绘制贝塞尔曲线
        context?.move(to: CGPoint(x: 20, y: 310))
        context?.addQuadCurve(to: CGPoint(x: 220, y: 310), control: CGPoint(x: 200, y: 400))
        UIColor.yellow.setFill()
        
        //context?.addQuadCurve(to: <#T##CGPoint#>, control: <#T##CGPoint#>)
        context?.drawPath(using: .fillStroke)
    }
    
    
    // MARK: -  UIKit 对绘图方法的 ‘封装‘
    func draw3() {
        let context = UIGraphicsGetCurrentContext()
        // UIKit 对绘图方法的 ‘封装 1’
        context?.addRect(CGRect(x: 20, y: 40, width: self.frame.width - 40, height: 50))
        UIColor.blue.set()
        context?.drawPath(using: .fillStroke)
        
        // UIKit 对绘图方法的 ‘封装 2’
        let y_rect = CGRect(x: 20, y: 40 + 60, width: self.frame.width - 40, height: 50)
        UIColor.yellow.set()
        UIRectFill(y_rect)
        
        let r_rect = CGRect(x: 20, y: 40 + 120, width: self.frame.width - 40, height: 50)
        UIColor.red.set()
        UIRectFill(r_rect)
    }
    
    
    // Core Graphics
    // 内部对创建对象添加到上下文进行了 ‘封装’
    // MARK: -  Core Graphics 对绘图方法的 ‘封装‘
    func draw2() {
        let context = UIGraphicsGetCurrentContext()
        context?.move(to: CGPoint(x: 10, y: 30))
        context?.addLine(to: CGPoint(x: 10, y: 300))
        context?.addLine(to: CGPoint(x: 280, y: 300))
        // 封闭路径: 直接调用路径的封装方法
        context?.closePath()
        // 设置属性
        UIColor.red.setStroke()
        UIColor.yellow.setFill()
        // 绘制路径
        context?.drawPath(using: .fillStroke)
    }
    
    func draw1() {
        // 1、 获取上下文对象
        let context = UIGraphicsGetCurrentContext()
        
        // 2、 创建路径对象
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 10, y: 30))
        path.addLine(to: CGPoint(x: 10, y: 100))
        path.addLine(to: CGPoint(x: 150, y: 100))
        
        // 3、 添加路径到图形上下文
        context?.addPath(path)
        
        // 4、 设置图形上下文状态属性
        context?.setStrokeColor(red: 1, green: 0, blue: 1, alpha: 1)  //设置笔触颜色
        context?.setFillColor(red: 1, green: 1, blue: 0, alpha: 1) //设置填充色
        context?.setLineWidth(5)  //设置线条宽度
        context?.setLineCap(.round) // 设置顶点样式
        context?.setLineJoin(.round) //设置连接点样式
        
        /*设置线段样式
         phase:虚线开始的位置  这里设置为0
         lengths:虚线长度间隔
         count:虚线数组元素个数
         */
        let lengths: [CGFloat] = [5,7] //长度间隔
        context?.setLineDash(phase: 0, lengths: lengths)
        
        let color = UIColor.gray.cgColor //颜色转化，由于Quartz 2D跨平台，所以其中不能使用UIKit中的对象，但是UIkit提供了转化方法
        /*设置阴影
         context:图形上下文
         offset:偏移量
         blur:模糊度
         color:阴影颜色
         */
        context?.setShadow(offset: CGSize(width: 2.0, height: 2.0), blur: 0.8, color: color)
        
        // 5、 绘制图像到指定图形上下文
        /*
         CGPathDrawingMode是填充方式,枚举类型
         Fill:只有填充（非零缠绕数填充），不绘制边框
         EOFill:奇偶规则填充（多条路径交叉时，奇数交叉填充，偶交叉不填充）
         Stroke:只有边框
         FillStroke：既有边框又有填充
         EOFillStroke：奇偶填充并绘制边框
         */
        context?.drawPath(using: .fillStroke) //最后一个参数是填充类型
    }
   

}
