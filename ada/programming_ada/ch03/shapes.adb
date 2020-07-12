with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;

package body Shapes is

    function Area(C: in Circle) return float is
    begin
        return Ada.Numerics.PI*(C.Radius**2);
    end Area;

    function Area(T: in Triangle) return float is
        Perimeter: Float;
    begin
        Perimeter := T.Side_A + T.Side_B + T.Side_C;
        return Sqrt( Perimeter*(Perimeter-T.Side_A)*(Perimeter-T.Side_B)*(Perimeter-T.Side_C));
    end Area;

end Shapes;

