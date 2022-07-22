import { Component, OnInit } from '@angular/core';
import { NavigationService } from 'src/app/services/navigation.service';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {

  constructor(private navService: NavigationService) { }

  ngOnInit(): void {
  }
  toggleSideNav() {
    this.navService.setShowNav(true);
  }
}
