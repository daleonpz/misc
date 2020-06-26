with Ada.Text_IO; 
use Ada.Text_IO;

procedure ex3 is
begin
    declare 
        type Month_Name is (Jan,Feb,Mar,Apr,Jun,Jul,Ago,Sep,Oct,Nov,Dez);
        type Date is 
            record
                day: Positive range 1..31;
                month: Month_Name;
                year: Positive; 
            end record; 
        today: Date;
    begin 
    today.day   := 30;
    today.month := Dez;
    today.year  := 1999;
    end;

    -- Outside of the declare scope
    -- today.day := 5; -- that's an error

    Put_Line("Außer Declare scope");
end ex3;
