chaos package
================

A package with functions to generate fractals. It is intended to be use
for educational purposes.

## Install

To install `chaos`:

    devtools::install_github("ddiez/chaos")

## Usage

``` r
library(chaos)
library(ggplot2)
x <- logmap(2, 4)
plot(x) + theme_void()
```

![](README_files/figure-gfm/logmap-1.png)<!-- -->

``` r
z <- mandelbrot(steps = 300)
plot_mandelbrot(z)
```

![](README_files/figure-gfm/madelbrot-1.png)<!-- -->
