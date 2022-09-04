----KLIENT INSERTS
INSERT INTO Klient (idk, imie, nazwisko, telefon) VALUES (1, 'SAMUEL','JACKSON', 730765805); 
INSERT INTO Klient (idk, imie, nazwisko, telefon) VALUES (2, 'JOSEF','JOESTAR', 730765801); 
INSERT INTO Klient (idk, imie, nazwisko, telefon) VALUES (3, 'MICHAEL','JACKSON', 730765802); 
INSERT INTO Klient (idk, imie, nazwisko, telefon) VALUES (4, 'SAM','NEWILL', 730765803); 
INSERT INTO Klient (idk, imie, nazwisko, telefon) VALUES (5, 'BOJACK','SIZLACK', 730765804); 

----PRACOWNIK INSERTS
INSERT INTO Pracownik (idp, imie, nazwisko, pensja) VALUES (1, 'ADOLF', 'GOTTE', 6500);
INSERT INTO Pracownik (idp, imie, nazwisko, pensja) VALUES (2, 'JACK', 'LILDONG', 11500);
INSERT INTO Pracownik (idp, imie, nazwisko, pensja) VALUES (3, 'SAM', 'KALLOS', 3500);
INSERT INTO Pracownik (idp, imie, nazwisko, pensja) VALUES (4, 'MICHELE', 'OGANISIAN', 500);
INSERT INTO Pracownik (idp, imie, nazwisko, pensja) VALUES (5, 'GENA', 'SAPOG', 98500);

----MANDAT INSERTS
INSERT INTO Mandat (idm, nazwa, suma_mandat) VALUES (1, 'Opoznienie', 50);
INSERT INTO Mandat (idm, nazwa, suma_mandat) VALUES (2, 'Uszkodzenie', 3000);
INSERT INTO Mandat (idm, nazwa, suma_mandat) VALUES (3, 'Utrata', 50000);
INSERT INTO Mandat (idm, nazwa, suma_mandat) VALUES (4, 'Brudny', 100);
INSERT INTO Mandat (idm, nazwa, suma_mandat) VALUES (5, 'Parkowanie', 200);

----RABAT INSERT
INSERT INTO Rabat (idr, nazwa, procent) VALUES (1, 'Pierze wynajecie', 25);
INSERT INTO Rabat (idr, nazwa, procent) VALUES (2, 'Drugie wynajecie', 10);
INSERT INTO Rabat (idr, nazwa, procent) VALUES (3, 'Trzecie wynajecie', 20);

----MODEL INSERTS
INSERT INTO Model (idm, marka, nazwa) VALUES (1, 'TOYOTA', 'COROLLA');
INSERT INTO Model (idm, marka, nazwa) VALUES (2, 'TOYOTA', 'YARIS');
INSERT INTO Model (idm, marka, nazwa) VALUES (3, 'SKODA', 'RAPID');
INSERT INTO Model (idm, marka, nazwa) VALUES (4, 'VOLSWAGEN', 'POLO');
INSERT INTO Model (idm, marka, nazwa) VALUES (5, 'KIA', 'RIO');

----TYP AUTO INSERTS
INSERT INTO Typ_Auto (idt, nazwa_typu) VALUES (1, 'SEDAN');
INSERT INTO Typ_Auto (idt, nazwa_typu) VALUES (2, 'COMBI');
INSERT INTO Typ_Auto (idt, nazwa_typu) VALUES (3, 'COMPACT');

----AUTO INSERTS
INSERT INTO Auto (ida, numer, rok_wydania, cena, typ_auto_idt, model_idm) 
    VALUES (1, 410, DATE '2012-10-10', 30000, 1, 5);
INSERT INTO Auto (ida, numer, rok_wydania, cena, typ_auto_idt, model_idm) 
    VALUES (2, 420, DATE '2011-11-10', 30000, 1, 4);
INSERT INTO Auto (ida, numer, rok_wydania, cena, typ_auto_idt, model_idm) 
    VALUES (3, 430, DATE '2017-10-10', 30000, 3, 2);
    
----WYDANY SAMOCHOD INSERTS
INSERT INTO Wydany_samochod (idw, data_wydania, liczba_dni, kwota, auto_ida, 
                              pracownik_idp, rabat_idr, klient_idk) 
        VALUES (1, DATE '2020-10-11', 3, 400, 1, 1, 1, 1);
INSERT INTO Wydany_samochod (idw, data_wydania, liczba_dni, kwota, auto_ida, 
                              pracownik_idp, rabat_idr, klient_idk) 
        VALUES (2, DATE '2019-10-11', 2, 700, 2, 2, 2, 2);
INSERT INTO Wydany_samochod (idw, data_wydania, liczba_dni, kwota, auto_ida, 
                              pracownik_idp, rabat_idr, klient_idk) 
        VALUES (3, DATE '2021-10-11', 1, 300, 3, 3, 3, 3);
    
----MANDAT ZA WYNAJEM INSERTS
INSERT INTO Mandat_za_wynajem (mandaty_idm, wydany_samochod_idw) VALUES (1, 1);
INSERT INTO Mandat_za_wynajem (mandaty_idm, wydany_samochod_idw) VALUES (2, 2);
INSERT INTO Mandat_za_wynajem (mandaty_idm, wydany_samochod_idw) VALUES (3, 3);

--2 zapytania, które łączą przynajmniej dwie tabele poprzez JOIN (1)
SELECT a.numer, m.nazwa 
FROM Auto a JOIN Model m ON a.Model_idM = m.idM
WHERE marka = 'TOYOTA'; 


SELECT a.numer 
FROM Auto a JOIN Typ_auto t ON a.Typ_auto_idT = t.idt
WHERE nazwa_typu = 'SEDAN';


--2 zapytania z funkcjami agregującymi (2)
SELECT * 
FROM Pracownik 
WHERE pensja BETWEEN 3000 AND 5000;

SELECT imie 
FROM Klient 
ORDER BY nazwisko ASC;

--1 zapytanie z podzapytaniem (2)
SELECT imie 
FROM Pracownik 
WHERE pensja = (SELECT pensja
                FROM Pracownik 
                WHERE nazwisko LIKE 'OGANISIAN');

--1 zapytanie z podzapytaniem skorelowanym (3) -- NIE MA
SELECT imie, nazwisko, (SELECT pensja 
                        FROM pracownik
                        WHERE MAX(pensja))
FROM pracownik;




