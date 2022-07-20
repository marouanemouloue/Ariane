package com.project.Ariane.api.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.Ariane.api.Entity.Anomalie;



@Repository
public interface AnomalieRepository extends JpaRepository<Anomalie,Integer> {

}
