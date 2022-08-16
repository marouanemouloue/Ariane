import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TostUpdateComponent } from './tost-update.component';

describe('TostUpdateComponent', () => {
  let component: TostUpdateComponent;
  let fixture: ComponentFixture<TostUpdateComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TostUpdateComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(TostUpdateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
