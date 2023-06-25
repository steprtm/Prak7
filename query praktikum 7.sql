use bisnis;

ALTER TABLE manajer
ADD COLUMN gaji_pokok VARCHAR(255);

SELECT m.manajer_nik, m.nama, d.nama AS nama_departemen
FROM Manajer m
JOIN Departemen d ON m.id_dept = d.id_dept
WHERE d.id_dept = (
    SELECT id_dept
    FROM Manajer
    WHERE nama = 'Dika'
);

SELECT *
FROM manajer
WHERE gaji_pokok > (
    SELECT AVG(gaji_pokok)
    FROM manajer
)
ORDER BY gaji_pokok DESC;


SELECT m.manajer_nik, m.nama
FROM Manajer m
WHERE m.id_dept IN (
    SELECT id_dept
    FROM Manajer
    WHERE nama LIKE '%K%'
);

SELECT m.manajer_nik, m.nama, d.nama AS nama_departemen
FROM Manajer m
JOIN Departemen d ON m.id_dept = d.id_dept
WHERE d.id_p = (SELECT id_p FROM Perusahaan WHERE nama = 'Kantor Pusat');


SELECT m.manajer_nik, m.nama
FROM Manajer m
WHERE m.id_dept IN (
    SELECT id_dept
    FROM Manajer
    WHERE nama LIKE '%K%'
)
AND m.gaji_pokok > (
    SELECT AVG(gaji_pokok)
    FROM Manajer
);
