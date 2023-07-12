#  Yu-Gi-Oh DB

## Description

Yu-Gi-Oh DB is a native iOS application that displays a deck of cards from YGOPRODeck public API.

![]()

## Getting Started

1. Make sure to have XCode Version 14.3.1 or above installed on your computer.
2. Open the project files in XCode.
3. Build and run project (preferably on iPhone 14 versions).
4. Click on card name within list and view detailed card view.
5. (Optional) Click on card image for an expanded image view.

## Architecture

- Hobby Tracker was implemented using Model View View-Model (MVVM) archiecture.
- Firebase Firestore was used to store hobby list data.

## Structure

- "Manager": Files that cointain the models for what a hobby consists of.
- "Views": Files that display the content view for the deck listing and detailed card view.
- "Data": Files that contain JSON data for deck of cards that were displayed.

## API

- YGOPRODeck: https://ygoprodeck.com/api-guide/
