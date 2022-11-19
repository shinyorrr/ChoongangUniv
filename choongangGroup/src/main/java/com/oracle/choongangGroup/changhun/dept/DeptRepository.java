package com.oracle.choongangGroup.changhun.dept;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.oracle.choongangGroup.changhun.JPA.Dept;

public interface DeptRepository extends JpaRepository<Dept, Long>{
}
