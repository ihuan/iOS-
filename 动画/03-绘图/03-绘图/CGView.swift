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
        
        //self.draw5()
        
        //self.draw6()
        
        //self.draw7()
        
    }
    
    // MARK: - 绘制到位图  '水印'
    func draw8() {
        // 获得一个位图图形上下文
        UIGraphicsBeginImageContext(CGSize(width: 300, height: 200))
        let img = UIImage(named: "timg")
        //注意绘图的位置是相对于画布顶点而言，不是屏幕
        img?.draw(in: CGRect(x: 0, y: 0, width: 300, height: 200))
    
        // 添加水印
        let context = UIGraphicsGetCurrentContext()
        context?.move(to: CGPoint(x: 200, y: 178))
        context?.addLine(to: CGPoint(x: 265, y: 178))
        UIColor.red.setStroke()
        context?.setLineWidth(2)
        context?.drawPath(using: .stroke)
        
        let str = "HaiZeiWang"
        (str as NSString).draw(in: CGRect(x: 200, y: 158, width: 100, height: 30),
                               withAttributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),
                                                NSAttributedString.Key.foregroundColor: UIColor.red])
        //返回绘制的新图形
        let newImg = UIGraphicsGetImageFromCurrentImageContext()
        // 关闭上下文
        UIGraphicsEndImageContext()
        
        let imgView = UIImageView(image: newImg)
        imgView.center = CGPoint(x: 160, y: 284)
        addSubview(imgView)
    }
    
    // MARK: - 上下文变换
    func draw7() {
        let context = UIGraphicsGetCurrentContext()
        //保存初始状态
        context?.saveGState()
        // 像右平移
        context?.translateBy(x: 50, y: 0)
        // 缩放 0.8
        context?.scaleBy(x: 0.5, y: 0.5)
        // 旋转
        context?.rotate(by: CGFloat(Double.pi)/4)
        
        let img = UIImage(named: "timg")
        img?.draw(at: CGPoint(x: 0, y: 100));
    }
    
    // MARK: - 绘制渐变
    func draw6() {
        let context = UIGraphicsGetCurrentContext()
        // 使用RGB颜色空间
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        // components:颜色数组,注意由于指定了RGB颜色空间，那么四个数组元素表示一个颜色（red、green、blue、alpha），
        // 如果有三个颜色则这个数组有4*3个元素
        let component: [CGFloat] = [248.0/255.0, 86.0/255.0, 86.0/255.0, 1,
                                    249.0/255.0, 127.0/255.0, 127.0/255.0, 1,
                                    1.0, 1.0, 1.0, 1.0]
        let locations: [CGFloat] = [0, 0.4, 1]
        let gradient = CGGradient.init(colorSpace: colorSpace,
                                       colorComponents: component,
                                       locations: locations,
                                       count: locations.count)
        
        // 线性渐变
        context?.drawLinearGradient(gradient!,
                                    start: CGPoint.zero,
                                    end: CGPoint(x: self.frame.width, y: self.frame.height),
                                    options: .drawsAfterEndLocation)
        
        // 径向渐变
        /*
        context?.drawRadialGradient(gradient!,
                                    startCenter: CGPoint(x: 100, y: 100),
                                    startRadius: 0,
                                    endCenter: CGPoint(x: 105, y: 105),
                                    endRadius: 80,
                                    options: .drawsAfterEndLocation)
         */
        
        // 填充渐变
        //注意必须先裁切再调用渐变
        UIRectClip(CGRect(x: 20, y: 250, width: 200, height: 200))
        // 或者用 context?.clip(to: <#T##CGRect#>)
        let componentClip: [CGFloat] = [148.0/255.0, 86.0/255.0, 86.0/255.0, 1,
                                    149.0/255.0, 127.0/255.0, 127.0/255.0, 1,
                                    1.0, 1.0, 1.0, 1.0]
        let gradientClip = CGGradient.init(colorSpace: colorSpace,
                                           colorComponents: componentClip,
                                           locations: locations,
                                           count: locations.count)
        context?.drawLinearGradient(gradientClip!,
                                    start: CGPoint(x: 50, y: 100),
                                    end: CGPoint(x: 180, y: 100),
                                    options: .drawsAfterEndLocation)
        
        // 叠加模式
        /*
         使用Quartz 2D绘图时后面绘制的图像会覆盖前面的，默认情况下如果前面的被覆盖后将看不到后面的内容，
         但是有时候这个结果并不是我们想要的，因此在Quartz 2D中提供了填充模式供开发者配置调整
         */
        //相信大家对比代码和显示效果并不难发现每种叠加的效果。例子中只是使用UIKit的封装方法进行叠加模式设置，更一般的方法当然是使用CGContextSetBlendMode(CGContextRef context, CGBlendMode mode)方法进行设置。
        //UIRectFillUsingBlendMode(rect2, CGBlendMode.Clear )
    }
    
    // MARK: - 绘制文字
    func draw5() {
        let str = "使用CoreGraphics进行文字绘制使用, 效果是这样展现的！"
        let rect = CGRect(x: 20, y: 20, width: 280, height: 200)
        let font = UIFont.systemFont(ofSize: 16)
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.left
        (str as NSString).draw(in: rect,
                               withAttributes: [NSAttributedString.Key.font: font,
                                                NSAttributedString.Key.foregroundColor: UIColor.red,
                                                NSAttributedString.Key.paragraphStyle: style])
        
        // 绘制图像
        /*
        let img = UIImage(named: "")
        img?.draw(in: CGRect.zero)
        img?.draw(at: CGPoint.zero)
         */
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
        context?.addQuadCurve(to: CGPoint(x: 220, y: 310),
                              control: CGPoint(x: 200, y: 400))
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
