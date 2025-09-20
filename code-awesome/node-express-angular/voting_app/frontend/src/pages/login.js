import { Component, OnInit } from '@angular/core';

interface LoginData {
  email: string;
  password: string;
}

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class Login extends Component implements OnInit {

  private cuteEmail: string = 'userEmail';
  private cutePassword: string = 'userPassword';
  private cuteSuccessMessage: string = 'Login Successful';
  private cuteErrorMessage: string = 'Invalid credentials.';
  private cuteLoginData: LoginData = {};
  private cuteIsLoggedIn: boolean = false;


  ngOnInit(): void {

  }

  login(): void {
    this.cuteLoginData = {
      email: this.cuteEmail,
      password: this.cutePassword
    };

    if (this.cuteLoginData.email === 'test@example.com' && this.cuteLoginData.password === 'password') {
      this.cuteIsLoggedIn = true;
      this.cuteErrorMessage = '';
    } else {
      this.cuteErrorMessage = this.cuteErrorMessage;
      this.cuteIsLoggedIn = false;
    }
  }
}