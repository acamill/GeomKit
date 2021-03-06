import CoreGraphics

public class CGRectModifier {
   /**
    * Positions a rectangle (top-left pivot)
    * - Note: modifies the original Rectangle instance, but is returned for chaining purposes
    * - Note: positions from the top left of the rectangle
    */
   public static func position(rect:inout CGRect, position: CGPoint) -> CGRect {
      let difference: CGPoint = CGPointParser.difference(p1: rect.topLeft, p2: position)
      _ = rect.offsetInPlace(point: difference)
      return rect
   }
   /**
    * Positions a rectangle (center pivot)
    * - Parameter position: this value is the new center-position
    * - Fixme: ⚠️️ The difference could be calculated before-hand
    * - Note: the rectangle is returned because it may be convenient when you chain methods together
    */
   public static func centerPosition(rect:inout CGRect, position: CGPoint) -> CGRect {
      let difference: CGPoint = CGPointParser.difference(p1: rect.center, p2: position)
      _ = rect.offsetInPlace(point: difference)
      return rect
   }
}
