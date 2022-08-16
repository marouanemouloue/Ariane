import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ToastSuppressionComponent } from './toast-suppression.component';

describe('ToastSuppressionComponent', () => {
  let component: ToastSuppressionComponent;
  let fixture: ComponentFixture<ToastSuppressionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ToastSuppressionComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ToastSuppressionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
