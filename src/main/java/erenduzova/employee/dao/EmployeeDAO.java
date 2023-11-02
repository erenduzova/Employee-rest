package erenduzova.employee.dao;

import erenduzova.employee.entity.Employee;

import java.util.List;

public interface EmployeeDAO {

    List<Employee> findAll();

}
