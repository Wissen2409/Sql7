-- ilk kodumuzu yazalim.

-- ilk database olusturuldu

create database FirstDatabase

-- kullanilacak database secildi

use FirstDatabase
 
create table Personel(

	Id int,

	Ad nvarchar(20),

	Soyad nvarchar(20),

	TC nvarchar(11),

	Eposta nvarchar(30),

	DogumTarihi DATETIME
)
 
-- olusturdugumuz tabloya veri girme islemi

insert into Personel(Id,Ad,Soyad,TC,Eposta) values(1,'Kerem', 'Ayaz', '12345678901', 'test@kerem.com')

-- bir veri daha girelim

insert into Personel(Id,Ad,Soyad,TC,Eposta) values(2,'Selcuk', 'Dinc','10987654321', 'test@selcuk.com')

-- ekledigimiz verilere bakalim

select Id,Ad,Soyad,TC,Eposta from Personel

-- sadece add ve eposta kolonlarini alalim

select Ad,Eposta from Personel

-- bir veri yiginini sorgulamak icin select keywordu kullanilir,

-- from keywordu verilerin hangi tablodan getirilecegini belirler.

 -- Oluşturduğum tabloyu silmek için !! 
 --drop table Personel
 -- bu komut ile oluşturduğunuz tablonun tüm kolonları ve tüm verileri silinir!!

 -- Oluşturmuş olduğunuz database'i silmek için
 --drop DATABASE FirstDatabase


-- Where komutu 
-- Bir sorguya koşul ekler
-- Örnek : 
-- 1 nolu idli personeli getirelim 
select Id,Ad from Personel where Id=1
-- where komutunu konuşalım : where komutu bir veri yığını içerisindeki veriler arasında belirli şartı sağlayan verilerin getirilmesini sağlar.

-- Adı Kerem olan personeller gelsin 

select Ad,Eposta from Personel where Ad='Selcuk'
-- where komutu ile Ad alanına göre arama yaptık, ad alanı metinsel bir kolon olduğu için, o alana verilen Selcuk değeri de, metinsel olacaktır
-- MSSQl'de metinsel veriler tek tırnak '' içerisinde yazılır

-- İki şarta göre veri getirmek 
-- EPosta alanı ve Ad Alanına göre veri getirmek  
select Id,Ad,Eposta from Personel where Ad='Kerem' or Eposta='test@selcuk.com' 
-- c# da gördüğümüz & ve || veya operatörü sql tarafında and ve or operatörü olarak kullanılır!!
-- Yukarıdaki sorguda, Ad alanı Kerem veya EPosta alanı test@selcuk.com olan personelleri listeledik!!

-- Personel tablomuza daha fazla veri girelim 

insert into Personel (Id,Ad,Soyad,EPosta) values (3,'Faruk','Uygur','faruk@faruk.com')

insert into Personel (Id,Ad,Soyad,EPosta) values (4,'Elif','Ergenç','elif.com')

insert into Personel (Id,Ad,Soyad,EPosta) values (5,'Ahmet','Demir','ahmetk@xxx.com')

insert into Personel (Id,Ad,Soyad,EPosta) values (6,'Nur','Erdoğan','nur@xx.com')

insert into Personel (Id,Ad,Soyad,EPosta) values (7,'Ferdi','Şahin','ferdi@xx.com')

insert into Personel (Id,Ad,Soyad,EPosta) values (8,'Banu','Avcı','banu@xxx.com')

insert into Personel (Id,Ad,Soyad,EPosta) values (9,'Melek','Turan','melekk@xxx.com')

insert into Personel (Id,Ad,Soyad,EPosta) values (10,'Dilek','Dinç','dilek@xxx.com')

insert into Personel (Id,Ad,Soyad,EPosta) values (11,'Derya','Bilgiç','derya@xxx.com')

insert into Personel (Id,Ad,Soyad,EPosta) values (12,'Hasan','İpekten','hasan@xxx.com')

-- listelemize bakalım 

select Id,Ad,EPosta,Maas from Personel
-- Tablodan veri silmek 
delete from Personel where Id=12

-- adı dilek olan personeli silelinm 
delete from Personel where Ad='Dilek'

-- Tablodaki bir veriyi güncellemek 
-- Id değeri 6 olan personelin eposta alanını güncelleyelim 
update  Personel set Eposta='yenieposta@x.com' where Id=6

-- iki kolonu birden güncelleme (Ad alanı Faruk olan personelin, Eposta değeri ve Ad değerini güncelleyelim )
update Personel set Eposta='faruk@yyy.com',Ad='Ömer' where Ad='Faruk'

-- Listedeki tüm personellin Eposta alanlarının başına birer a harfi ekleyelim 
update Personel set Eposta='a'+Eposta
-- update işlemini herhangi bir where şartı koymadığımız için, tüm personel listesi etkilendi!!
-- + operatörü c# da olduğu gibi, MSSQl'de de birleştirme işlemi yapar
-- Yukarıda, EPosta kolonu ile a harfi birleştirilip, tekrardan Eposta kolonu güncellendi!!


-- Personel tablosuna, Maas isimli bir kolon ekleyelim tipide int olsun
alter table Personel
add Maas int

-- Tüm personellere maaş verisini ekleyelim 
update Personel set Maas=10000

-- Id değeri 5 olan personelin maaşını %30 artıralım 
update Personel set Maas=Maas*1.30 where Id=5

-- Adı kerem olan personelin maaşına %20 indirim yapalım 
update Personel set Maas=Maas*0.8 where Ad='Kerem'


