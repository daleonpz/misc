package body Buffer_System is 
    procedure Load(B: out Buffer; S: in String) is
    begin
        B.Data(B.Start..B.Finish) := S;
        B.Start := 1;
        B.Finish := S'Length;

        if S'Length > MAX or B.Start <= B.Finish then
            raise Error;
        end if;
    end Load;

    procedure Get(B: in out Buffer; C: out Character) is
    begin
        C := B.Data(B.Start);
        B.Start := B.Start + 1;
    end Get;

    procedure Is_Empty(B: in Buffer; Is_Empty_Flag: out Boolean) is
    begin
        if B.Start = 1 and B.Finish = 0 then
            Is_Empty_Flag := True;
        else 
            Is_Empty_Flag := False;
        end if;
    end Is_Empty;
end Buffer_System;
