
package Buffer_System is -- visible part
    type Buffer is private; -- User cannot see Buffer details
    Error: exception; 
    procedure Load(B: out Buffer; S: in String);
    procedure Get(B: in out Buffer; C: out Character);
    procedure Is_Empty(B: in Buffer; Is_Empty_Flag: out Boolean);

private -- User cannot see this part 
    MAX: constant Integer := 80;
    type Buffer is
        record
            Data: String(1..MAX);
            Start: Integer := 1;
            Finish: Integer := 0;
        end record;
end Buffer_System;