-- Update yaptığımızda, direk olarak tablo etkilenir!! +,*,- operatörünü select sorgusu içerisinde de yapabiliriz
-- Tüm personellerin maaşını %50 artıralım
select Ad,Maas*1.50 from Personel
-- Select sorgusu olduğu için veriler getirilirken ilgili matematiksel işlem yapılır, Personel tablosu verisi bundan etkilenmez

-- + operatörü iki metinsel kolon arasında kullanılsın 
select Ad+Eposta from Personel
-- yukarıdaki komut ile iki kolon tek kolona düştü iki kolondaki veriler birleştirildi

select 'X'+Ad from Personel


-- Sql Server Matematik Fonksiyonlar

-- Tabloki kayıt sayısını öğrenelim 
select Count(Ad) from Personel

-- Count fonksiyonuna where şartı ekleme
-- Ad alanı Selcuk olan kaç kişi var
select Count(Maas) from Personel where Ad='Selcuk' 
-- Count fonksiyonu vermiş olduğunuz tablodaki satır sayısını sayar!!
--Count fonksiyonunun içerisine vermiş olduğunuz kolon adı farketmez


-- Sum fonksiyonu :Sum Fonksiyonu parametre olarak aldığı kolon içerisindeki verileri toplar!!
-- 1 ve 5 id li personellerin maaşlarının toplamı nedir ? 
select Sum(Maas) from Personel where Id=1 or Id=5

-- = operatörünün yanında <,>,<=,>=,<> operatörleri kullanılır
-- 3 den büyük 6 dan küçük Id değerine sahip olan personellerin maaşlarının toplamı
select Sum(Maas) from Personel where Id>3 and Id<6

-- MAX Fonksiyonu : Verilen kolon içerisindeki en büyük değeri getirecektir

-- Personel tablosundaki en fazla maaş nedir  
select MAX(Maas) from Personel


-- Mın Fonksiyonu : Verilen kolon içerisindeki en küçük değeri getirir
select MIN(Maas) from Personel



-- AVG Fonksiyonu : Parametre olarak verilen kolonun değerinin ortalamasını alır
-- Personel tablosundaki maaşların ortalaması nedir ? 
select AVG(Maas) from Personel 


-- AVG olmadan ortalama nasıl bulunur
select Sum(Maas)/Count(Maas) from Personel
-- Şahinin isteği, en düşük maaşa sahip personel
-- Order by , Order By descending
-- Order by ve Order by descending sıralama ve tersten sıralama işlemi yapar!!

-- Örnek : Personel listesini Id alanına göre tersten listeleyelim 


select Id,Ad,Soyad,Eposta,Maas from Personel
-- bir tablonun tüm kolonlarını getirmek için, kolon adı yazmanıza gerek yoktur!!
select * from Personel


-- Order by Descending işlemine devam edelim
select * from Personel order by Id desc

-- ad alanına göre düzden sıralama yapalım 
select *from Personel order by Ad

-- Sorular : 
-- 
-- 6 numaralı personelin maaşına %50 zam yapalım
-- ıd değeri 2,6,9 olan personellerin id ve eposta alanlarını ekrana getirelim 
select Ad,Eposta from Personel where Id=2 or Id=6 or Id=9
-- Birden fazla filtre ekleyecekseniz

-- In keywordü (birden fazla filtre eklemek için kullanılır)
select Ad,EPosta from Personel where Id in(2,6,9)
-- Not In keyword'ü id değeri 2,6 ve 9 olmayan personeller
select Id,Ad,EPosta from Personel where Id not in (2,6,9)


--Id değeri 5 değerine eşit olmayan personelleri listeleyelim 
-- eşit değil operatörü <>
select Id,Ad,Soyad from Personel where Id<>5
-- bu sorguğu not in ile de yapabiliriz

--!= sql de ki <>
-- 
-- Top keyword'ü

-- Top keyword'ü çoklu satırlı bir sonuç içerisinden istenilen adet kadar almanızı sağlar
-- Maaşı 1000 olan personellerden 2 tanesini getirelim 

select Top 5 Id,Ad,Soyad from Personel where Maas=10000
-- Top ifadesi yazdıktan sonra kaç tane sonuç geleceğini girmeniz gerekmektedir!!1

-- En çok maaş alan personelin  Adı nedir ? 
select Top 1 * from Personel order by Maas desc
-- Listeyi maaş alanına göre tersten sıraladık ve enyüksek maaşlı personel listenin en üstüne çıktı
-- sonrasında listenin en üstünden sadece 1 kayıt aldık 


-- Metinsel Fonksiyonlar ---------------
--LEN fonksiyonu : 
-- Len fonksiyonu metinsel değerlerin uzunluğunu verir
select Ad,LEN(Ad) from Personel
-- Personel listesindeki en uzun isimli personelin bilgilerini ekrana yazdıralım

select Top 1 * from Personel order by Len(Ad) desc

--Len fonksiyonunu bir tabloda bağlı kalmadan da kullanabilirsiniz
select Len('bu bir yazılım dersidir')


-- SubString  : metnin belli bir parçasını almak için kullanılır
-- Örnek : Personel tablosunda Ad kolonundaki verilerin sadece baş harflerini alalım
select Ad,SUBSTRING(Ad,1,1) from Personel 

-- Personel tablosundaki, Ad kolonundaki verilerin son harflerini alalım 
select Ad,SUBSTRING(Ad,LEN(Ad),1) from Personel

-- Personel tablosundaki Ad alanlarının baş harfi ve son harfini alalım ve ortasını ** ile dolduralı m 
select Ad,SUBSTRING(Ad,1,1)+'*****'+SUBSTRING(Ad,LEN(Ad),1) from Personel

-- yıldızları personelin adının uzunluğu kadar koyalım 
select Ad,SUBSTRING(Ad,1,1)+REPLICATE('*',(LEN(Ad)-2))+SUBSTRING(Ad,LEN(Ad),1) from Personel
-- Replicate fonksiyonu, belirli bir karakteri belirli adet oluşturmak için kullanılır

