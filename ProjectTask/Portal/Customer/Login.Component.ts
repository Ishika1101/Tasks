import { Component,OnInit } from '@angular/core';
import {FormGroup,FormBuilder, Validators} from '@angular/forms';
import { HttpClient, HttpParams} from '@angular/common/http';
import { Router } from '@angular/router';
@Component({
  selector: 'app-login',
  templateUrl: './Login.component.html',
 
})
export class LoginComponent implements OnInit{
    signinFormGroup:FormGroup;
    result:any;
constructor(private formbuilder:FormBuilder,private http:HttpClient,private router:Router)
  {}
  ngOnInit(){
    this.signinFormGroup=this.formbuilder.group({
        email:['',Validators.required],
        password:['',Validators.required],
      });
  
}
submit()
  {let params = new HttpParams();
    params = params.append('Email', this.signinFormGroup.value.email);
    params = params.append('Password', this.signinFormGroup.value.password);
    
    this.http.get('https://localhost:44340/Customer',{params:params}).subscribe(res=>{
        console.log(res);
        
        if(res=="Login successful")
        {
            alert("Login successfull");
        }
        else
        {
            
            alert("Login Failed");
        }

    })
      

  }
}
