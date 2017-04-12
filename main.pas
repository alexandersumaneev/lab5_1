(*
 * Project: lab5_1
 * User: alexa
 * Date: 12.04.2017
 *)
Type
    arr_type = array[1..10010] Of longint;
    comparator = Function (a, b: longint): boolean;

Var
    n, i: longint;
    f1, f2: text;
    arr: arr_type;

Function comp1(a, b: longint): boolean;
Begin
    comp1 := a >= b;
End;

Function comp2(a, b: longint): boolean;
Begin
    comp2 := a < b;
End;

Procedure insert_sort(Var arr: arr_type; n: longint; comp: comparator);
Var
    t, i, j: longint;
Begin
    For i := 2 To n Do
    Begin
        t := arr[i];
        j := i - 1;
        While (j >= 1) And comp(arr[j],t) Do
        Begin
            arr[j + 1] := arr[j];
            j := j - 1
        End;
        arr[j + 1] := t
    End;
End;


Begin
    assign(f1, 'input.txt');
    reset(f1);
    readln(f1, n);
    i := 1;
    While Not eof(f1) Do
    Begin
        Read(f1, arr[i]);
        i := i + 1;
    End;
    Close(f1);
    insert_sort(arr, n, @comp1);
    assign(f2, 'output.txt');
    Rewrite(f2);
    For i := 1 To n Do
    Begin
        Write(f2, arr[i], ' ');
    End;
    Close(f2);
End.