-- Like komutu : 
-- where  : where komutu ile kolon bazlı bir koşul ekleme işlemi yapıyorduk
-- where komutuna ek olarak, like komutu kullandığınızda, kolon bazlı değil de, hücre bazlı bir arama yapabilirsiniz

select *from Personel where Ad='Selcuk'

-- like komutu
-- Örnek : adı m ile başlayan personeller
select * from Personel where Ad like 'm%'
-- Harf% dediğimizde, harf ile başlayan demektir!!

-- adı k ile biten personeller
select * from Personel where Ad like '%k'

-- ad alanının içerisinde a geçen personeller
select * from Personel where Ad like '%a%'

-- adı b yada m ile başlayan personeller
select * from Personel where Ad like '[BM]%'

-- adı n yada k ile bitenler
select * from Personel where Ad like '%[NK]'

-- adının baş harfi a-e arasında olanlar
select * from Personel where Ad like '[A-E]%'

-- adının baş harfi a-e arasında başlamayanlar
select * from Personel where Ad like '[^A-E]%'

-- adının 3. karakteri l olanlar
select *from Personel where Ad like '__l%'

-- 2. harfi e 4. harfi e olanlar
select * from Personel where Ad  like '_e_e%'
-- like ifadesine not keyword'ü eklenebilir!! Eklendiği durumda yazılan sorgunun tam tersi çalışır!!

-- null veriyi yada null olmayan veriyi getirmek için sorgu 
select * from Personel where TC is null -- nulları getirir

-- null olmayanlar gelsin
select *from Personel where TC is not null -- null olmayanları getirir
-- null : bir kolona veri girmedinde olur!!



--- Sorgu esnasında oluşan kolonlara gecici isimler vermek 
select * from Personel

-- Aggragete Function yazdığımızda, 
select Count(Ad) as 'Personel Sayısı' from Personel

-- personel sayısı, toplam maaş ve ortalama maaşı ekrana yazdırınız
select COUNT(Ad) as 'Personel Sayısı',Sum(Maas) as 'Toplam Maaş',AVG(Maas) as 'Ortalama Maaş' from Personel
-- as komutu ile geçici yani sorgulama esnasında oluşan kolonlara isim verebilirsiniz!!!


-- Tarih ve Zaman İşlemleri
-- SQL de, o anki tarih ve xzaman bilgisini ekrana yazdırmak için 
select GetDate()


-- doğum tarihi kolonu ekleyelim 
--alter table Personel
--add DogumTarihi datetime


-- Tarih zaman işleri devam : DateDIFF
-- DateDIFF : iki tarih arasındaki farklı döndürür

-- id değeri 5 olan öğrecinin yası nedir ?


-- DateDiff iki 3 parametre alır
-- 1. parametre iki tarihin arasındaki farkın cinsi
-- 2. parametre tarih alanı
-- 3. parametre tarih alanı

-- tarih alanları manuel girilebildiği gibi, bir sorgudan gelen kolonuda parametre olarak kullanabilirsiniz!!

select * from Personel
select Ad,EPosta,DogumTarihi,DATEDIFF(YEAR,DogumTarihi,GETDATE()) as 'Yas' from Personel where Id=2

-- tarih alanını manuel de girebilirsiniz

select DATEDIFF(YEAR,'1994-02-01','2050-01-01')

-- datediff fonksiyonunun ilk parametresi, iki tarih arasındaki farkın ne cinsinden verileceğidir!!
-- Year : yıl cinsinden verir
--MONTH : ay cinsinden verir
-- Day  : gün cinsinden verir
-- hour : saat cinsinden verir
-- minute : dakika cinsinden verir
-- second : saniye cinsinden

--20 yaşından büyük personeller!!

select * from Personel where DATEDIFF(YEAR,DogumTarihi,GetDate())>35

-- Tüm personellerin yaş toplamları : 

-- Şirketimizin yaş ortalaması nedir !!

select AVG(DATEDIFF(YEAR,DogumTarihi,GetDate())) as 'Ortalama Yas'  from Personel 

-- bir tablodaki tüm verileri silmek için !!
select * from Personel


-- DateADD : Metodu, bir tarih üzerine belirli bir süre ekleme işlemidir!!

select DateAdd(YEAR,18,GETDATE())

-- yukarıdaki DateDIFF örneğinde, bugüne 18 yıl ekleyerek yeni tarihi ekrana yazdırdım!!

-- Personelin emekliliği 60 olduğunu varsayarsak, personeller hangi tarihte emekli olacaklar!!

select Ad,DogumTarihi,DATEADD(YEAR,60-DATEDIFF(year,DogumTarihi,GetDate()),GETDATE()) as 'Emeklilik Tarihi' from Personel

-- DatePART : bir tarihin belirli bir bölümünü döndürür!!

-- doğum tarihi değerinden sadece yıl değerini getir!!!

select DATEPART(year,DogumTarihi) from Personel

-- sadece ay bilgisini getir
select DogumTarihi,DATEPART(MONTH,DogumTarihi) from Personel

-- sadece gün bilgisini getir

select DogumTarihi,DATEPART(DAY,DogumTarihi) from Personel


-- 30-40 yaş arasındaki personellerin ortalama yaşı nedir!!
select AVG(DATEDIFF(YEAR,DogumTarihi,GETDATE())) from Personel 
where DATEDIFF(YEAR,DogumTarihi,GETDATE())>30 and DATEDIFF(YEAR,DogumTarihi,GETDATE())<40

-- yukarıdaki query uzun oldu ise, kısaltma yöntemine bakalım 


