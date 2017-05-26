begin tran
exec [DocumatHaulotte].bul.[ps_Bulletin_Insert] 
@Reference='Bulletin mai', 
@CreatedOn='20170517', 
@CreatedBy='82800', 
@PublishedOn='20170517',
@ExpiredOn='20181231',
@BulletinLevelCode='High',
@bulletinisvalid = 1

update b
set modifiedon = GETDATE(),
modifiedby = createdby
from DocumatHaulotte.bul.Bulletin as b
select * from DocumatHaulotte.bul.Bulletin 

declare @bi int = (select max(bulletinid) from DocumatHaulotte.bul.Bulletin)
insert into DocumatHaulotte.bul.BulletinDescription
values 
  (@bi,1036,'Livraison express non garantie – pièce nécessitant un conditionnement spécifique')
,(@bi,1033,'Express Shipment not guaranteed due to special packaging required')
,(@bi,2057,'Express Shipment not guaranteed due to special packaging required')
,(@bi,3082,'Entrega expres no garantizada – la pieza necesita un acondicionamiento especifico')
,(@bi,1049,'Экспресс отправка не гарантирована из-за требования специальной упаковки')
,(@bi,2070,'Envio expresso não é garantido devido a embalagem especial')
,(@bi,1040,'Spedizioni Express non garantite dovuti a imballi speciali ')
,(@bi,1041,'この商品は特別な梱包が必要な為、エクスプレス便（速達便）での出荷ができない恐れがあります')
,(@bi,2052,'由于需要特殊包装，因此不能保证快递运输。')
,(@bi,1031,'Expressversand auf den nächsten Tag ist nicht garantiert, da Spezialverpackung nötig ist!')



create table #referencesFIRST (
myrefID INT IDENTITY(1, 1) primary key ,
myref nvarchar(max)
)

create table #references (
myrefID INT IDENTITY(1, 1) primary key ,
myref nvarchar(max)
)
insert into #referencesFIRST
values
('4000202541')
,('128p284160')
,('154p246920')
,('138p206620')
,('155p255700')
,('154a146730')
,('154p246930')
,('155p255710')
,('138p212200')
,('154a146740')
,('134b161310')
,('196p318150')
,('154p200280')
,('154a146720')
,('187p210670')
,('128p284170')
,('164p317890')
,('153a141350')
,('4000083330')
,('194p308360')
,('4000075271')
,('155p233580')
,('179p307070')
,('196c153450')
,('194p270650')
,('118b156950')
,('154b163840')
,('158p252170')
,('119b156980')
,('183p257670')
,('179p237600')
,('4000530600')
,('4000034211')
,('2503003800')
,('182b152430')
,('4000043330')
,('149b152611')
,('2431361010')
,('128b160000')
,('179b164520')
,('2326010080')
,('2901000140')
,('4000049460')
,('196p241010')
,('2420801360')
,('148c137340')
,('155p255700')
,('4000202541')
,('2505007390')
,('2420703820')
,('2505004040')
,('k4000005510')
,('134p212190')
,('118c151480')
,('154a146720')
,('154a146710')
,('121p333810')
,('157b155570')
,('196p241010')
,('2326015740')
,('2505007390')
,('138p206620')
,('2421608820')
,('dino48.1357')
,('154p246930')
,('2326010080')
,('2326009930')
,('2420801320')
,('2326005410')
,('2505001540')
,('2421608780')
,('2505001530')
,('2505001550')
,('2421608830')
,('2326001570')
,('133b158580')
,('150p246760')
,('154p246920')
,('164p316390')
,('124b169240')
,('124b169230')
,('178b152420')
,('178b152490')
,('138p206620')
,('2505007390')
,('4000064770')

INSERT into #references
select distinct myref from #referencesFIRST


declare @myrefId int = 0
while (1=1)
BEGIN

SELECT @myrefId = MIN(myrefid)
from #references where myrefid > @myrefId 
if @myrefId is null break
declare @reference nvarchar(max) = 
(select myref
from #references 
where myrefID = @myrefId
)

declare @itemId bigint = (select ItemId from DocumatHaulotte.doc.Item where Code = @reference)

declare @bulletinPeintureId int = (select BulletinId from
DocumatHaulotte.bul.Bulletin where Reference like '%bulletin%')
   
   select * from DocumatHaulotte.bul.BulletinItem where BulletinId = @bulletinPeintureId and ItemId = @itemId -- Before
insert into DocumatHaulotte.bul.BulletinItem values (@itemId,
@bulletinPeintureId) -- Insert
--delete from DocumatHaulotte.bul.BulletinItem where BulletinId = @bulletinPeintureId and ItemId = @itemId -- Delete
   
END






select * from DocumatHaulotte.bul.BulletinItem where BulletinId = @bulletinPeintureId and ItemId in 
( select itemid from DocumatHaulotte.doc.item where code collate Latin1_General_CI_AS in(
select myref from #references))


drop table #referencesFIRST
drop table #references



rollback