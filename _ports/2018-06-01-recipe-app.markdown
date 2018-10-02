---
layout: portfolio
title:  "Recipe App"
date:   2018-06-01
image: /assets/images/recipe_app.png
categories: portfolio
blerb: <br/> A React Web application that takes ingredients in your fridge and gives you recipes to make. This application is still in progress.
---

## Introduction
This application was built using React and takes the ingredients in your fridge to give you recipes to make. This application is being made in collaboration with [Micky Dore](https://github.com/MickyDore/RecipeFinder) on github and is still in development. You can find a version of the code on my github [here](https://github.com/lanigraham/RecipeFinder).

## API Food2Fork
The application uses the API [Food2Fork](https://food2fork.com/about/api), which allows ingredients to be searched and returns recipes from its socially ranked recipe database.

## Material UI
The application is using [Material UI](https://v0.material-ui.com/#/) (v0.20.1) thats lets React components implement Google's Material Design.

We are currently implementing an AutoComplete feature which gives suggestions for ingredients. Cards are used to display the recipe with its image.

## Ingredient matched feature
This feature shows how many of the ingredients the user has matched in the recipe, which might allow them to decide whether to check out the recipe or not.

## Social rank
Food2Fork also ranks their recipes, so individuals can decide if the recipe is rated highly by other users or not.