select AVG(DATEDIFF(YEAR,DogumTarihi,GETDATE())) as 'Yas' from Personel 
where DATEDIFF(YEAR,DogumTarihi,GETDATE())>30 and DATEDIFF(YEAR,DogumTarihi,GETDATE())<40


-- Gruplama(Group by)
select * from Personel

-- Sorgu 1 : Hangi maaştan kaç kişi var
select Count(Ad) from Personel

select Maas from Personel


select Maas,Count(Maas) from Personel
group by Maas

-- adı aynı harf ile başlayan kaç kişi var!!
select SUBSTRING(Ad,1,1) ,Count(Ad) from Personel
group by SUBSTRING(Ad,1,1)

-- Aynı yılda doğmuş kaç kişi var!
select DATEPART(YEAR,DogumTarihi),Count(*) from Personel
group by DATEPART(YEAR,DogumTarihi)


-- Join : iki yada daha çok tabloyu, birleştirmek!!!


select * from Product
select * from Category
-- 1 nolu kategoriye ait ürünler nelerdir !!!
-- Sports kategorisindeki ürünler
-- Join Ailesi : iki tabloyu sorgu esnasında birleştirmek için kullanılır!!!
-- Join Çeşitleri : İnner Join, Left Join, Right Join, Cross Join'dir
-- İnner Join : 

-- Sports kategorisindeki ürünler nelerdir!!
select Category.category_name, Product.product_name,Product.price
from Product  inner join Category 
on Category.category_id = Product.category_id

-- ilk satır, iki tablodan da getirecek kolonları belirlenir
-- ikinci satırda join ifadesi görülmektedir
-- Join ifadesi iki daha daha çok tabloyu sorgu esnasında birbirine bağlamak için kullanılır!!
-- Join : Her iki tabloda da karşılığı olan kayıtları getirir
-- üçüncü satırda olan on ifadesi, her iki tabloda da ortak olan alanları belirtir. Eğer ortak alan yoksa, join düzgün çalışmaz!!!
-- inner join ifadesi yerine join de yazmanız sonucu etkilemeyecektir!!

-- tablo isimlerine alias verebilirsiniz, alias verdiğinizde, sorgunuz daha kısa olacaktır, 
-- Category tablosu için c, Product tablosu için p alias'ı kullanıldı!!!
--Aynı zamanda alias kullanarak daha okunaklı bir sorgu yapabilirsiniz

select c.category_name, p.product_name,p.price
from Product p inner join Category c
on c.category_id = p.category_id



-- Join ve Group by : 
-- Hangi kategoride kaç adet ürün var ? 

select c.category_name,c.category_id,Count(p.product_name) as 'Ürün sayısı'
from Product p inner join Category c
on c.category_id = p.category_id
group by c.category_name,c.category_id

-- yukarıdaki sorguda, select ifadesinden sonra iki kolon ismi yazdık. Select ifadesinde bir aggrage function
-- varsa, o select ifadesine eklenen tüm kolonların gruplanması gerekmektedir!!!



-- hangi kategoride toplam kaç stok bulunmaktadır!!st
select c.category_name,c.category_id,Sum(p.stock) as 'Stok Sayısı'
from Product p inner join Category c
on c.category_id = p.category_id
group by c.category_name,c.category_id


-- Stok sayısı : 1000 dan küçük olanlar gelsin!!
-- Kategori bazlı stok toplamı, 1000'in altında olan categoriler gelsin!!

select c.category_name,c.category_id,Sum(p.stock) as 'Stok Sayısı'
from Product p inner join Category c
on c.category_id = p.category_id
group by c.category_name,c.category_id
having Sum(p.Stock)<1000

-- where ile gruplanmış bir sorguya şart ekleyemezsiniz!!!
-- gruplama sorgularında, şart having ile eklenir!!! Having her zaman group by keyword'ünden sonra yazılır!!

-- Ben dükkanı satacam, içerideki malların toplam fiyatı nedir !!(Stoklar dahil)

select Sum(Stock*Price) as 'Dükkandaki stokların toplam fiyatı' from Product
-- Categori bazlı ürün toplam fiyatı stok dahil!!

select c.category_name,Sum(p.price*p.stock) as 'Stock dahil toplam',Sum(p.Stock) as 'Stok Sayısı'
from Product p 
inner join Category c
on c.category_id=p.category_id
group by c.category_name
order by --Sum(p.price*p.stock) desc kolonu yazmak yerine, kolonun select sorgusundaki sırasını yazsanızda olur
2 desc


-- En çok ürüne sahip kategori hangisir ?
select Top 1 c.category_name,Sum(p.Stock) from Category c
inner join Product p
on p.category_id=c.category_id
group by c.category_name 
order by 2 desc
--  kategoridekilerdeki en pahalı ürünler nelerdir!!
select c.category_name,p.product_name,price from Category c
inner join Product p
on p.category_id=c.category_id
where price=(select Max(Price) from Product)
-- inner query iç içe sorgu(iç içe query)

-- her kategoride en pahalı ürün nedir ? 
select c.category_name,p.product_name,price from Category c
inner join Product p
on p.category_id=c.category_id
where price=(select Max(Price) from Product p2 where p2.category_id=c.category_id)


-- her kategorideki en ucuz ve en pahalı ürün hangisidir ? (Ödev : )
select c.category_name,p.product_name ,p.price as 'en pahalı fiyat',p2.product_name,p2.price as 'en ucuz fiyat' from Category c
inner join Product p
on p.category_id=c.category_id
inner join Product p2
on p2.category_id=c.category_id
where p.price=
(select Max(p3.Price) from Product p3 where p3.category_id=c.category_id)
OR p2.price=
(select MIN(Price) from Product p4 where category_id=c.category_id)


