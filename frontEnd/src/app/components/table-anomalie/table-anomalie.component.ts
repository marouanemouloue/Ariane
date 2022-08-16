import { LiveAnnouncer } from '@angular/cdk/a11y';
import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator, PageEvent } from '@angular/material/paginator';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatSort, Sort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { ApiService } from 'src/app/services/api.service';
import { ToastSuppressionComponent } from '../toast-suppression/toast-suppression.component';
import { anomalieType } from 'src/app/models/anomalieType';
import { AnomalieElement } from 'src/app/models/AnomalieElement';
import { TostUpdateComponent } from '../tost-update/tost-update.component';
import { filter } from 'rxjs';
import { FiltreVal } from 'src/app/models/filtre';


@Component({
  selector: 'app-table-anomalie',
  templateUrl: './table-anomalie.component.html',
  styleUrls: ['./table-anomalie.component.css']
})
export class TableAnomalieComponent implements OnInit {
  displayedColumns: string[] = [
    "id",
    "nomOperateur",
    "prenomOperateur",
    "nomUA",
    "flux",
    "activite",
    "typeAnomalie",
    "anomalieStatut",
    "dateAnomalie",
    "nbrPoints",
    " "]
  pageEvent: PageEvent;
  length = 5;
  pageSize = 10;
  pageSizeOptions: number[] = [5, 10];
  idButton: number;
  ELEMENT_DAT: AnomalieElement[] = [];
  dataSource = new MatTableDataSource(this.ELEMENT_DAT);
  dataSourceTypes: any;
  dataSourceStatus: any;
  dataSourceActivites: any;
  dataSourceFlux: any;
  dataSourceOperateurs: any;
  id: number;

  @ViewChild(MatPaginator) paginator: MatPaginator
  @ViewChild(MatSort) sort: MatSort;
  durationInSeconds = 3000;
  modify = false;

  constructor(private _liveAnnouncer: LiveAnnouncer, private api: ApiService, private rout: Router, private _snackBar: MatSnackBar) {
    this.getData()

  }
  ngOnInit(): void {
  }


  ngAfterViewInit() {
    this.dataSource.sort = this.sort;
    this.dataSource.paginator = this.paginator;
    console.log(this.dataSource);

    this.api.getAnomalieTypes().subscribe(data => { this.dataSourceTypes = data; })

    this.api.getAnomalieStatus().subscribe(data => { this.dataSourceStatus = data; })

    this.api.getFlux().subscribe(data => { this.dataSourceFlux = data; })
    this.api.getOperateurs().subscribe(data => { this.dataSourceOperateurs = data; })
    this.api.getActivities().subscribe(data => { this.dataSourceActivites = data })
    this.dataSource.filterPredicate = function customFilter2(data, filter: string): boolean { return (data.nomOperateur == filter)  }
    /*this.dataSource.filterPredicate = (data, filter: string) => {
      // A sample filter logic - joining both filters with AND.
      return (this.filtreObj.arech ) &&
        (data.nomOperateur == filter) &&
        (data.flux == filter)
    };*/

  }

  getData() {

    let resp = this.api.getTableData();
    resp.subscribe(report => {
      this.dataSource.data = report as AnomalieElement[];
      this.apiResponse = report as AnomalieElement[];
    })

  }

  announceSortChange(sortState: Sort) {
    if (sortState.direction) {
      this._liveAnnouncer.announce(`Sorted ${sortState.direction}ending`);
    } else {
      this._liveAnnouncer.announce('Sorting cleared');
    }

  }

  setPageSizeOptions(setPageSizeOptionsInput: string) {
    if (setPageSizeOptionsInput) {
      this.pageSizeOptions = setPageSizeOptionsInput.split(',').map(str => +str);
    }
  }

  modifier(el: AnomalieElement) {

    console.log(el.isEdit)
    console.log(el)
    el.isEdit = true

  }
  annulerModif() {
    this.modify = false;
  }
  supprimer(id: number, object: AnomalieElement) {
    console.log(object + "id" + id)

    this.api.update(id, object).subscribe(response => {
      this.getData();
      this.openToastSupp();
    },
      error => {
        console.log(error);
      });
  }

  openToastSupp() {
    this._snackBar.openFromComponent(ToastSuppressionComponent, {
      duration: this.durationInSeconds,
    });
  }
  typt: string;
  actType: number;
  OnSubmit(id: number, apiForm: any) {



    for (var tt of this.dataSourceTypes) {
      if (tt.anoTypeNom == apiForm.value.typeAnomalie) {
        this.typt = tt.ecartNom;
        this.actType = tt.activite.id;
        console.log(tt)
      }
    }
    console.log(this.actType + " activite");
    if (apiForm.value.nomUA == "") apiForm.value.nomUA = "null";
    this.api.updateAno(id, apiForm.value.nomOperateur, apiForm.value.prenomOperateur, apiForm.value.nomUA, this.typt, this.actType, apiForm.value.anomalieStatut, apiForm.value.dateAnomalie, apiForm.value).subscribe(response => {
      this.getData();
      this.openToastModif();
    },
      error => {
        console.log(error);
      });
  }
  openToastModif() {
    this._snackBar.openFromComponent(TostUpdateComponent, {
      duration: this.durationInSeconds,
    });
  }
  getId(id: number) {
    this.id = id;
  }

  //Filters Functions-------------------------------------------------------------------------



  operateurs: string;
  apiResponse: any = [];
  filterSelectObj: any = [];
  filterValues = {};
  flux: string;
  filtreObj: FiltreVal = {
    arech: null,
    operateurs: null,
    flux: null,
    activite: null,
    statut: null,
    stDate: null,
    endDate: null,
  };


  applyFilter(event: Event) {
    let filterValue = (event.target as HTMLInputElement).value;
    this.filtreObj.arech = filterValue;
    this.dataSource.filter = this.filtreObj.arech;
  }
  onChangeOp(event: Event) {

    let filterValue = (event.target as HTMLInputElement).value;
    // this.dataSource. = filterValue.trim().toLowerCase();

    this.filtreObj.operateurs = filterValue;
    //  this.dataSource.filterPredicate = function customFilter(data , filter:string ): boolean {return (data.nomOperateur==filter) }


    //this.dataSource = new MatTableDataSource (this.dataSource.filteredData);

    this.dataSource.filter = this.filtreObj.operateurs;

  }
  updatingDataSource() {
    if (this.filtreObj.arech != null) this.dataSource.filter = this.filtreObj.arech.trim().toLowerCase();
    //this.dataSource.filter = this.filtreObj.operateurs;
    //this.dataSource.filter=this.filtreObj.flux;
    console.log(this.filtreObj)

  }
  onChangeFlux(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    // this.dataSource. = filterValue.trim().toLowerCase();
    //this.dataSource.filter = filterValue;
    //this.dataSource = new MatTableDataSource (this.dataSource.filteredData);
    this.filtreObj.flux = filterValue;
    this.dataSource.filter = this.filtreObj.flux;
    console.log(this.dataSource + " frfrv " + this.filtreObj.flux)
  }
  resetFilters() {

  }
}


