import { AuthConfig, OAuthService } from 'angular-oauth2-oidc';
import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';
import { environment } from '../environments/environment';


  const OAuthConfig: AuthConfig = {
  issuer: 'https://accounts.google.com',
  strictDiscoveryDocumentValidation: false,
  redirectUri: window.location.origin,
  clientId: environment.clientId,
  }


export interface UserInfo {
info: {
  email: string,
  name: string,
  picture: string
}
}

@Injectable({
  providedIn: 'root'
})
export class GoogleApiService {
 
  userProfileSubject = new Subject<UserInfo>();

  constructor(private readonly oAuthService: OAuthService) {
    oAuthService.configure(OAuthConfig)
    oAuthService.logoutUrl = 'https://accounts.google.com/logout';
    oAuthService.loadDiscoveryDocument().then(() => {
      oAuthService.tryLoginImplicitFlow().then(() => {
        if (!oAuthService.hasValidAccessToken()) {
          oAuthService.initLoginFlow();
        } else { 
          oAuthService.loadUserProfile().then((userProfile) => {
            this.userProfileSubject.next(userProfile as UserInfo);
          })
        }
      })
    })
  }
  isLoggedIn(): boolean {
    return this.oAuthService.hasValidAccessToken();
  }
  signOut() {
    this.oAuthService.logOut();
  }
}