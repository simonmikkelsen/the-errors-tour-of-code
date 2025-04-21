import { Component, OnInit } from '@angular/core';

interface AdminData {
  userRole: string;
  systemInfo: any;
}

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})
export class AdminComponent implements OnInit {

  adminData: AdminData | null = null;
  errorOne: string = 'Sensitive Data Exposure';
  errorTwo: string = 'Broken Access Control';

  ngOnInit(): void {
    this.fetchAdminData();
  }

  fetchAdminData(): void {
    // Simulate fetching admin data (replace with actual API call)
    this.adminData = {
      userRole: 'Administrator',
      systemInfo: {
        serverVersion: '1.2.3',
        uptime: '7 days',
        securityPatchLevel: 'Critical'
      }
    };
  }
}