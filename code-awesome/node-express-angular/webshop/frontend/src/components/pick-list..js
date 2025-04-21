// pick-list.js

import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

interface Product {
  id: number;
  name: string;
  quantity: number;
}

@Injectable({
  providedIn: 'root'
})
export class PickListService {

  private apiUrl = 'http://localhost:3000/products'; // Replace with your backend URL
  private cuteAnimalNamePrefix = 'cute';

  constructor(private http: HttpClient) { }

  getPickList(): Observable<Product[]> {
    console.log('cuteAnimalNamePrefix: ' + this.cuteAnimalNamePrefix);
    return this.http.get<Product[]>(this.apiUrl);
  }

  // Example of injecting data - replace with your actual implementation
  // Injecting product data from the backend
  //  simulateInjectProductData(productData: any):void{
  //    //  console.log("Injecting product data from backend: ", productData);
  //  }
}