---
title: "Untitled"
author: "Joe M"
date: "2/27/2021"
output: html_document
---
**Note: The widow width will impact the display of both the program and these notes.  
Both the program and these notes were both created intended for a wider window view.
        

# Program Overview
This shiny application is created as the final project for the JH Capstone for the Data Science Capstone.  
Sign up page: https://www.coursera.org/specializations/jhu-data-science?utm_campaign=p5lxkNvcEempyReieZALEQ&utm_medium=email&utm_source=marketing

This program was created to implement Natural Language Processing against textual examples from SwiftKeys.  

The Program Tab is broken up into 2 sections  
- User Input: Shaded box on the left of the program screen.  
- Data Display: Tabbed section on the right hand side of the program.

The Data Display has 2 tabs  
- The Program Tab: Displays information on the program and shows predicted words
- The Help Tab: Displays infomraiotn on the program

## Program - How To 
== User Input   
The program will use what is entered in the "Enter Some Text" box.  
Once the user stops typing the program will use what is entered for its calculation.
- The inputted string is tokenized and looked at for pertinent words. Stop words are removed.

The "# of words to display: (1-10)" section allows the user to determine how many words to display.  
- The program starts with a default of 5 words to predict.

== The Program Tab Display  
The words being used to make the prediction are displayed at the top of the program tab.

The determined number of predicted words is placed at the bottom of the tab.

## Program - Getting Help
Clicking the "Help" tab will display the programs Readme.Rmd file.



### Full Disclosure
While creating this project I found others that did a better job than I did. I have taken some of their code and layout  
choices and implement them in this code. In these instances what was used is listed below.

**Note: This project's core was originally written by AdroMine. The code presented by AdroMine is not functional.  
The original code was retrieved from: https://github.com/AdroMine/Next-Word-Prediction/tree/gh-pages/Next_Word_Prediction  
Changes were needed to allow this to function with newer libraries. The original code was built on deprecated functionality.  

JVM