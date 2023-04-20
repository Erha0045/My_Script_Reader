import { Component } from '@angular/core';
import { GoogleApiService, UserInfo } from './google-api.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'my-SSO-app';

  userInfo?: UserInfo;

  constructor(private readonly googleApiService: GoogleApiService) {
    googleApiService.userProfileSubject.subscribe( info  => {
      this.userInfo = info;
    })
  }

isLoggedIn(): boolean {
  return this.googleApiService.isLoggedIn()
  }

logout() {
  this.googleApiService.signOut();
  }
}
