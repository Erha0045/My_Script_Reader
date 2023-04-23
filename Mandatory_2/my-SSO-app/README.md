# Mandatory 2 part 1 Integrate with an auth service

This is a sample application that demonstrates how to integrate with an auth service that uses SSO(Single Sign On).

## The application:
The application is a simple Angular application which is created using Angular CLI and it is using the angular-oauth2-oidc library to communicate with the auth service. 

## Different services for federated identities with their pros and cons:

### Microsoft Azure Active Directory (Azure AD):
**Pros:**

- Can be used to manage both cloud and on-premises resources
- Integrates with many Microsoft services, such as Office 365 and Dynamics CRM
- Supports a wide range of authentication protocols, including SAML and OpenID Connect.

**Cons:**

- Can be complex to set up and manage, especially for larger organizations
- May require additional licensing fees for certain features
- Some users may prefer not to use Microsoft services for identity management

### Okta:
**Pros:**
- Offers a wide range of pre-built integrations with popular SaaS applications
- Supports many authentication protocols, including SAML, OpenID Connect, and OAuth 2.0
- Offers a user-friendly interface for managing identities and access

**Cons:**
- Can be expensive, especially for larger organizations or those with complex requirements
- May require additional customization or development work to fully integrate with certain applications

### Google Cloud Identity

**Pros:**
- Integrates well with other Google services, such as G Suite and Google Cloud Platform
- Offers a user-friendly interface for managing identities and access
- Supports many authentication protocols, including SAML, OAuth 2.0, and OpenID Connect
- Offers a range of deployment options, including cloud and on-premises

**Cons:**
- May be less suitable for organizations that don't use Google services for all their resources
- Some features may require additional licensing fees or integration work


# The solution for the application:
I choosed to work with Google Cloud Identity because it is a user-friendly, identity management solution.
## Configuring the client in the Google Cloud Platform

- Go to https://console.cloud.google.com/getting-started and signin with your google account
- From the left menu select APIs & Services.
- Make sure you are in the right project else create a new project.
- Configure the OAuth consent screen and save.
- Click on Create Credentials and select OAuth client ID.
- Choose Web application and give a name to the client and create the client.
- Copy the client ID and paste it in the environment.ts file in your application.
