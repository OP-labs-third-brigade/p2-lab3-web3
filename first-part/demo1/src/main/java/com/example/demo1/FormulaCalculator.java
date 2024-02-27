package com.example.demo1;
import java.lang.Math;


public class FormulaCalculator {

    public double secondFormula(double a, double b, double c, double d) {
        return ((Math.log1p(Math.abs(2 * a))) / (3 * Math.tan(b))) - (Math.sqrt((c) / (Math.sqrt(Math.abs(d)))));
    }
}

