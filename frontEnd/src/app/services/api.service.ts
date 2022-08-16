import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
const baseUrl = 'http://localhost:8080/anomalie';
@Injectable({
  providedIn: 'root'
})
export class ApiService {

  constructor(private http:HttpClient) { }
  getTableData() {
    console.log(this.http.get(baseUrl+"/anomalieTable"))
    return this.http.get(baseUrl+"/anomalieTable");
  }
  update(id:number,data: any) {
    return this.http.put(baseUrl+"/annulerAno/"+id,data);
  }
  getAnomalieTypes(){
    return this.http.get(baseUrl+"/allTypes");

  }
  getAnomalieStatus(){
    return this.http.get(baseUrl+"/Status")
  }
  getFlux(){
    return this.http.get(baseUrl+"/flux")
  }
  getOperateurs(){
    return this.http.get(baseUrl+"/operateurs")

  }
  updateAno(id:number,nom:string,prenom:string,ua:string,type:string,idAct:number,statut:string,date:string,data:any) {

   
   
    var newtype = type.replace(" ", "&"); 
    return this.http.put(baseUrl+"/modifierAno/"+id+"/"+nom+"/"+prenom+"/"+ua+"/"+newtype+"/"+idAct+"/"+statut+"/"+date,data);
  }
  getActivities(){
    return this.http.get(baseUrl+"/Activite");

  }
}
