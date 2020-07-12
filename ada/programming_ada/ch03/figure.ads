package Figure is
    type Object is tagged private;
    function Area(O: in Object) return Float;
    function Distance(O: in Object) return Float;

private
   type Object is tagged -- it creates a Tag and this type can be extended
                    -- This allows inheretance 
       record
           X_coord: Float;
           Y_coord: Float;
       end record;
end Figure;
