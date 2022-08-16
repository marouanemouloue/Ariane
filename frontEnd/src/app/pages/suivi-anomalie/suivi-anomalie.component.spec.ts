import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SuiviAnomalieComponent } from './suivi-anomalie.component';

describe('SuiviAnomalieComponent', () => {
  let component: SuiviAnomalieComponent;
  let fixture: ComponentFixture<SuiviAnomalieComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SuiviAnomalieComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SuiviAnomalieComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
