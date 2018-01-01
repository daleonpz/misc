-- with is to create a dependency 
-- Library Unit: Ada.Text_IO
-- Allow us read from and print to the console
with Ada.Text_IO;

procedure Hello is
        A, B, C: Integer;
begin
    -- Value is an attribute of Entity Integer
    A := Integer'Value (Ada.Text_IO.Get_Line);
    -- Get_Line is a "Service"
    B := Integer'Value (Ada.Text_IO.Get_Line);
    C := A + B;

    if C = 0 then
        Ada.Text_IO.Put_Line("Result is 0");
    elsif  C>0 then
        -- & is array concatenation operator
        -- Image is to convert to string
        Ada.Text_IO.Put_Line("Positive result :" & Integer'Image(C));
    else
        Ada.Text_IO.Put_Line("Negative result :" & Integer'Image(C));
    end if;
end Hello;
