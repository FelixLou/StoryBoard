#CSC517 Project 1

there are already one admin in the application
name: admin
email: admin@ncsu.edu
password: admin@ncsu.edu

for mail function, the code is located in:
1. app/mailer/user_mailer.rb
2. config/environment/development.rb

Only after admin adding user to the project, the user can signup or create a story under the project.
Only after a user creates or signs up a story, his profile will show stories created or signed up by him.
For the search function, you can type any thing you want in "title" or "description" and any story whose title or description includes content you type will appear in results. 
