-- Criar o banco de dados
CREATE DATABASE IF NOT EXISTS clinica_sistema
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

USE clinica_sistema;

-- Tabela especialidade
CREATE TABLE IF NOT EXISTS especialidade (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(45) NULL
) ENGINE=InnoDB;

-- Tabela medico
CREATE TABLE IF NOT EXISTS medico (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(45) NULL,
  crm VARCHAR(45) NULL,
  especialidade_id INT NOT NULL,
  CONSTRAINT fk_medico_especialidade
    FOREIGN KEY (especialidade_id)
    REFERENCES especialidade (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB;

-- Tabela paciente
CREATE TABLE IF NOT EXISTS paciente (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(45) NULL,
  cpf VARCHAR(45) NULL
) ENGINE=InnoDB;

-- Tabela agendamento
CREATE TABLE IF NOT EXISTS agendamento (
  id INT AUTO_INCREMENT PRIMARY KEY,
  datahora DATETIME NULL,
  paciente_id INT NOT NULL,
  medico_id INT NOT NULL,
  status INT NULL,
  CONSTRAINT fk_agendamento_paciente
    FOREIGN KEY (paciente_id)
    REFERENCES paciente (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_agendamento_medico
    FOREIGN KEY (medico_id)
    REFERENCES medico (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB;