-- Sql Degisken tanımlama
declare @max DECIMAL
-- yukaruda değişken tanımlandı ilk değerini verelim
set @max=10

-- değeri verdik 
--ekrana yazdıralım 
select @max

-- sorgu sonucunu değişken üzerine alma
select @max=MAX(Price) from Product 
select @max

-- her kategorideki en pahalı ve en ucuz ürün
declare @enpahaliUrunAdi NVARCHAR(max)
declare @enucuzUrunAdi NVARCHAR(MAX)
declare @kategori NVARCHAR(max)
declare @enUcuzFiyat money
declare @enPahaliFiyat money

select @enPahaliFiyat=MAX(Price) from Product where category_id=2
select @enUcuzFiyat=MIN(Price) from Product
select c.category_name,@enPahaliFiyat,@enUcuzFiyat from Category c



-- Sql ile döngü 
declare @dongu INT
set @dongu=0
while @dongu<40
BEGIN
set @dongu=@dongu+1
print @dongu
END

-- Store Procedure

-- Store Procedure SQL deki metotlardır diyebiliriz
-- belirli kod bloklarını store procedure olarak yazıp, sonra sonra çalıştırabiliriz

-- Bir Store Procedure Yazalım 


-- PROCEDURE yerine proc yazılabilir!!
create PROCEDURE SP_First
as 
BEGIN
	select * from Product
END

-- Yazdığımız Store Procedure'ü çalıştıralım

-- çalıştırma aşamasında execute yada exec

exec SP_First


-- Yazılan SP'i güncellemek isterseniz
alter proc SP_First
AS
BEGIN
select product_name from Product
END

-- tekrar çalıştıralım
exec SP_First


-- Int tipinde parametre alan Procedure
create PROCEDURE SP_GetByProductId
(
  @productId int
)
AS
BEGIN

   select * from Product where product_id=@productId
END

-- çağıralım 

-- exec yada execute demeden de procedurleri çalıştırabilirsiniz!!
SP_GetByProductId 5
-- 5 değeri, prosedürümüze parametre olarak gönderilmiştir!!!

-- Daha okunaklı diğer bir yöntem de, parametre adını yazıp göndermektir.

SP_GetByProductId @productId=9

-- iki tane parametre alan procedur!!!

alter proc SP_Product
(

	@categoryId int,
	@price money
)
as
BEGIN

	select * from Product where category_id=@categoryId and price<@price
END

-- çalıştıralım 

-- Store procedürlere parametre gönderirken, birden çok paarametre gönderiyorsanız parametreleri virgül ile ayırabilirsiniz!!
SP_Product 1,150

-- Diğer bir yöntem de, parametre gönderirken parametrelerin adını yazmaktır!!
SP_Product @categoryId=1,@price=150

select * from Category

-- Sports kategorisindeki ürünleri listeleyin, ancak join yapmayın ve, parametre olarak id değeri vermeyin, 
-- SP' sadece nvarchar parametre alsın 

sp_who 'SP_Product'

create proc SP_Category
(
	@categoryName nvarchar(40)
)
AS
BEGIN

	-- aşağıdaki categoryname parametre verilen sorgudan geriye bir category id değeri çıkmaktadır!! 
	-- Bizde bu değeri bir sonraki sorguda kullanmak için bir değişken üzerine aldık.!!!
	--@category_id değeri bir değişkendir
	declare @category_id int
	select @category_id=category_id from Category where category_name=@categoryName

	-- yukarıdaki sorgudan içi dolduran @category_id değeri, alttaki sorguya filtre olarak verdik!!
	select * from Product where category_id=@category_id
END

-- çalıştıralıkm
SP_Category 'Sports2'

-- Yukarıdaki SP'nin içerisindeki Category tablosu sorgusunda, eğer verilen kategori name alanında bir kategori yoksa ? 



-- Sql'de if ve else bulunmaktadır!!!

declare @sayi1 INT
declare @sayi2 INT

set @sayi1=30
set @sayi2=20

if(@sayi1<@sayi2)
BEGIN
	select 'sayi1 daha küçük'
END
ELSE
BEGIN
	select 'sayı2 daha küçük'
END


-- IF komutuna ek olarak Exists keyword'ü kullanılabilir!!


--Exists keyword'ü aldığı sorgudan bir dönüyorsa, true dönmüyorsa false döndürür!!
IF Exists(select * from Product where product_id=1)
BEGIN
	select * from Product where product_id=1
END
ELSE
BEGIN
select 'Sonuç yok!!!'
END


-- Yukarıda yazılan SP'i yeni öğrendiğim if ve exits keywordlerini uygulayayım!!

alter proc SP_Category
(
	@categoryName nvarchar(40)
)
AS
BEGIN

	-- aşağıdaki categoryname parametre verilen sorgudan geriye bir category id değeri çıkmaktadır!! 
	-- Bizde bu değeri bir sonraki sorguda kullanmak için bir değişken üzerine aldık.!!!
	--@category_id değeri bir değişkendir
	declare @category_id int
	IF Exists(select category_id from Category where category_name=@categoryName)
	BEGIN
		select @category_id=category_id from Category where category_name=@categoryName
		select * from Product where category_id=@category_id
	END
	ELSE
	BEGIN
	select 'Girmiş olduğunuz kategori yoktur!!!'
	END
	
END
	-- yukarıdaki sorgudan içi dolduran @category_id değeri, alttaki sorguya filtre olarak verdik!!
	
-- çalıştıralım

SP_Category 'Sports'

-- Sistemde olan hazır procedureler sayesinde bir çok şey yapılabilir!!!

sp_who SP_Category


