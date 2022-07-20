package com.project.Ariane.api.Controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.Ariane.api.Entity.Anomalie;
import com.project.Ariane.api.Services.anomalieService;

@RestController
@RequestMapping("/anomalie")
public class AnomalieController {

	@Autowired
	anomalieService srv;
	
	@GetMapping("/all")
	public List<Anomalie> get() {
		System.out.print("fef");
		return	null;
	}
}
