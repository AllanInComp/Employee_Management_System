package com.tyy.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name="manager_employee_relation")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ManagerEmployeeRelation {
	@Id
	private int id;
	
	@NotEmpty
	@Column(name="manager_id")
	private String manager_id;
	
	@NotEmpty
	@Column(name="employee_id")
	private String employee_id;
}