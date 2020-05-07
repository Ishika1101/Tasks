import { Component,OnInit } from '@angular/core';
import {FormGroup,FormBuilder, Validators} from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import {Router} from '@angular/router';
@Component({
  selector: 'app-update',
  templateUrl: './Update.component.html',
 
})
export class UpdateComponent implements OnInit{
  updateFormGroup:FormGroup;
constructor(private formbuilder:FormBuilder,private http:HttpClient,private router:Router)
  {}
  ngOnInit(){
    this.  updateFormGroup=this.formbuilder.group({
      fname:['',Validators.required],
      lname:['',Validators.required],
      email:['',Validators.required],
      
      mobileNumber:['',Validators.maxLength(10),Validators.minLength(10)],
      address:['',Validators.required],
      gender:['',Validators.required],
      dob:['',Validators.required]
    
      });
  
}
update()
  {
    this.http.put<any>('https://localhost:44340/Customer',{CustomerNumber:908,FirstName:this.updateFormGroup.value.fname,LastName:this.updateFormGroup.value.lname,Email:this.updateFormGroup.value.email,
    MobileNumber:this.updateFormGroup.value.mobileNumber,Address:this.updateFormGroup.value.address,Gender:this.updateFormGroup.value.gender,DOB:this.updateFormGroup.value.dob}).subscribe(res=>{
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
}