-- Sistem Store Procedurelerini aşağıdaki linkten bulabilirsiniz
-- https://infocenter.sybase.com/help/index.jsp?topic=/com.sybase.infocenter.dc36273.1550/html/sprocs/CEGHCFJF.htm

-- SQL'de bir çok iş, microsoft tarafından yazılan sistem store procedureleri ile yapılmaktadır!! 

-- 
-- vermiş olduğunuz store procedure parametresine göre verilen procedurenin detaylarını gösterir!!
sp_help 'sp_who'


-- verdiğiniz kullanıcı adına göre hareketleri gösterir
sp_who 'sa'

--sp_helptext proceduresi ile, parametre aldığı procedure'ün içini görebilirsiniz!!!
sp_helptext 'SP_Category'

-- Peki soru : benim yazdığım bir procedure'i başkasının görmesini istemezsek !!!

-- Ödev : Bir procedure oluşturulurken, kimse sp_helptext ile içini görmesin diye, Encrypted procedure oluşturunuz!!!


-- Veri tabanı dosya sistemi hakkında : 
-- Veri tabanı, temel olarak iki dosyadan oluşmaktadır!!

-- ldf uzantılı dosya : LDF dosyası log dosyasıdır!! SQL içerisinde yapılan tüm işlemler, LDF dosyasına yazılır
-- Gerektiğinde, LDF dosyası okunarak yapılan işlemler geri getirilebilir!!
-- mdf dosyası : bu dosya verilerin içerisinde durduğu dosyadır. MSSQL tüm verileri bu dosya içerisne yazar!!

-- LDF dosyası çok büyüdüğünde, silinebilir bu silme işlemine shrink  denir!! Ancak bu dosyası silerken, yapılan tüm işlemlere ait logların silindiğinin bilinmesi gerekmektdir!!

-- Ek olarak mdf ldf dosyasnıa bir dosya daha eklenebilir!! o dosyanın ismi de ndf dosyasıdır!!

-- SQL'de, eğer tablolar çok büyükte, tablo performasını artırmak için SQL Partition yapılabilir!!
-- SQL Partion temel olarak bir tablo içerisindeki verileri parçalara bölmektir.!!1

-- Partion yapıldığında, her bir partion'ın durduğu fiziksek dosyanın uzantısı ndf'dir!!



-- Veri tabanında bir tablo oluşturulurken id değeri her zaman artan bir değer olması istenir!!
-- Id değeri developerlar tarafından yada kullanıcı tarafından gilirse, id değerinde sorun olabilir!!
-- id değeri birbirini tekrar etmeyebilir, yada karışık olabilir!!
-- Dolasıyla id değerini SQL'in otomatik olarak atamasını ayarlayabiliriz!!

create table Departman
(
	Id int IDENTITY(1,1), -- id değeri 1 den başlayacak ve 1er 1er artacak şekidle belirlendi,
	Ad nvarchar(40) UNIQUE -- Ad alanına benzersiz bir değerin girilmesi için Uniq isimli constraint'i ekledik!!
)

insert into Departman (Ad) values ('Satış')

insert into Departman (Ad) values ('IK')

insert into Departman (Ad) values ('Pazarlama')

insert into Departman (Ad) values ('Muhasebe')

insert into Departman (Ad) values ('İdari İşler')

select * from Departman

insert into Departman (Ad) values ('İdari İşler')


-- Sql Function : 
-- Sql de function'lar, procedurelere benzerler, ancak iki temel fark vardır!!
-- 1. Functionlar, geriye bir değer dönebilirler
-- 2. Functionlar select sorguları içerisindeki kullanılabilirler!!

-- personellerin maaşlarına %30 zam yapan bir function yazalım 
create function Fn_ZamYap(@maas money)
Returns money   -- geriye dönülecek değer belirlendi
AS
BEGIN

	declare @newMaas money
	set @newMaas=@maas*1.30
	return @newMaas  -- geriye değer döndüğü için, hesapladığımız değeri geriye döndürdük!!

END

-- Çağıralım: 
select dbo.Fn_ZamYap(10)
-- Function'ı select sorgumuz içersinde kullanabiliriz

select Ad,Soyad,Maas,dbo.Fn_ZamYap(Maas) as 'Zamlı Maaş' from Personel


-- Personelin Doğum tarihini alıp, geriye yaş'ını döndüren function yazınız!!
create function Fn_YasHesap(@tarih datetime)
Returns INT
as
Begin

		declare @yas int
		set @yas=DATEDIFF(YEAR,@tarih,GETDATE())
		return @yas
END

-- kullanalım

select Ad,Soyad,DogumTarihi,dbo.Fn_YasHesap(DogumTarihi) as 'Yaş' from Personel
-- Categori adı alıp, o kategoride kaç adet ürün olduğunu döndüren bir function yazalım
create function Fn_UrunAdet(@categoryName nvarchar(10))
returns int 
AS
BEGIN

		declare @categoryId INT
		select @categoryId=category_id from Category where category_name=@categoryName

		declare @urunSayisi  INT

		-- değişkene bir manuel el ile değer atarken, set demek zorundasınız, ancak değişkenin değeri bir sorgudan geliyorsa, set demek zorunda değilsiniz!!!
		select @urunSayisi=Count(product_name) from Product where category_id=@categoryId

		return @urunSayisi
END

-- Çalıştıralım 

select dbo.Fn_UrunAdet('Books')


-- Functionlardan geriye tablo döndürebilirsiniz!!
-- S ile başlayan ürünleri getiren bir function yazalım !!

create function Fn_GetProduct(@startWith nvarchar(1))
returns table -- geriye tablo döndüren fonksiyonlarda returns table ifafesi kullanılır
AS
Return (

               select product_name from Product where product_name like @startWith+'%'
        )



