clc;clear
syms c,syms x
fun1=x*2*(x-0.73)/0.73;
fun1_l=-0.73;
fun1_u=0;
fun2=x*2*exp(-2*x/(1-0.73));
fun2_l=0;
fun2_u=inf;

int_sym_1=int(fun1,x);
int_sym_2=int(fun2,x);
integral=int(fun1,x,fun1_l,fun1_u)+int(fun2,x,fun2_l,fun2_u)


