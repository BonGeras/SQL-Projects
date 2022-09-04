CREATE TABLE Artykul (
    IDArt varchar2(10)  NOT NULL,
    Autor_Naz varchar2(60)  NOT NULL,
    Gazeta_ID_wydanie varchar2(10)  NOT NULL,
    CONSTRAINT Artykul_pk PRIMARY KEY (IDArt)
) ;

-- Table: Dzialy
CREATE TABLE Dzialy (
    IDDzial varchar2(10)  NOT NULL,
    NazDz varchar2(100)  NOT NULL,
    CONSTRAINT Dzialy_pk PRIMARY KEY (IDDzial)
) ;

-- Table: Firma
CREATE TABLE Firma (
    Nazwa varchar2(30)  NOT NULL,
    Miasto varchar2(30)  NOT NULL,
    CONSTRAINT Firma_pk PRIMARY KEY (Nazwa)
) ;

-- Table: Gazeta
CREATE TABLE Gazeta (
    ID_wydanie varchar2(10)  NOT NULL,
    czas_wydania_gazeta date  NOT NULL,
    Dzialy_IDDzial varchar2(10)  NOT NULL,
    CONSTRAINT Gazeta_pk PRIMARY KEY (ID_wydanie)
) ;

-- Table: Katalog
CREATE TABLE Katalog (
    ID_katalogu varchar2(10)  NOT NULL,
    czas_wydania_katalog date  NOT NULL,
    Dzialy_IDDzial varchar2(10)  NOT NULL,
    CONSTRAINT Katalog_pk PRIMARY KEY (ID_katalogu)
) ;

-- Table: Oferta
CREATE TABLE Oferta (
    Samochod_VIN_number varchar2(10)  NOT NULL,
    Katalog_ID_katalogu varchar2(10)  NOT NULL,
    Cena integer  NOT NULL,
    CONSTRAINT Oferta_pk PRIMARY KEY (Samochod_VIN_number)
) ;

-- Table: Pracowniki
CREATE TABLE Pracowniki (
    IDEmp varchar2(10)  NOT NULL,
    Stanowisko varchar2(20)  NOT NULL,
    Imie varchar2(20)  NOT NULL,
    Nazwisko varchar2(20)  NOT NULL,
    Sex varchar2(1)  NOT NULL,
    Salary integer  NOT NULL,
    Dzialy_IDDzial varchar2(10)  NOT NULL,
    Firma_Nazwa varchar2(30)  NOT NULL,
    CONSTRAINT Pracowniki_pk PRIMARY KEY (IDEmp)
) ;

-- Table: Samochod
CREATE TABLE Samochod (
    VIN_number varchar2(10)  NOT NULL,
    Sprzedawca_ID_sprzed varchar2(10)  NOT NULL,
    Brand varchar2(20)  NOT NULL,
    Kolor varchar2(30)  NOT NULL,
    Model varchar2(30)  NOT NULL,
    rok_produkcji date  NOT NULL,
    IOWD varchar2(500)  NOT NULL,
    Liczba_wlascicelej integer  NOT NULL,
    CONSTRAINT Samochod_pk PRIMARY KEY (VIN_number)
) ;

-- Table: Sprzedawca
CREATE TABLE Sprzedawca (
    ID_sprzed varchar2(10)  NOT NULL,
    Imie varchar2(30)  NOT NULL,
    Nazwisko varchar2(30)  NOT NULL,
    PESEL integer  NOT NULL,
    CONSTRAINT Sprzedawca_pk PRIMARY KEY (ID_sprzed)
) ;

-- foreign keys
-- Reference: Artykul_Gazeta (table: Artykul)
ALTER TABLE Artykul ADD CONSTRAINT Artykul_Gazeta
    FOREIGN KEY (Gazeta_ID_wydanie)
    REFERENCES Gazeta (ID_wydanie);

-- Reference: Gazeta_Dzialy (table: Gazeta)
ALTER TABLE Gazeta ADD CONSTRAINT Gazeta_Dzialy
    FOREIGN KEY (Dzialy_IDDzial)
    REFERENCES Dzialy (IDDzial);

-- Reference: Katalog_Dzialy (table: Katalog)
ALTER TABLE Katalog ADD CONSTRAINT Katalog_Dzialy
    FOREIGN KEY (Dzialy_IDDzial)
    REFERENCES Dzialy (IDDzial);

-- Reference: Pracowniki_Dzialy (table: Pracowniki)
ALTER TABLE Pracowniki ADD CONSTRAINT Pracowniki_Dzialy
    FOREIGN KEY (Dzialy_IDDzial)
    REFERENCES Dzialy (IDDzial);

-- Reference: Pracowniki_Firma (table: Pracowniki)
ALTER TABLE Pracowniki ADD CONSTRAINT Pracowniki_Firma
    FOREIGN KEY (Firma_Nazwa)
    REFERENCES Firma (Nazwa);

-- Reference: Samochody_Sprzedawca (table: Samochod)
ALTER TABLE Samochod ADD CONSTRAINT Samochody_Sprzedawca
    FOREIGN KEY (Sprzedawca_ID_sprzed)
    REFERENCES Sprzedawca (ID_sprzed);

-- Reference: Table_17_Katalog (table: Oferta)
ALTER TABLE Oferta ADD CONSTRAINT Table_17_Katalog
    FOREIGN KEY (Katalog_ID_katalogu)
    REFERENCES Katalog (ID_katalogu);

-- Reference: Table_17_Samochod (table: Oferta)
ALTER TABLE Oferta ADD CONSTRAINT Table_17_Samochod
    FOREIGN KEY (Samochod_VIN_number)
    REFERENCES Samochod (VIN_number);