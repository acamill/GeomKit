import Foundation

class HexModifier {
    /**
     * Blend two colors with a scalar ratio.
     * - Parameter: first: The first color
     * - Parameter: second: The second color
     * - Parameter: ratio: The ratio of the second color to blend, .5 = equal ratio, .9 = 1:9, .2 = 8:2
     * RETURN: The color value as a uint
     * - Note: you can also use the Native NSColor.blended(withFraction fraction: CGFloat, of color: NSColor) -> NSColor?
     */
    static func blend(_ first:UInt, _ second:UInt, _ ratio: CGFloat) -> UInt {// :- Fixme: ⚠️️ rename?
        var a: CGFloat; var b: CGFloat; var c: CGFloat;
        a = (CGFloat(first & 0xff) * (1 - ratio) + CGFloat(second & 0xff) * ratio)
        b = {
            let first = CGFloat((first & 0xff00) >> 8)
            let second = CGFloat((second & 0xff00) >> 8)
            return (first * (1 - ratio) + second * ratio)
        }()
        c = {
            let first = CGFloat((first & 0xff0000) >> 16)
            let second = CGFloat((second & 0xff0000) >> 16)
            return (first * (1 - ratio) + second * ratio)
        }()
        return a.uint | (b.uint << 8) | (c.uint << 16)
    }
    /**
     * Brighten (or darken) a color by a scalar amount
     * - Parameter: color: The color to brighten/darken
     * - Parameter: modifier: The scalar to modify the brightness, 0 = no change, ie. 0.9, 1.1
     * RETURNS:	The modified color
     */
    static func brighten(_ color:UInt, _ modifier:UInt) -> UInt {
        let z:UInt = 0xff * modifier;
        var a:UInt; var b:UInt; var c:UInt;
        a = ((color & 0xff) + z)
        a = a > 0xFF ? 0xFF : ( a < 0 ? 0 : a)
        b = ((color & 0xff00) >> 8) + z
        b =  b > 0xFF ? 0xFF : ( b < 0 ? 0 : b)
        c = ((color & 0xff0000) >> 16) + z
        c =  c > 0xFF ? 0xFF : ( c < 0 ? 0 : c)
        return ((a) | (b << 8) | (c << 16))
    }
    /**
     * Desaturate a color by a scalar amount. (0-1)
     * This isn't a real desaturation, but blends the color with a neutral grey.
     * - Parameter: color: The color to desaturate
     * - Parameter: percent: The percentage of desaturation
     * RETURN: The desaturated color
     */
    static func desaturate(_ color:UInt, _ modifier:UInt)->UInt {
        return HexModifier.blend(color, 0x808080, CGFloat(modifier))
    }
    /**
     * Fades a color by a scalar amount. (0-1)
     * Basically just blends the color with white.
     * - Parameter: color: The color to fade
     * - Parameter: percent: The percentage of fade
     * RETURN: The faded color
     */
    static func fade(_ color:UInt, _ modifier:UInt) -> UInt {
        return blend(color, 0xFFFFFF, CGFloat(modifier))
    }
}
