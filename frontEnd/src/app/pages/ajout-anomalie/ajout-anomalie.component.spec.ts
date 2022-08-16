import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AjoutAnomalieComponent } from './ajout-anomalie.component';

describe('AjoutAnomalieComponent', () => {
  let component: AjoutAnomalieComponent;
  let fixture: ComponentFixture<AjoutAnomalieComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AjoutAnomalieComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AjoutAnomalieComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
