import { NgModule, ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule, NoPreloading } from '@angular/router';
import {CustomerComponent} from './Customer/Customer.component';
import{LoginComponent} from './Customer/Login.Component';
import{ProductComponent} from './Product/Product.Component';
import {UpdateComponent} from './Customer/update.component';
import {AddProductComponent} from './Product/addProduct.component';
const routes: Routes = [
  
  
  {
    path:'signup', component:CustomerComponent
  },
  {
    path:'signin',component:LoginComponent
  },
  {
    path:'Product',component:ProductComponent
  },
  {
    path:'update',component:UpdateComponent
  },
  {
    path:'addProduct',component:AddProductComponent
  }

  
  

];



export const APP_ROUTING: ModuleWithProviders = RouterModule.forRoot(routes, {
  preloadingStrategy: NoPreloading,
});