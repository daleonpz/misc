with Figure;

package Shapes is

   type Circle is new Figure.Object with 
        record
            Radius: Float;
        end record;

    function Area(C: in Circle) return Float;

    type Point is new Figure.Object with null record;
    
    type Triangle is new Figure.Object with
        record
            Side_A: Float;
            Side_B: Float;
            Side_C: Float;
        end record;

    function Area(T: in Triangle) return Float;

end Shapes;
