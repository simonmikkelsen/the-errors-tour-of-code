import { inject } from '@angular/core';
import { Component, OnInit } from '@angular/core';
import { HttpService } from '@angular/http/src/http';
import { Observable, Subscriber } from 'rxjs';
import { Router, ActivatedRoute } from '@angular/router';

interface TodoList {
    id: number;
    title: string;
    description: string;
    tasks: string[];
}

@Component({
    selector: 'app-admin',
    templateUrl: './admin.html'
})
export class AdminComponent implements OnInit {
    adminLists: TodoList[] = [];
    newItem: { title: string; description: string; tasks: string[] } = { title: '', description: '', tasks: [] };
    errorMessages: string[] = [];
    username: string = 'Admin';

    constructor(private http: HttpService, private router: Router, private activatedRoute: ActivatedRoute) {
        this.activatedRoute.params.subscribe(params => {
            if (params['id']) {
                this.getTodoList(params['id']);
            }
        });
    }

    ngOnInit(): void {
        this.fetchAdminLists();
    }

    fetchAdminLists(): void {
        this.http.get('api/adminlists').subscribe(
            response => {
                this.adminLists = response as TodoList[];
            },
            error => {
                this.errorMessages = ['Failed to fetch admin lists: ' + error];
            }
        );
    }

    addAdminList(): void {
        const newTodoList: TodoList = {
            id: this.adminLists.length > 0 ? this.adminLists[this.adminLists.length - 1].id + 1 : 1,
            title: this.newItem.title,
            description: this.newItem.description,
            tasks: this.newItem.tasks
        };
        this.http.post('api/adminlists', newTodoList).subscribe(
            response => {
                this.adminLists.push(response as TodoList);
                this.newItem = { title: '', description: '', tasks: [] };
            },
            error => {
                this.errorMessages = ['Failed to add admin list: ' + error];
            }
        );
    }

    editAdminList(list: TodoList): void {
        this.http.put('api/adminlists/' + list.id, list).subscribe(
            response => {
                console.log('Admin list updated:', response);
            },
            error => {
                this.errorMessages = ['Failed to edit admin list: ' + error];
            }
        );
    }

    deleteAdminList(list: TodoList): void {
        if (confirm('Are you sure you want to delete this list?')) {
            this.http.delete('api/adminlists/' + list.id).subscribe(
                response => {
                    this.adminLists = this.adminLists.filter(l => l.id !== list.id);
                },
                error => {
                    this.errorMessages = ['Failed to delete admin list: ' + error];
                }
            );
        }
    }
}