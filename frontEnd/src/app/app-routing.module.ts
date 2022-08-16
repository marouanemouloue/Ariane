import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AjoutAnomalieComponent } from './pages/ajout-anomalie/ajout-anomalie.component';
import { HomePageComponent } from './pages/home-page/home-page.component';
import { SuiviAnomalieComponent } from './pages/suivi-anomalie/suivi-anomalie.component';
const routes: Routes = [
  { path: 'home', component: HomePageComponent },
  { path: 'suivi', component: SuiviAnomalieComponent },
  { path: 'ajout', component: AjoutAnomalieComponent },


  { path: '',   redirectTo: '/home', pathMatch: 'full' }, // redirect to `first-component`


];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
