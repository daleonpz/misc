
with Ada.Text_IO; use Ada.Text_IO;

Procedure ex1 is
    Pascal: array (0 .. 10) of Integer;
    Next:   array (0 .. 10) of Integer;
    N:      Integer := 10;
begin
    Put_Line("--Pascal Array");
    for i in 0 .. N loop
        Pascal(i) := i*i;
        Put_Line(Integer'Image( Pascal(i)) );
    end loop;

    Put_Line("--Next Array");
    Next(0) := 1;
    for i in 1 .. (N-1) loop
        Next(i) := Pascal(i-1) + Pascal(i);
        Put_Line( Integer'Image( Next(i) ) );
    end loop;

    Next(N) := 1;

end ex1;