-- Çalıştıralım

-- Artık Function bir tablo olduğu için, select * from demek gerekmektedir!!
select * from Fn_GetProduct('S') where product_name  like '%m%'

-- yazdığımız fonksiyon geriye bir tablo döndürdüğü için, bu tablo üzerinde where komutu çalıştırabilir!!


-- Tablo yada function oluşturduğumuzda, başına dbo isimli bir şey gelmekteidr.!!

-- Dbo şemadır!!. her tablonun yada her function'un yada store procedure'lerin şemaları olur. Standart eksi belirtilmedikçe dbo'dur

-- Şema konsuu, c# daki , namespace kavramına benzetilebilir!!

-- Şema : aynı isimli tabloları yada diğer yapıları oluşturmak için vardır. Oluşturulan iki aynı isimli yapı, normalde hata verir ancak bu yapı
-- farklı şemalarda tutulursa, hata vermeyecektir!!

-- kendi şemamızı oluşturma!!!
create SCHEMA charp

-- oluşturduğumuz yeni şemayı kullanan bir function yazalım

create function charp.FnStokTopla(@stock int,@price money)
returns money
AS
BEGIN

	declare @toplam money
	set @toplam=@stock*@price
	return @toplam
END

-- kullanalım

-- fonksiyonu kullanırken, yazmış olduğum charp şeması üzerinden çağırdım!!!.

select product_name, stock,price,charp.FnStokTopla(stock,price) from Product

-- Şema nerelerde kullanılır!! Veri tabanları genelde karışıktır, hangi tablonun neye ait olduğunu anlamak genelde zordur!!
-- Şema, tabloları, yaptığı işe göre ayırmak için kullanılabilir!!!




-- Join : 
-- Inner Join , Left Join, Right,Cross

-- Join Hatırlatma

select c.category_name,c.category_id,p.product_name,p.category_id from Product p
inner join Category C
on c.category_id=p.category_id
-- Inner Join : ile iki yada daha fazla tablo birleştiğinde, her iki tabloda da karşılığı olan kayıtlar gelir!!
-- Inner join ile birleştirme işlemlerinde, iki tabloda da karışılığı olan veriler getirilir,

-- Categori tablosundaki bir kategoriye bağlı olmayan, yada hiç bir ürünün bağlı olmadığı kategori inner join ile getirilmez!!!
-- Product - Category


-- Left Join : Solda olan tabloyu referans olarak alır, o tablodaki verinin joinlenen tablodaki verisi yoksa, null değer verirr

select c.category_name,c.category_id,p.product_name,p.category_id from Category c
left join Product p
on c.category_id=p.category_id
-- Yukarıdaki komutu çalıştırdığımda, tüm categoriler listelenecektir!! Ancak kendisine bir ürün bağlı olmadığı için, ürün kısmı null gelecektir!!


-- Right Join : Left Join'in tam tersi olarak çalışır!!
select c.category_name,c.category_id,p.product_name,p.category_id from Category c
RIGHT join Product p
on c.category_id=p.category_id


--Cross Join : 
select Category.category_name,Product.product_name from Category
Cross join Product

-- Cross join, yapıldığında tablodaki ilişkiye bakılmaz, tüm kategoriler ile tüm ürünleri eşleştirir!!,


-- Primary key ve Foreing key Constraintler!!

-- Mevcut tabloya primary key eklemek : 


alter table Category
add CONSTRAINT PK_CategoryId PRIMARY KEY(category_id)

-- Primary Key : Bir tablonun Id kolonun primary key olması, o tabloda id alanında benzersizlik sağlar!! 
--ayrıca her kaydın  Primary Key değerinden ayırt edilmesini sağlar!

-- Primary key, null değer alamayacağı için eşşsiz ve null değer alamayacağını garanti eder!!

-- Id alanı primary key sayesinde, benzersiz olacağı için, veri aramalarında, id değeri üzerinden arama yapılırsa, yüksek hız garanti eder!!

-- sadece kod ile değil aynı zamanda, wizard yöntemi ile de primary key contraint verilebilir!!!


-- Foreing key constraint : Bir primary key ile birlikte çalışır!!
-- İlişkisel tablolarda her iki tabloyu fiziki olarak birbirine bağlamak için, primary key ve foreing key contraint kullanılır!!

-- Product tablosundaki category_id alanı ile Category tablosundaki category_id alanını birbirine bağlıyoruz

-- Category tablosundaki category_id alanı Primary Key

-- Product tablosundaki category_id alanını, foreing key yapalım 

alter table Product 
add CONSTRAINT FK_Product_Category FOREIGN KEY (category_id)
REFERENCES Category(category_id)
on DELETE CASCADE

-- yukarıda product tablosunda FK ekledik, 
-- ekledikten sonra on delete cascade ifadesi ekledik !!

-- on delete cascade ifadesi, ilişkisel tabloda, bir kateogi silindiğinde, ona bağlı olan ürünlerinde silineceğini belirtir!!

-- Diğer ifadeler : On delete  set null  : categori silindiğinde ona bağlı ürünlerin ilişkisi null atanır!!
--                  on delete restrict   : categori silindiğinde, ona bağlı productlar var ise, kategori silinmez!!
--					on delete no action  : bu kuralda, aynı yukarıdaki gibi işler!!
-- 
-- On Delete Cascade : Bir kategori silindiğindei o kategoriye bağlı olan tüm ürünler silinecektir!!!
delete from Category where category_id=5

select product_id,product_name from Product where category_id=5

-- Constraintler :  Constraintler : kolonlara belirli kısıtlar getirmek amacı ile kolon bazlı ayarlanan yapılardır!!

