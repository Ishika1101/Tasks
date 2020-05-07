import { Component,OnInit } from '@angular/core';
import {FormGroup,FormBuilder} from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
@Component({
  selector: 'app-Product',
  templateUrl: './Product.component.html',
 
})
export class ProductComponent implements OnInit{
 result:any;
 id:any;
 searchgroup:FormGroup
constructor(private http:HttpClient,private formbuilder:FormBuilder)
  {}                                                                
  ngOnInit(){

    this.searchgroup=this.formbuilder.group({
        pname:['']
    })
    this.http.get<any>('https://localhost:44340/Product').subscribe(res=>{
        this.result=res;
        console.log(this.result);
        
    });
   
}
delete(id)
{
    console.log(id);
    this.http.delete<any>('https://localhost:44340/Product/'+id).subscribe(res=>{
        this.result=res;
        console.log(this.result);
        window.location.reload();
    });
}
Search()
{
    this.http.get<any>('https://localhost:44340/Search').subscribe(res=>{
        this.result=res;
        console.log(this.result);
        
    });

}
}
  



