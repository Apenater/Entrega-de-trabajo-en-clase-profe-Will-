
CREATE DATABASE empresa_db;
USE empresa_db;

CREATE TABLE departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_departamento VARCHAR(255) NOT NULL
);

CREATE TABLE empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
);

INSERT INTO departamentos (nombre_departamento) VALUES ('Tecnología');
INSERT INTO departamentos (nombre_departamento) VALUES ('Recursos Humanos');
INSERT INTO departamentos (nombre_departamento) VALUES ('Finanzas');

INSERT INTO empleados (nombre, salario, departamento_id) VALUES ('Juan Pérez', 30000, 1);
INSERT INTO empleados (nombre, salario, departamento_id) VALUES ('Ana Gómez', 35000, 1);
INSERT INTO empleados (nombre, salario, departamento_id) VALUES ('Luis Rodríguez', 25000, 2);
INSERT INTO empleados (nombre, salario, departamento_id) VALUES ('Carlos López', 40000, 3);
INSERT INTO empleados (nombre, salario, departamento_id) VALUES ('María Fernández', 28000, 2);

SELECT COUNT(*) FROM empleados;

SELECT SUM(salario) FROM empleados;

SELECT AVG(salario) FROM empleados;

SELECT MIN(salario) FROM empleados;

SELECT MAX(salario) FROM empleados;

SELECT empleados.nombre, departamentos.nombre_departamento
FROM empleados
INNER JOIN departamentos ON empleados.departamento_id = departamentos.id;

SELECT empleados.nombre, departamentos.nombre_departamento
FROM empleados
LEFT JOIN departamentos ON empleados.departamento_id = departamentos.id;

SELECT empleados.nombre, departamentos.nombre_departamento
FROM empleados
RIGHT JOIN departamentos ON empleados.departamento_id = departamentos.id;

SELECT nombre, salario
FROM empleados
WHERE salario > (SELECT AVG(salario) FROM empleados);

SELECT nombre_departamento
FROM departamentos
WHERE id IN (
    SELECT departamento_id
    FROM empleados
    GROUP BY departamento_id
    HAVING COUNT(*) > 10
);