-- Örnek : Primary key, bir constraint'dir
-- Aynı şekilde, Foreing Key de bir constraint'dir

-- Unique Contraint : Bir kolonu unique contraint olarak belirlerseniz o kolona sadece benzersiz bir veri girmek zorunda olursunuz!!
-- Product tablosundaki, Product name alanına unique contraint koyalım!!
-- Contraintler : tablo oluturulurken yapılabildiği gibi, tablo oluşturuldan sonra alter table denilerek de yapılabilir!!

alter table Product
add CONSTRAINT UQ_Name UNIQUE(product_name)
-- Not : unique contraint'i koymak istediğiniz kolonda aynı olan değerler varsa, unique contraint koyamazsınız!!


-- Check Contraint :  Kolona girilecek olan verinin belirli şartlar sağlaması kuralı koyabileceğiniz bir contraint'dir!!

-- Örnek : Product tablosundaki, price alanına 0 dan küçük değer giremez!!
alter table Product 
add CONSTRAINT CHK_Price CHECK(price>0)



-- Default Contraint : 
-- default contraint uygulanan bir kolona veri girilmediği durumda, o kolona hangi verinin girileceğini belirler!!

-- öncesinde bir kolon oluşturalınm 
alter table Product
add InsertedDate DATETIME DEFAULT(GetDate())


-- insert edelim 
insert into Product (product_id,product_name,price,stock,category_id) 
values(201,'Masa',1000,50,3)

select * from Product where product_id=201


-- Not Null Contraint : Bu contraint verilen kolon null değer girileemez!!

-- Örnek : InsertedDate kolonuna not null contraint ekleyelim 



create table Test
(
	id int,
	ad NVARCHAR(10)
)
--Contraint'i verelim 

alter table Test 
alter COLUMN ad NVARCHAR(10) not null


-- product tablosuna yeni bir kolon açıp, default contraint veriniz, sonrasında da aynı tabloya null contraint ekleyiniz!!

-- Trigger : 
-- Triggerlar : tetikleyicilerdir!!!! : 

-- bir olay olduğunda, insert update delete gibi, bu olaylar olduğunda, başka olayları tetiklemeyi trigger ile yapabilirsiniz!!


-- Product tablosuna bir insert geldiği anda, Hesap isimli tabloya, price ve stok değeri çarpılıp eklensin!!

--  öncelikle hesap tablosunu ekleylim 
create table Hesap(
	Id int IDENTITY(1,1) PRIMARY KEY,
	Total money 
)

-- Triggerimizi yazalım!!

-- Product tablosuna bir insert geldiğinde, 

alter TRIGGER TRG_AfterInsertProduct
on Product
after INSERT
as
begin

	-- product tablosuna bir insert geldiğinde, oalcakları buraya yazıyoruz!!
	declare @stok INT
	DECLARE @price money
	-- product tablosuna insert edilen veriyi bir satır olarak alıyor olmam lazım bu keyword'de  INSERTED

	select @stok = stock,@price = price from inserted

	-- yeni insert edilen verileri değişkenlerin üzerine aldım, yeni tabloma insert edeyim!!
	insert into Hesap (Total) values (@stok*@price)
end


-- Product tablosuna bir insert yapalım 

-- öncesinde hesap tablosunda veri var mı bakalım 
insert into Product (product_id,product_name,price,stock,category_id)
VALUES(202,'Çatal',10,50,4)

-- hesap tablosuna bakalım 
select * from Hesap


-- Kullanıcı ve yetki işlemleri : 
-- veri tabanında yetkili kullanıcı oluşturma

create login Wissen With PASSWORD ='Wissen123'

-- Bir kullanıcı oluşturduğumuzda bu kullanıcı hiç bir tabloya yetkili değildir!!

-- oluşturduğumnuz kullanıcıya, category tablosuna erişim verelim 
create user Wissen For Login Wissen

-- yetki verelim 
GRANT SELECT,INSERT on dbo.Category to Wissen

-- Veri tabanı bağlantısından kopup, sonrasında oluşturduğumuz wissen kullancısı ile login olunuz

-- Usernane : Wissen
-- PassWord : Wissen123


-- kullanıcıya verilen yetkiyi geri alma, 
REVOKE SELECT,INSERT ON dbo.Category to Wissen

-- Kullanıcıyı silelim
drop login Wissen

-- MsSql de değişken tiplerinde metinsel veri taşıyan bir kaç tane farklı tip göreceksiniz
-- bunlar;
-- nchar
-- varchar
-- nvarchar
-- char

-- char hep metinsel bir tipi temsil eder!!!
-- ancak char'ın başına gelen n veya var keywordlerinin bir anlamı vardır!!

-- var ifadesi, metinsel değerin unicode yada unicode olmama durumunu belirler
-- n ifadesi ise, metinsel değerin, uzunluğunun değişken olduğunu belirler

-- değişken uzunluk ne demektir!!

-- Örnek siz nvarchar(50 ) boyutunda bir kolon oluşturdunuz,

-- ancak bu kolona 10 karakterli bir değer girdiniz

-- 40 karakter boşluk olmuş oldu!!
--n ve var 

-- n ile bir char tanımlarsanız bu uzunluk değişken olur!!

-- 50 karakter uzunluğuında bir alanı n keyword2ü ile oluşturursanız ve oraya 10 karakter gierseniz 
-- kolonun o veri için uzunluğu 10'a düşer!!


-- unicode : bir karakter setidir!!

-- Özellikle kullanılan iki karaktet set vardır!!

-- ASCII karakter set : Ascı karakter set, ingilizce alfabenin hepsini kapsar, türkçe karaketerinde bazılarını kapsar!!

-- ancak unicode tüm dünya ülkerinin tüm karakerlerini kapsar!!


