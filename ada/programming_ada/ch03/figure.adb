with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;

package body Figure is

    function Area(O: in Object) return Float is
    begin
        return 0.0;
    end Area;
    
    function Distance(O: in Object) return Float is
    begin
        return Sqrt(O.X_coord**2 + O.Y_coord**2);
    end Distance;


end Figure; 
