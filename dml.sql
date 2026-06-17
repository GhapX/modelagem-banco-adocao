-- Inserindo dados iniciais
INSERT INTO Usuario (Nome, Endereco, Email, Contato) 
VALUES 
('Maria Silva', 'Rua das Flores, 342', 'maria.silva@email.com', '11987654321'),
('Carlos Santos', 'Avenida Paulista, 1578', 'carlos.santos@gmail.com', '21998765432'),
('Ana Costa', 'Rua 25 de Março, 567', 'ana.costa@hotmail.com', '31991234567'),
('Roberto Oliveira', 'Avenida Getúlio Vargas, 890', 'r.oliveira@email.com', '47985432109'),
('Juliana Ferreira', 'Rua São João, 234', 'juliana.f@gmail.com', '85987654321');

INSERT INTO Animal (Nome, Especie, Raca, Idade, Sexo, Status, idUsuario) 
VALUES 
('Caramelo', 'Cachorro', 'SRD', 2, 'M', 'Disponível', 1),
('Luna', 'Gato', 'Siamês', 1, 'F', 'Disponível', 2),
('Max', 'Cachorro', 'Labrador', 3, 'M', 'Disponível', 3),
('Bella', 'Gato', 'Persa', 2, 'F', 'Disponível', 4),
('Rex', 'Cachorro', 'Pastor Alemão', 4, 'M', 'Disponível', 5);

INSERT INTO Vacinas (Nome_vacina, Data_aplicacao, idAnimal) 
VALUES 
('Antirrábica', '2025-10-15', 1),
('V10', '2025-11-20', 1),
('Quádrupla Felina', '2025-12-05', 2),
('Antirrábica', '2025-09-10', 3),
('V10', '2025-10-05', 3),
('Quádrupla Felina', '2025-11-15', 4),
('Antirrábica', '2025-08-20', 5),
('V10', '2025-09-15', 5);

-- Animais disponíveis e cadastradores
SELECT a.Nome AS Animal, a.Especie, a.Idade, u.Nome AS Cadastrado_Por, u.Contato
FROM Animal a
JOIN Usuario u ON a.idUsuario = u.id
WHERE a.Status = 'Disponível';

-- Fluxo de adoção: solicitação, formalização e atualização
-- 1. Solicitação de adoção
INSERT INTO Solicitacao_de_adocao (Data_hora, Status, idUsuario, idAnimal) 
VALUES ('2026-06-17 10:30:00', 'Aprovada', 2, 1);

-- 2. Formalização da adoção
INSERT INTO Adocao (Data_adocao, idSolicitacao_de_adocao) 
VALUES ('2026-06-18', 1);

-- 3. Atualizar status do animal
UPDATE Animal 
SET Status = 'Adotado' 
WHERE Id_animal = 1;
