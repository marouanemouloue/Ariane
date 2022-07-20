package com.project.Ariane.api.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.Ariane.api.Entity.Anomalie;
import com.project.Ariane.api.Repositories.AnomalieRepository;

@Service
public class anomalieService {

	@Autowired
	AnomalieRepository repo;
	
	
	public List<Anomalie> getAll(){
		System.out.println(repo.findAll());
		return repo.findAll();
	}
}

