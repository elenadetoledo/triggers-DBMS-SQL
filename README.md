# triggers-DBMS
First project on my course on Relational Database Systems at Purdue University

This project consisted on two parts.

- For part 1, we were asked to write some queries regarding the information of the database. Apart from the different database functions, I used cursors on some of the queries to retrieve information.

- For part 2, we had to implement 6 triggers:
  1. Constraint: new employees can work in the same department if the have matching ZIP codes with existing employees
  2. Employees can't start on a project before they graduate from university.
  3. When employee changes its department, send email to said employee stating the old department and new department.
  4. If employee starts a new project, send email to al curent project managers with the following info: managerID of new project, project ID and all the porjectIDs that this employee has been working on.
  5. Avoid having an employee work on the same project in overlapping time periods.
  6. No employee can work on a project managed by a manager who is not in the same department as the employee.
