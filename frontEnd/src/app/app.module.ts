import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomePageComponent } from './pages/home-page/home-page.component';
import { NavbarComponent } from './components/navbar/navbar.component';
import { SidebarComponent } from './components/sidebar/sidebar.component';

import { FooterComponent } from './components/footer/footer.component';
import { SuiviAnomalieComponent } from './pages/suivi-anomalie/suivi-anomalie.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {  MatTableModule, _MatTableDataSource } from '@angular/material/table';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatSortModule } from '@angular/material/sort';
import { TableAnomalieComponent } from './components/table-anomalie/table-anomalie.component';
import { MatTableDataSource, MatTableDataSourcePaginator } from '@angular/material/table/table-data-source';
import { HttpClientModule } from '@angular/common/http';
import { FiltreComponent } from './components/filtre/filtre.component';
import { FormsModule } from '@angular/forms';
import {MatSnackBarModule} from '@angular/material/snack-bar';
import { ToastSuppressionComponent } from './components/toast-suppression/toast-suppression.component';
import { TostUpdateComponent } from './components/tost-update/tost-update.component';
import { AjoutAnomalieComponent } from './pages/ajout-anomalie/ajout-anomalie.component';

const materialModules = [
  MatTableModule,
  MatPaginatorModule,
  MatSortModule,
  MatPaginatorModule,
  MatSortModule,
  HttpClientModule,
  FormsModule,
  MatSnackBarModule

  
];
@NgModule({
  declarations: [
    AppComponent,
    HomePageComponent,
    NavbarComponent,
    SidebarComponent,
    FooterComponent,
    SuiviAnomalieComponent,
    TableAnomalieComponent,
    FiltreComponent,
    ToastSuppressionComponent,
    TostUpdateComponent,
    AjoutAnomalieComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    materialModules
   
  
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
