import Cocoa

extension CGColor {
    var nsColor:NSColor {return NSColorParser.nsColor(self)}
    static func cgColor(_ hexColor:UInt, _ alpha: CGFloat = 1.0)->CGColor{
        return CGColorParser.cgColor(hexColor,alpha)
    }
    /**
     * ## Examples: NSColor.redColor().cgColor.alpha(0.5)//Output: a black color with 50% transparancy
     * - Note: to read alpha: color.cgColor.alpha
     */
    func alpha(_ alpha: CGFloat)->CGColor{
        return self.copy(alpha: alpha)!
    }
}
