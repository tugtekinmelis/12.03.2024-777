-- Ruhların kaçışı filmini veri tabanına ekleyiniz.

INSERT INTO filmler (film_ad,yonetmen,yil,tur,sure,film_odul)
VALUES ('Ruhların Kaçışı','Hayao Miyozoki',2001,'Animasyon',125,1);

-- Ruhların kaçışı filminin idsini getiren sorguyu yazınız.

SELECT film_ad FROM filmler
WHERE film_ad = 'Ruhların Kaçışı';

--İdsi:233 olan filmin ödül yok süre 108 dakika yap.

UPDATE filmler 
SET film_odul = FALSE , sure=108
WHERE film_id=233;

-- Ruhların kaçışı filmini silen sorguyu yapınız.

DELETE FROM filmler 
WHERE film_ad = 'Ruhların Kaçışı';

-- Eleştiri tablosundaki eleştiri , eleştiri id ve eleştirmen bilgilerini sıralayınız.

SELECT elestiri_metin , film_id , elestirmen
FROM elestiriler;

-- 8.5 puan ve üzerinde eleştiri yapan filmin idsini, eleştiri puanını ve eleştirmen bilgilerini yazınız.

SELECT film_id , puan , elestirmen
FROM elestiriler
WHERE film_id >=8.5;

-- En düşük İMBD puanına sahip 10 filmin tüm bilgilerini listeleyiniz.

SELECT * FROM filmler 
ORDER BY imdb_puan ASC
LIMIT 10;

-- Eleştiri metin alanı boş olan filmleri listeleyiniz.

SELECT * FROM elestiriler 
WHERE elestiri_metin IS NULL;

-- Sadece poster olan filmleri listeleyin.

SELECT * FROM filmler 
WHERE poster IS NOT NULL;

-- 1990 öncesi puanı 9 ve üzerinde olan 100 dakikanın altındaki filmleri listeleyiniz.

SELECT * FROM filmler 
WHERE yil < 1990 AND imdb_puan > 8 AND sure < 100;

-- Süresi 100 dakika altında olan kaç film var.(1)

SELECT * 
FROM filmler 
WHERE sure < 100;

-- 1990,2001,2010,2015 yılında çekilen filmleri getirin.(2)

SELECT *
FROM filmler 
WHERE yil IN (1990,2001,2010,2015);

-- Dram türündeki filmleri getirin.(3)

SELECT *
FROM filmler 
WHERE tur LIKE '%dram%';

-- Yönetmeni Chris olan filmleri yazınız.(4)

SELECT * 
FROM filmler 
WHERE yonetmen LIKE 'Chris%';

-- 1990 ile 2000 yılları arasındaki filmleri listeleyin.(5)

SELECT * 
FROM filmler 
WHERE yil BETWEEN 1990 AND 2000;

-- 1990 ile 2000 yılları arasında en uzun süreye sahip olan filmin süresini getirin.(6)

SELECT *
FROM filmler 
WHERE yil BETWEEN 1990 AND 2000
ORDER BY sure DESC
LIMIT 1;

-- 2000 sonrası en kısa süreye sahip filmi getirin.(7)

SELECT *
FROM filmler 
WHERE yil >=2000
ORDER BY sure ASC
LIMIT 1;

-- 2000 sonrası çekilen filmlerin ortalama süresini getirin.(8)

SELECT AVG (sure) FROM filmler;

-- 1990 ile 2000 yılları arasında en kısa dram türündeki filmin adını, türünü ve süresini getirin.(9)

SELECT film_ad, tur, sure
FROM filmler 
WHERE yil BETWEEN 1990 AND 2000 AND tur LIKE '%dram%';

-- 7 numaralı filmin ortalama eleştiri puanını getirin.(10)

SELECT AVG (Puan) AS ortalama_puan
FROM elestiriler 
WHERE film_id =7;

-- 2024 mart ayında kaç farklı filme eleştiri yapıldığını listeleyin.(11)

SELECT COUNT(DISTINCT film_id) AS toplam_yorum
FROM elestiriler
WHERE elestiri_tarihi
BETWEEN '2024-03-01' AND '2024-03-31';

-- 100 dakikaya en yakın 10 filmin bilgilerine getirin.










