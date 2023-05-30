package com.webproject.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.webproject.entity.Delivery;

@Repository
public interface DeliveryRepo extends JpaRepository<Delivery, Long> {
	Optional<Delivery> findByName(String name);
}
