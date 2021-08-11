# Fatura Hackathon 2021 (Flutter)

This is a small project consists of Three tasks for Fatura flutter hackathon.

## Goal
This project consists of three tasks :- 
1,2 :  small app consists of FAB and container  when i pressed on FAB it changes container Color
but when i pressed on FAB it Rebuild Background widget which it doesn't no need to rebuild
you need to optimize build function as when i pressed on Button don't rebuild Background widget

3 : Create a movie mobile application that get popular And recent movies
with an ability to add movie to favourite list that will be offline
storage on device (use any way you want) that will be displayed
in favorite tabs

- Design of this app is attached in third_task folder
- Adding a progress indicator when information is loading
- Deal with errors coming from the backend (because eventually it will happen!)
- Create model objects for the API data retrieved to avoid working with dynamic (serialisation/deserialisation?)
- Add some sort of state management to show how that is done (InheritedWidget, Provider, GetIt, Mobx and so on)


## Requirements
- Use latest stable flutter version (at this time > 2.2)
- Have [sound null safety](https://dart.dev/null-safety) enabled

## Retrieving data

To make things easier we have committed a constant file in third task folder with the REST APIs needed to retrieve the movies.

## Submitting the solution

Copy this repository to a repository on your name and add the solution there. It should be clear how to build and run the project locally. **Please don't FORK this repo**

## Bonus (don't need to be in the below specific order)

- A nice splash screen
- On using sound null safety properly: support null **only** when it really can be null
- Make sure components/page boundaries are clear
- Follow Dart [style conventions](https://dart.dev/guides/language/effective-dart/style)
- Show common tools used for you daily development environment (linters, code formatter, git workflow and so on)