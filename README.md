### Project Motivation
Activists, community organizers, and social justice organizations put a lot of passion and effort into evolving systems to be more just and compassionate. The work is time consuming and a lot of this time is spent searching for information. Once an activist finds or creates the information they need, what can they do to make it easier for others to find that same information? 

This question motivated me to create Your Activist Resource Directory (YARD). YARD allows users to add links to online resources that are then visible to the public. Users can sift through resources and add their favorite resources to collections. All of a user's created resources, favorited resources, and collections make up their "User Library".  The power of this application is the ability for users to share their library with others. I envision this web app being used by established organizations and activists to spread information in an organized manner. Social media activists can share their libraries with their followers. Non-profit organizations can share their libraries with their employees and volunteers. Powerpoints, reports, and public policy documents can be shared between organizations running campaigns accross the country.

YARD aims to create a more connected and knowledgeable community of activists.  

YARD is a work in progress but the MVC has been released for people to use and I plan to continually update this app. To start, I have found a front-end designer to make the website prettier, more user-friendly, and slightly more colorful. In the future I plan to implement two specific features. The first is a more advanced searching mechanism. The second is a machine learning algorithm that recommends resources to users based on their user history. 


### Forking This Repo
Everything is setup for you. All you need to do is:

1. `bundle install`
2. `rails db:create`
3. `rails db:migrate`
4. `rails db:seed`
5. `rails s`

### Current Features
1. All resources are visible to the public
2. Users (those who create an account) can create their own library by 
  * Creating resources
  * Favoriting resources
  * Creating collections
  * Adding favorites to their collections

3. Users can review and rate any resource
4. Users can share their personal libraries with the public  
5. Admin panel can be used to download a list of email subscribers into a csv file 

### Future Features
1. Full test suite
2. Users can upvote and downvote a resource
4. Users can do an in depth search for a resource
5. The app can display complex statistics and analytics about resources bases on their reviews, updates, downvotes, clicks, and more. 
6. Machine learning algorithms will recommend resources to users based on user history

### Contributors
Iris Nevins => @cosmosiris

### Technologies 
1. Ruby on Rails & Ruby
2. Devise (for user authentication/registration)
3. HTML
4. JQuery & Javascript
5. CSS
6. Bootstrap

### Screenshots
### Landing Page
![Landing Page](https://raw.githubusercontent.com/cosmosiris/activist-resource-directory/development/public/github-images/yard-landing-page.png)
### Categories
![Categories](https://raw.githubusercontent.com/cosmosiris/activist-resource-directory/development/public/github-images/yard-categories.png)
### Full User Registration and Login functionality including email confirmations, lockouts, and more. 
![Login/Registration](https://raw.githubusercontent.com/cosmosiris/activist-resource-directory/development/public/github-images/yard-login-registration.png)
### List of Resources
![Category Show](https://raw.githubusercontent.com/cosmosiris/activist-resource-directory/development/public/github-images/yard-resource-list.png)
### Individual Resource
![Resource Show](https://raw.githubusercontent.com/cosmosiris/activist-resource-directory/development/public/github-images/yard-resource-show.png)
### Reviews
![Reviews](https://raw.githubusercontent.com/cosmosiris/activist-resource-directory/development/public/github-images/yard-review.png)
### User Library
![User Library](https://raw.githubusercontent.com/cosmosiris/activist-resource-directory/development/public/github-images/yard-user-library.png)

### Database Schema 
![Schema](https://raw.githubusercontent.com/cosmosiris/activist-resource-directory/development/public/github-images/yard-schema.png)

### Link to Wesite
http://youractivistresourcedirectory.com/
