---
title       : Interactive Regression Analysis Tool
subtitle    : A Shiny Application 
author      : Julie
job         : 
framework   : deckjs      # {io2012, html5slides, shower, dzslides, ...}
deckjs      : {theme: web-2.0}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : mathjax      # {mathjax, quiz, bootstrap, shiny, interactive}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Interactive Regression Analysis Tool
### A Shiny Appliation

Sun Feb 22 19:21:55 2015

---

## Overview
This shiny application provides an interactive tool for data visualizationand regression analysis with control widgets. 

>- Dataset swiss from preloaded R datasets package is used for this tool

>- There are two components of the main panel: User Interface and Data Analysis Output

>- User Inferface component includes two panels 
>> * Model Input
>> * Help

>- Data Analysis Ouptut components includes four panels
>>* Data
>>* Summary Statistics
>>* Scatterplot
>>* Regression

--- 
## User Interface

- Model Input 
>* A checkox widget is provided for users to choose the variables for data analysis 
>* Fertility is preselected as dependent variable for regression analysis
  
- Help
>* describes the background and how to use this shiny app

--- 
## Data Analysis Output I
- Data Panel display data table with widget for users to control the number of rows to show (i.e. 3 rows)


```
##              Fertility Agriculture Examination Education Catholic
## Courtelary        80.2        17.0          15        12     9.96
## Delemont          83.1        45.1           6         9    84.84
## Franches-Mnt      92.5        39.7           5         5    93.40
## Moutier           85.8        36.5          12         7    33.77
##              Infant.Mortality
## Courtelary               22.2
## Delemont                 22.2
## Franches-Mnt             20.2
## Moutier                  20.3
```
- Summary Statistics Panel dislays the summary statistics of the Fertility variables and user selected variables(i.e. Agriculture, Examination and Education selected )


```
##    Fertility      Agriculture     Examination      Education    
##  Min.   :35.00   Min.   : 1.20   Min.   : 3.00   Min.   : 1.00  
##  1st Qu.:64.70   1st Qu.:35.90   1st Qu.:12.00   1st Qu.: 6.00  
##  Median :70.40   Median :54.10   Median :16.00   Median : 8.00  
##  Mean   :70.14   Mean   :50.66   Mean   :16.49   Mean   :10.98  
##  3rd Qu.:78.45   3rd Qu.:67.65   3rd Qu.:22.00   3rd Qu.:12.00  
##  Max.   :92.50   Max.   :89.70   Max.   :37.00   Max.   :53.00
```

---
## Data Analysis Output II
- Scatterplot Panel displays the scatterplot of the Fertility variable and user selected variables

- Regression Panel displays coefficient tables of mulitple linear regression model of regressing Fertility on user chosen independent variables (i.e. Agriculture,Examination,Education)

```
##               Estimate Std. Error   t value     Pr(>|t|)
## (Intercept) 99.8016161 7.15523207 13.948061 1.461623e-17
## Agriculture -0.1801748 0.08070657 -2.232468 3.084416e-02
## Examination -0.7974363 0.24679296 -3.231195 2.366716e-03
## Education   -0.6724159 0.19366143 -3.472121 1.189306e-03
```
