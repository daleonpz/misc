procedure ex2 is
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
--     today.year  := -150; -- Check boundarier
    today.year := 1989;
end ex2;
