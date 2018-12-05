clc;clear
syms c,syms x
fun1=c*(x-3)/3;
fun1_l=3;
fun1_u=6;
fun2=c*exp(-3.1*(x-6));
fun2_l=6;
fun2_u=inf;

int_sym_1=int(fun1,x);
int_sym_2=int(fun2,x);
integral=int(fun1,x,fun1_l,fun1_u)+int(fun2,x,fun2_l,fun2_u);
final=solve(integral-1)

