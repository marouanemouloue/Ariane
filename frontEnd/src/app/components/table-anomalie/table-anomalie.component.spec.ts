import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TableAnomalieComponent } from './table-anomalie.component';

describe('TableAnomalieComponent', () => {
  let component: TableAnomalieComponent;
  let fixture: ComponentFixture<TableAnomalieComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TableAnomalieComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(TableAnomalieComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
