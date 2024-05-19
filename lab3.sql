USE master;
DROP DATABASE IF EXISTS SocialNetwork;
CREATE DATABASE SocialNetwork;
USE SocialNetwork;

-- �������� ������� �������������
CREATE TABLE ������������� (
    Id INT PRIMARY KEY IDENTITY,
    ��� NVARCHAR(50),
    ������� NVARCHAR(50),
    ������ NVARCHAR(10),
    ���� INT,
    ������� INT,
    ��� NVARCHAR(1)
);

-- �������� ������� �����
CREATE TABLE ����� (
    Id INT PRIMARY KEY IDENTITY,
    �������� NVARCHAR(100),
    ����� NVARCHAR(100),
    ���� NVARCHAR(50)
);

-- �������� ������� ������
CREATE TABLE ������ (
    Id INT PRIMARY KEY IDENTITY,
    �������� NVARCHAR(100),
    �������� NVARCHAR(100),
    ���� NVARCHAR(50)
);

-- �������� ������� ����������������
CREATE TABLE ���������������� (
    Id INT PRIMARY KEY IDENTITY,
    ������������Id INT,
    �����Id INT,
    FOREIGN KEY (������������Id) REFERENCES �������������(Id),
    FOREIGN KEY (�����Id) REFERENCES �����(Id)
);

-- �������� ������� ����������������
CREATE TABLE ���������������� (
    Id INT PRIMARY KEY IDENTITY,
    ������������Id INT,
    �����Id INT,
    FOREIGN KEY (������������Id) REFERENCES �������������(Id),
    FOREIGN KEY (�����Id) REFERENCES ������(Id)
);


-- ������� ������ � ������� �������������
INSERT INTO ������������� (���, �������, ������, ����, �������, ���)
VALUES 
('�����', '�������', '��-201', 2, 19, '�'),
('����', '������', '��-201', 2, 20, '�'),
('����', '��������', '��-201', 2, 19, '�'),
('�������', '��������', '��-201', 2, 21, '�'),
('�����', '��������', '��-201', 2, 20, '�'),
('�������', '������', '��-201', 2, 22, '�'),
('�����', '���������', '��-201', 2, 19, '�'),
('������', 'Ը�����', '��-201', 2, 20, '�'),
('��������', '���������', '��-201', 2, 21, '�'),
('������', '������', '��-201', 2, 22, '�');

-- ������� ������ � ������� �����
INSERT INTO ����� (��������, �����, ����)
VALUES 
('����� � ���', '�������', '������������ �����'),
('������������ � ���������', '�����������', '��������������� �����'),
('������ � ���������', '��������', '����������'),
('���� ��������', '�������', '�����'),
('�����', '�����������', '��������������� �����'),
('����� ���', '�������', '������������ �����'),
('���� � ����', '��������', '�����'),
('������ ������', '���������', '�����'),
('����� ������ �������', '���������', '�����'),
('�������', '��������', '�����');

-- ������� ������ � ������� ������
INSERT INTO ������ (��������, ��������, ����)
VALUES 
('������������', '��������� �����', '������� ����������'),
('������', '��������� �����', '������� ����������'),
('�������', '���� ��������, ����� ��������', '������� ����������'),
('������', '������ �������', '������� ����������'),
('���������� 2', '������ �������', '������'),
('������� �� ������', '����� �����', '������� ����������'),
('����� � �������', '������ �������', '����������'),
('������� �����: ������ IV', '������ �����', '����������'),
('����������', '�������� ������', '������� ����������'),
('����� �������', '��� ������', '������� ����������');

-- ������� ������ � ������� ����������������
INSERT INTO ���������������� (������������Id, �����Id)
VALUES 
((SELECT Id FROM ������������� WHERE ��� = '�����'), (SELECT Id FROM ����� WHERE �������� = '����� � ���')),
((SELECT Id FROM ������������� WHERE ��� = '����'), (SELECT Id FROM �

SELECT o.���, o.�������
FROM ������������� o
JOIN ���������������� rk ON o.Id = rk.������������Id
JOIN ����� k ON rk.�����Id = k.Id
WHERE k.�������� = '����� � ���';


SELECT k.��������, k.�����
FROM ������������� o
JOIN ���������������� rk ON o.Id = rk.������������Id
JOIN ����� k ON rk.�����Id = k.Id
WHERE o.��� = '�����' AND o.������� = '�������';


SELECT o.���, o.�������, f.��������
FROM ������������� o
JOIN ���������������� rf ON o.Id = rf.������������Id
JOIN ������ f ON rf.�����Id = f.Id;


SELECT DISTINCT o.���, o.�������
FROM ������������� o
JOIN ���������������� rk ON o.Id = rk.������������Id
JOIN ���������������� rf ON o.Id = rf.������������Id;


SELECT o.���, o.�������, f.��������
FROM ������������� o
JOIN ���������������� rf ON o.Id = rf.������������Id
JOIN ������ f ON rf.�����Id = f.Id
WHERE f.���� = '������� ����������';
