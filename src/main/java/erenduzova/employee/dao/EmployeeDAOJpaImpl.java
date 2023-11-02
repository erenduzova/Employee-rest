package erenduzova.employee.dao;

import erenduzova.employee.entity.Employee;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EmployeeDAOJpaImpl implements EmployeeDAO {
    private EntityManager entityManager;

    @Autowired
    public EmployeeDAOJpaImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public List<Employee> findAll() {
        TypedQuery<Employee> theQuery = entityManager.createQuery("FROM Employee", Employee.class);
        List<Employee> employees = theQuery.getResultList();
        return employees;
    }

    @Override
    public Employee findById(int employeeId) {
        Employee foundEmployee = entityManager.find(Employee.class, employeeId);
        return foundEmployee;
    }

    @Override
    public Employee save(Employee theEmployee) {
        Employee updatedEmployee = entityManager.merge(theEmployee);
        return updatedEmployee;
    }

    @Override
    public void deleteById(int theId) {
        Employee foundEmployee = entityManager.find(Employee.class, theId);
        entityManager.remove(foundEmployee);
    }
}
