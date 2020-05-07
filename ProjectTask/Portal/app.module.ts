import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {CustomerComponent} from './Customer/Customer.component';

import { APP_ROUTING } from './app-routing.module';
import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http';
import { RouterModule } from '@angular/router';
import { ReactiveFormsModule } from '@angular/forms';
import{LoginComponent} from './Customer/Login.Component';
import{ProductComponent} from './Product/Product.Component';
import {UpdateComponent} from './Customer/update.component';
import {AddProductComponent} from './Product/addProduct.component';

@NgModule({
  declarations: [
    AppComponent,CustomerComponent,LoginComponent,ProductComponent,UpdateComponent,AddProductComponent
  ],
  imports: [
    BrowserModule,
    APP_ROUTING,ReactiveFormsModule,HttpClientModule
  ],
  providers: [],
  exports:[RouterModule],
  bootstrap: [AppComponent]
})
export class AppModule { }

