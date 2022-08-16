import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ApiService } from 'src/app/services/api.service';

@Component({
  selector: 'app-ajout-anomalie',
  templateUrl: './ajout-anomalie.component.html',
  styleUrls: ['./ajout-anomalie.component.css']
})
export class AjoutAnomalieComponent implements OnInit {
  dataSourceTypes: any;
  dataSourceStatus: any;
  dataSourceActivites: any;
  dataSourceFlux: any;
  dataSourceOperateurs: any;
  imgFile: string;

  op:string;
  dateA:string;
  flux:string;
  activite:string;
  type:string;
  

   uploadForm = new FormGroup({
    name: new FormControl('', [Validators.required]),
    file: new FormControl('', [Validators.required]),
    imgSrc: new FormControl('', [Validators.required])
  });

  constructor(private api: ApiService) { }

  ngOnInit(): void {
    this.api.getAnomalieTypes().subscribe(data => { this.dataSourceTypes = data; })
    this.api.getAnomalieStatus().subscribe(data => { this.dataSourceStatus = data; })
    this.api.getFlux().subscribe(data => { this.dataSourceFlux = data; })
    this.api.getOperateurs().subscribe(data => { this.dataSourceOperateurs = data; })
    this.api.getActivities().subscribe(data => { this.dataSourceActivites = data })
    console.log(this.activite)
  }
  get uf(){
    return this.uploadForm.controls;
  }
  onImageChange(e:Event) {
    const reader = new FileReader();
    
  }
  

}
