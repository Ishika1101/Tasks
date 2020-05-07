import { Component,OnInit } from '@angular/core';
import {FormGroup,FormBuilder, Validators} from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import {Router} from '@angular/router';
@Component({
  selector: 'app-customer',
  templateUrl: './Customer.Component.html',
 
})
export class CustomerComponent implements OnInit{
  customerFormGroup:FormGroup;
constructor(private formbuilder:FormBuilder,private http:HttpClient,private router:Router)
  {}
  ngOnInit(){
    this.  customerFormGroup=this.formbuilder.group({
      fname:['',Validators.required],
      lname:['',Validators.required],
      email:['',Validators.required],
      password:['',Validators.required],
      Confirm:['',Validators.required],
      mobileNumber:['',Validators.maxLength(10),Validators.minLength(10)],
      address:['',Validators.required],
      gender:['',Validators.required],
      dob:['',Validators.required]
    
      });
  
}
Submit()
  {
    if(this.customerFormGroup.value.password==this.customerFormGroup.value.Confirm){
    this.http.post<any>('https://localhost:44340/Customer',{FirstName:this.customerFormGroup.value.fname,LastName:this.customerFormGroup.value.lname,Email:this.customerFormGroup.value.email,
    Password:this.customerFormGroup.value.password,ConfirmPassword:this.customerFormGroup.value.Confirm,MobileNumber:this.customerFormGroup.value.mobileNumber,Address:this.customerFormGroup.value.address,Gender:this.customerFormGroup.value.gender,DOB:this.customerFormGroup.value.dob}).subscribe(res=>{
        console.log(res);
        if(res.Status==200)
        {
          this.router.navigate(['/Product']);
        }
        else{
          alert("Please Fill Out all details");
        }
      });
    }
    else{
        alert("Password and confirm password not match");
    }
  }
}
