Mandatory 2 part 1 Integrate with an auth service documentation

This is a sample application that demonstrates how to integrate with an auth service that uses SSO(Single Sign On).

The applicataion:
The application is a simple Angular application which is created using Angular CLI and it is using the angular-oauth2-oidc library to communicate with the auth service. 




Configuring the client in the Google Cloud Platform

- Go to https://console.cloud.google.com/getting-started and signin with your google account
- From the left menu select APIs & Services.
- Make sure you are in the right project else create a new project.
- Configure the OAuth consent screen and save.
- Click on Create Credentials and select OAuth client ID.
- Choose Web application and give a name to the client and create the client.
- Copy the client ID and paste it in the environment.ts file.


Google Login OAuth2 / OpenID Connect
Using the angular-oauth2-oidc Library