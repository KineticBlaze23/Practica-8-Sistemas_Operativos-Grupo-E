#!/bin/bash
# En este script vamos a realizar operaciones aritmeticas usando let
X=$1
Y=2

echo "Suma:"
let suma=X+Y
echo $suma

echo "Resta:"
let resta=X-Y
echo $resta

echo "Multiplicacion:"
let multiplicacion=X*Y
echo $multiplicacion

echo "Division:"
echo "scale=2; $X/$Y" | bc
