---
layout: portfolio
title:  "Text analysis project"
date:   2018-01-04 21:15:05 +0000
image: /assets/images/smog_app.jpg
categories: portfolio
blerb: <br/> This application was created to aid my dissertation project, where all texts had to be the same reading level. It analyses texts to calculate the SMOG (Simple Measure of Gobbledygook) readability formula. This readability formula was created by Harry McLaughlin to estimate the years of education needed to understand a piece of writing.
---


## Introduction

This application was created to aid my dissertation project, where all texts had to be the same reading level. It analyses texts to calculate the SMOG (Simple Measure of Gobbledygook) readability formula. This readability formula was created by Harry McLaughlin to estimate the years of education needed to understand a piece of writing. The formula:
<br/>
<br/>

$$ \mathsf{SMOG = 1.043} \sqrt{\mathsf{Number \,of \,polysyllables} \times \frac{30}{\mathsf{Number \,of \,sentences}}} + 3.1291  $$


Was used to calculate the SMOG formula and display the correct reading level with information on the typical age group this covers.

The application also displays the number of words of a certain letter length in a graphical display using Highcharts.js.

<br/>
![Highcharts graphical representation]({{ "/assets/images/highchart_graph.png" | absolute_url }}){:class="blackBorder z-depth-3"}
<br/>
<br/>

The application also shows more information on other attributes that can affect the readability difficulty of a text, including the number of polysyllable words with more than 4 syllables.

<br/>
![Statistical information on the text]({{ "/assets/images/more-stats.png" | absolute_url }}){:class="blackBorder z-depth-3"}
<br/>
<br/>

As the SMOG formula calculates the text difficulty mainly using polysyllables in a lexical view, an alternative formula; the Dale-Chall formula, was used to look at the text from a more subjective view in order to standardise the texts. This formula relies on a list of words deemed easy by fourth-grade American students. Words that are not in this list are therefore perceived to be difficult, and the more difficult words the more difficult the text.  
<br/>

In order to increase or reduce the readability level of the texts, it was important to understand where the polysyllable words were in the text. To make this easier, syntax highlighting using [highlight-within-textarea](https://github.com/lonekorean/highlight-within-textarea) was used.


<br/>
![Polysyllable highlighting]({{ "/assets/images/syntax-highlight.png" | absolute_url }}){:class="blackBorder z-depth-3"}
<br/>
<br/>

## Build
Node.js with Express.js framework was used to build the application. Check out the [SMOG application][heroku-app] hosted on Heroku. The SMOG readability formula was hand coded while the Dale-Chall formula was calculated using a node package from npm. The application was cross tested on a number of browsers with functional testing - though testing finished here as this application was built for self-serivce for my dissertation.


## Testing
Due to the minimal size of the Web application and its function to aid my dissertation project, only manual functional testing was done.



<br/>
## Languages and libraries
![HTML logo]({{"/assets/images/html.png" | absolute_url }}){:class="scale-me"}
![CSS logo]({{"/assets/images/css.png" | absolute_url }}){:class="scale-me"}
![JavaScript logo]({{"/assets/images/js.png" | absolute_url }}){:class="scale-me"}
![Nodejs logo]({{"/assets/images/nodejs.png" | absolute_url }}){:class="scale-me"}
![Bootstrap logo]({{"/assets/images/bootstrap.png" | absolute_url }}){:class="scale-me"}
![Highchartsjs logo]({{"/assets/images/highchartslogo.jpg" | absolute_url }}){:class="scale-me"}





[heroku-app]: https://readability-application.herokuapp.com/
