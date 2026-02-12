-- PARTE 1: CRIANDO AS TABELAS
CREATE TABLE IF NOT EXISTS Livros (ISBN VARCHAR(20) PRIMARY KEY, titulo VARCHAR(100), autor VARCHAR(100), ano_publicacao INT);
CREATE TABLE IF NOT EXISTS Membros (ID_MEMBRO INT PRIMARY KEY, nome VARCHAR(100), endereco VARCHAR(100), cidade VARCHAR(50));
CREATE TABLE IF NOT EXISTS Emprestimos (ID_EMPRESTIMO INT PRIMARY KEY, ISBN VARCHAR(20), ID_MEMBRO INT, data_emprestimo DATE, data_devolucao DATE, FOREIGN KEY (ISBN) REFERENCES Livros(ISBN), FOREIGN KEY (ID_MEMBRO) REFERENCES Membros(ID_MEMBRO));

-- PARTE 2: INSERINDO OS DADOS (SÓ SE NÃO EXISTIREM)
INSERT OR IGNORE INTO Livros VALUES ('978-3-16-148410-0', 'O Senhor dos Anéis', 'J.R.R. Tolkien', 1954), ('978-0-262-54143-2', 'A Arte da Guerra', 'Sun Tzu', 500), ('978-0-06-112008-4', 'O Sol é Para Todos', 'Harper Lee', 1960);
INSERT OR IGNORE INTO Membros VALUES (1, 'ANA SILVA', 'RUA DOS SONHOS', 'SÃO PAULO'), (2, 'CARLOS PEREIRA', 'AVENIDA LIBERDADE', 'RIO DE JANEIRO'), (3, 'MARIA OLIVEIRA', 'RUA DA PAZ', 'NATAL');
INSERT OR IGNORE INTO Emprestimos VALUES (1, '978-3-16-148410-0', 1, '2023-01-10', '2023-01-17'), (2, '978-0-262-54143-2', 2, '2023-01-12', '2023-01-19'), (3, '978-0-06-112008-4', 3, '2023-01-15', NULL);

-- PARTE 3: CONSULTAS (RESPOSTAS DA ATIVIDADE)
-- a) Livros em SP
SELECT L.titulo FROM Livros L JOIN Emprestimos E ON L.ISBN = E.ISBN JOIN Membros M ON E.ID_MEMBRO = M.ID_MEMBRO WHERE M.cidade = 'SÃO PAULO';
-- c) Não devolveram (NULL)
SELECT M.nome FROM Membros M JOIN Emprestimos E ON M.ID_MEMBRO = E.ID_MEMBRO WHERE E.data_devolucao IS NULL;

-- b) Número de empréstimos por cada membro
SELECT M.nome, COUNT(E.ID_EMPRESTIMO) as total FROM Membros M LEFT JOIN Emprestimos E ON M.ID_MEMBRO = E.ID_MEMBRO GROUP BY M.nome;

-- d) Livros publicados antes do ano 2000
SELECT COUNT(*) as total_antigos FROM Livros WHERE ano_publicacao < 2000;

-- e) Livros que ainda não foram emprestados
SELECT L.titulo FROM Livros L LEFT JOIN Emprestimos E ON L.ISBN = E.ISBN WHERE E.ID_EMPRESTIMO IS NULL;

-- f) Livro mais emprestado
SELECT L.titulo FROM Livros L JOIN Emprestimos E ON L.ISBN = E.ISBN GROUP BY L.titulo ORDER BY COUNT(E.ID_EMPRESTIMO) DESC LIMIT 1;