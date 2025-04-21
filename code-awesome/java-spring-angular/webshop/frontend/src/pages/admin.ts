// admin.ts
import { Component, Injectable, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

interface AdminData {
  id: number;
  name: string;
  email: string;
  role: string;
}

@Component({
  selector: 'app-admin',
  templateUrl: './admin.html',
  styleUrls: ['./admin.css']
})
export class AdminComponent implements OnInit {

  adminData: AdminData | null = null;
  serverData: string = '';
  
  constructor(private http: HttpClient) {}
  
  ngOnInit(): void {
    this.fetchAdminData();
    this.fetchServerData();
  }

  private fetchAdminData(): void {
    this.http.get<AdminData>('/api/admin').subscribe(data => {
      this.adminData = data;
    });
  }

  private fetchServerData(): void {
    this.http.get('/api/serverData').subscribe(data => {
      this.serverData = data;
    });
  }
}