You will need to first get sandbox access to the api you're trying to use by following the access steps outlined here. https://developer.va.gov/explore/api/patient-health/sandbox-access 

You should recieve an email containing a client id , you'll need this to generate your JWT.

First you'll want to create some credentials (private, public) keys and follow this guide. https://developer.va.gov/explore/api/patient-health/client-credentials keep reading through until you get to the part that says to generate a JWT thats what this project does for you. You'll need to edit generate.rb file to make sure you've set the client id you got earlier as both the sub and iss

Once you've followed all the prior steps you should be able to run ``` ruby generate.rb``` and get an output JWT in your console. If you run into issues its likely because your file paths need adjusted for the private.pem and public.jwk files. You'll need to edit generate.rb so those files can be found.