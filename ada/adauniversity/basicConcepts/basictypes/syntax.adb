procedure syntax is
 --WRONG   name_: Integer; identifier cannot end with underline
    name: Integer;
 --WRONG   _name: Integer; identifier cannot start with underline
 --WRONG   na__me: Integer; two consecutive underlines not permitted
 --WRONG   8name: Integer; identifier may not start with digit
    name2: Integer;
    name3: Float;
    A,B: constant Integer := 78; --Initializaton NOT assigment
    -- It's the same as
    -- A: constant Integer := 78;
    -- B: constant Integer := 78;
begin
    -- not forget := 
    name := 1_000; --1000
    name2 := 16#ff#; --base#number#
    name2 := 2#1111_1111#;
    name3 := 1.0; --must have a dot
end syntax;
