---
layout: portfolio
title:  "Dissertation project"
date:   2018-01-02 16:02:55 +0000
categories: portfolio
image: "/assets/images/Dissertation_project.png"
blerb: "My dissertation project was designed to evaluate current practices in Web usability for dyslexic individuals. An online experiment was created where both dyslexic and non-dyslexic individuals read a number of standardised texts looking at a number of variables including: font style, font size, line spacing, word spacing, background colour, text colour, and use of a screen ruler"
---

## Introduction

My dissertation project was designed to evaluate current practices in Web usability for dyslexic individuals. An online experiment was created where both dyslexic and non-dyslexic individuals read a number of standardised texts looking at a number of variables including:

* Font style
* Font size
* Background colour
* Text colour
* Line spacing
* Word spacing
* Use of a screen ruler

A reading time was taken to compare the different text layouts for the individual, assuming that more difficult texts would take longer to read. Three different layouts were then presented: the first was a control where the layout used for Wikipedia was used, the second allowed the user to choose the layout based on the variables, and the final layout was based on Web accessibility guidelines stated by the British Dyslexia Association. Each layout was read twice with different texts to create an average reading time for each layout. The texts were all standardised to the same reading level using the [text-analysis project][text-analysis]. The user was able to select a text from a modal of texts which gave some information about the individual; if the text had already been read then it would be crossed out.

<br/>
![Text selection example]({{ "/assets/images/text_selection.png" | absolute_url }}){:class="blackBorder z-depth-3"}
<br/>
<br/>

The results were then analysed using R, which showed a decreased reading time when the individual had control of the text layout compared with the layout designed by the Accessibility guidelines. Furthermore, there was no significant difference between the layout described by the British Dyslexia Association and the control (Wikipedia layout).



## Usability
As the experimental site was built for a range of ages and abilities it was important to ensure the site was usable. A series of tutorials was presented before each section explaining the sections purpose and how to use it. As dyslexic individuals would be using the site, the font size was increased and a sans-serif font style was used as outlined by Web accessibility guidelines. The tutorial section also had the option for Text-To-Speech as a dyslexic individual would undertake a lot of reading in the experimental sections. Furthermore, GIF's were added to show how the site should be used as another alternative to reading. It was important that the site was simplistic in order to prevent distraction becoming a factor in the experiment.

<br/>
![Tutorial example]({{ "/assets/images/tutorial_example.png" | absolute_url }}){:class="blackBorder z-depth-3"}
<br/>
<br/>

Think-aloud usability testing was completed to ensure the site was usable for both dyslexic and non-dyslexic individuals. This gave some useful insights into the usability of the experimental site, for example, one complaint was that the individual was unsure of the font sizes and styles and they didn't like selecting each one to find out. To prevent this, the sizes and styles were added to the selection boxes using simple CSS.

<br/>
![Tutorial example]({{ "/assets/images/text_size.png" | absolute_url }}){:class="blackBorder z-depth-3"}
<br/>
<br/>



## Build
The experiment was built using Node.js with Express.js framework.

#### Backend
Information was stored in a relational database from MySQL and the application was hosted on the University's server. Click [here][experimental-site] to go to the site, though it may have been taken down.

#### Variables
Variables for the layout were mostly controlled using JavaScript and JQuery, though all font styles had to be specified using CSS3 '@font-face' rule to ensure the browsers would load the correct fonts.

A screen ruler is often used with dyslexic individuals to help tracking across lines. In order to mimic this I created a opaque div that followed the mouse using jQuery. The user was able to select the colour of the screen ruler.

<br/>
![Screen ruler example]({{ "/assets/images/screen_ruler.png" | absolute_url }}){:class="blackBorder z-depth-3"}
<br/>
<br/>


#### Timer

The timer was implemented using angularJS, and the times sent to the backend using AJAX. The timer would count in real time at the top of the reading environment.

<br/>
![Timer example]({{ "/assets/images/timer.png" | absolute_url }}){:class="blackBorder z-depth-3"}
<br/>
<br/>

#### Testing
As the application was to be released to the public it was necessary to thoroughly test the experimental site. Manual testing on a number of different browsers was completed to ensure the public were able to use the site on any machine on any browser. Automated testing was also completed using the Selenium Firefox extension. Unit testing was completed with Jasmine and Mocha.









## Languages, Libraries, and Programs
![HTML logo]({{"/assets/images/html.png" | absolute_url }}){:class="scale-me"}
![CSS logo]({{"/assets/images/css.png" | absolute_url }}){:class="scale-me"}
![JavaScript logo]({{"/assets/images/js.png" | absolute_url }}){:class="scale-me"}
![jQuery logo]({{"/assets/images/jQuery_logo.gif" | absolute_url }}){:class="scale-me"}
![angularJS logo]({{"/assets/images/angularjs.png" | absolute_url }}){:class="scale-me"}
![Nodejs logo]({{"/assets/images/nodejs.png" | absolute_url }}){:class="scale-me"}
![Bootstrap logo]({{"/assets/images/bootstrap.png" | absolute_url }}){:class="scale-me"}
![Highchartsjs logo]({{"/assets/images/highchartslogo.jpg" | absolute_url }}){:class="scale-me"}
![MySQL logo]({{"/assets/images/mysql_logo.png" | absolute_url }}){:class="scale-me"}
![Jasmine logo]({{"/assets/images/jasmine_logo.jpg" | absolute_url }}){:class="scale-me"}
![Mocha logo]({{"/assets/images/mocha_logo.svg" | absolute_url }}){:class="scale-me"}
![Selenium logo]({{"/assets/images/selenium_logo.png" | absolute_url }}){:class="scale-me"}


[experimental-site]: http://webaccessibility.cmp.uea.ac.uk/
[text-analysis]: http://127.0.0.1:4000/portfolio/2018-01-09-project-2



<!-- I made a thing!

You’ll find this post in your `_posts` directory. Go ahead and edit it and re-build the site to see your changes. You can rebuild the site in many different ways, but the most common way is to run `jekyll serve`, which launches a web server and auto-regenerates your site when a file is updated.

To add new posts, simply add a file in the `_posts` directory that follows the convention `YYYY-MM-DD-name-of-post.ext` and includes the necessary front matter. Take a look at the source for this post to get an idea about how it works.

Jekyll also offers powerful support for code snippets:

{% highlight ruby %}
def print_hi(name)
  puts "Hi, #{name}"
end
print_hi('Tom')
#=> prints 'Hi, Tom' to STDOUT.
{% endhighlight %}

Check out the [Jekyll docs][jekyll-docs] for more info on how to get the most out of Jekyll. File all bugs/feature requests at [Jekyll’s GitHub repo][jekyll-gh]. If you have questions, you can ask them on [Jekyll Talk][jekyll-talk].

[jekyll-docs]: https://jekyllrb.com/docs/home
[jekyll-gh]:   https://github.com/jekyll/jekyll
[jekyll-talk]: https://talk.jekyllrb.com/ -->
