import { Component,OnInit } from '@angular/core';
import {FormGroup,FormBuilder, Validators} from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import {Router} from '@angular/router';
@Component({
  selector: 'app-addProduct',
  templateUrl: './addProduct.component.html',
 
})
export class AddProductComponent implements OnInit{
  productFormGroup:FormGroup;
constructor(private formbuilder:FormBuilder,private http:HttpClient,private router:Router)
  {}
  ngOnInit(){
    this.productFormGroup=this.formbuilder.group({
      pname:['',Validators.required],
      code:['',Validators.required],
      price:['',Validators.required],
      
      brand:['',Validators.required],
      status:['',Validators.required],
     
    
      });
  
}

add()
{
  this.http.post<any>('https://localhost:44340/Product',{ProductName:this.productFormGroup.value.pname,ProductCode:this.productFormGroup.value.code,ProductPrice:this.productFormGroup.value.price,
  Brand:this.productFormGroup.value.brand,ProductStatus:this.productFormGroup.value.status}).subscribe(res=>{
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
