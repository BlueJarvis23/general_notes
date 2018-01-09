
# MSSQL

## Create Temporary Table

In this case I get a list of lots from MAM and wanted to know which were not in QA Stars. To do this I created a temporary table and
inserted all of the lots into it. Then I was able to use the temporary table in the sub query as needed.

```
Declare @mam table (product_lot_mam nvarchar(50))

INSERT INTO @mam (product_lot_mam)
VALUES ('CQAF02C001'),('CQABPKD001'),('BZAF3G9A07'),('BZAFKAE001'),('BZAFKR6A01'),('BZAFKR6001'),('BZAFKR7001'),('BZAFKAEA03'),('BZAFKAEA04'),('BZAGG88001'),('BZAGG9D001'),('BZAGG9G001'),('BZAGG98001'),('BZAGGH0001'),('BZAGGH7001'),('BZAGGH6001'),('BZAGG9E001'),('BZAGG9F001'),('BZAGHE8001'),('BZAGHEA001'),('BZAGJ1A001'),('BZAGJ0S001'),('BZAGJ0QA01'),('BZAGJ0Q001'),('BZAGG9B001'),('BZAGG9C001'),('BZAGJ4L001'),('BZAGJCG001'),('BZAGJJ7001'),('BZAGJJ9001'),('BZAGJTB001'),('BZAGK02001'),('BZAGK3L001'),('BZAGK3M001'),('BZAGKB5001'),('BZAGKB4001'),('BZAGKY5001'),('BZAGKY4001'),('BZAGKY0001'),('BZAGKY6001'),('BZAGKY1001'),('BZAGKY2001'),('BZAGL32001'),('BZAGL31001'),('BZAGL2Z001'),('BZAGL30001'),('BZAGLAA001'),('BZAGLA9001'),('BZAGLAF001'),('BZAGLKT001'),('BZAGLM9001'),('BZAGLMD001'),('BZAGLMC001'),('BZAGLMF001'),('BZAGLMB001'),('BZAGLMA001'),('BZAGLME001'),('BZAGLM8001'),('BZAGLNH001'),('BZAGLKS001'),('BZAGMYF001'),('BZAGMYJ001'),('BZAGMYG001'),('BZAGMYE001'),('BZAGMYH001'),('BZAGMYC001'),('BZAGNHN001'),('BZAGJ1B001'),('BZAGJ4M001'),('CQAGLMGA01'),('BZAGPCC001'),('BZAGPCL001'),('BZAGPCB001'),('BZAGPEL001'),('BZAGPCH001'),('BZAGPCF001'),('BZAGPCM001'),('BZAGPCD001'),('BZAGPCG001'),('BZAGPCE001'),('BZAGPEP001'),('BZAGPEM001'),('BZAGPCK001'),('BZAGPRX001'),('BZAGPRZ001'),('BZAGPRY001'),('BZAGPRW001'),('BZAGPQB001'),('BZAGPQC001'),('BZAGPQD001'),('BZAGPQE001'),('BZAGPQF001'),('BZAGPQG001'),('BZAGPZ1001'),('BZAGPZ2001'),('BZAGPZ5001'),('BZAGQ5P001'),('BZAGPZ0001'),('CQAGJZ3A01'),('BZAGR37001'),('BZAGR36001'),('BZAGQS1001'),('BZAGQYN001'),('BZAGQYP001'),('BZAGQYQ001'),('BZAGQS0001'),('CQAGQE8A01'),('BZAGT07001'),('BZAGT09001'),('BZAGT0A001'),('BZAGT0G001'),('BZAGT0K001'),('BZAGTM3001'),('BZAGWPG001'),('BZAGWRN001'),('BZAGWRM001'),('BZAGWRL001'),('BZAGWWK001'),('BZAGX20001'),('BZAGXHZ001'),('BZAGXRQ001'),('BZAGXRW001'),('BZAGXRS001'),('BZAGXHY001'),('BZAGYGX001'),('BZAGYGW001'),('BZAGYHL001'),('BZAGYGP001'),('BZAGYHN001'),('BZAGYGM001'),('BZAGYHK001'),('BZAGYHM001'),('BZAGYPKA01'),('BZAGYPK001'),('BZAGYPL001'),('BZAGYSX001'),('BZAGYSY001'),('BZAGZF7001'),('BZAGZQH001'),('BZAGZQG001'),('BZAGZQC001'),('BZAGZQF001'),('BZAGZQE001'),('BZAGZYQ001'),('BZAH05F001'),('BZAH05M001'),('BZAH05K001'),('BZAH05H001'),('BZAH05L001'),('BZAGZQD001'),('BZAH07X001'),('BZAH07Y001'),('BZAH02MA02'),('BZAH0D3001'),('BZAH0GM001'),('BZAH0GN001'),('BZAH0DJ001'),('BZAH0FW001'),('BZAH0FZ001'),('BZAH0DL001'),('BZAH0FQ001'),('BZAH0Q5001'),('BZAH0YE001'),('BZAH0YB001'),('BZAH0YF001'),('BZAH0YD001'),('BZAH1AG001'),('BZAH1QZ001'),('BZAH2KW001'),('BZAH2KX001'),('BZAH2KS001'),('BZAH2KT001'),('BZAH2LC001'),('BZAH2X6001'),('BZAH2W2001'),('BZAH3YL002'),('BZAH3YL001'),('BZAH2W2A03'),('BZAH4F7001'),('BZAH5ED001'),('BZAH5EC001'),('BZAH5EF001'),('BZAH5EE001'),('BZAH5EB001'),('BZAH61P002'),('BZAH61P001'),('BZAH63J001'),('BZAH63L001'),('BZAH63H001'),('BZAH65L001'),('BZAH6S9001'),('BZAH6Y4001'),('BZAH6WN001'),('BZAH727001'),('BZAH76H001'),('BZAH7H9001'),('BZAH7HC001'),('BZAH7HB001'),('BZAH7H8001'),('BZAH76GA01'),('BZAH8A2001'),('BZAH8A3001'),('BZAH8A3A01'),('BZAH8J3001'),('BZAH8J2001'),('BZAH89Q001'),('BZAH8J0001'),('BZAH8HZA01'),('BZAH8HZ001'),('BZAH8J1001'),('BZAH8RW001'),('BZAH8RY001'),('BZAH8ZR001'),('BZAH926001'),('BZAH8ZS001'),('BZAH95M001'),('BZAH8ZW001'),('BZAH8ZTA03'),('BZAH8ZT001'),('BZAH9W4001'),('BZAH9P8001'),('BZAHA04001'),('BZAHA05001'),('BZAHA6B001'),('BZAHA6C001'),('BZAHA6F001'),('BZAH7TG001'),('BZAHA6H001'),('BZAHATJ001'),('BZAHATX001'),('BZAHATK001'),('BZAHATP001'),('BZAHATT001'),('BZAHATN001'),('BZAHATH001'),('BZAHATG001'),('BZAHATL001'),('BZAHATM001'),('BZAHATS001'),('BZAHAXJ001'),('BZAHAXH001'),('BZAHAXG001'),('BZAHAXK001'),('BZAHB48001'),('BZAHAXL001'),('BZAHAXM001'),('BZAHBBC001'),('BZAHBB9001'),('BZAHBB8001'),('BZAHBBD001'),('BZAHBBA001'),('BZAHBRD001'),('BZAHBRC001'),('BZAHBRE001'),('BZAHBR9001'),('BZAHBR8A01'),('BZAHBQP001'),('BZAHBQM001'),('BZAHBTH001'),('BZAHBY0001'),('BZAHBXZ001'),('BZAHBXY001'),('BZAHBY1001'),('BZAHBXX001'),('BZAHBY1A03'),('BZAHC0M001'),('BZAHCJX001'),('BZAHCR8001'),('BZAHCR5001'),('BZAHCR7001'),('BZAHCRA001'),('BZAHCRB001'),('BZAHD9T001'),('BZAHD9S001'),('BZAHDEP001'),('BZAHDBW001'),('BZAHDBY001'),('BZAHCX8001'),('BZAHDBX001'),('BZAHDTA001'),('BZAHEE6001'),('BZAHEFW001'),('BZAHEGTA01'),('BZAHEGTA02'),('BZAHEGTA03'),('BZAHG4X001'),('BZAHG4Y001'),('BZAHG59001'),('BZAHG4S001'),('BZAHGE4001'),('BZAHGGE001'),('BZAHGEL001'),('BZAHGHN001'),('BZAHGGG001'),('BZAHGGF001'),('BZAHGNC001'),('BZAHGR4001'),('BZAHGR2001'),('BZAHGRR001'),('BZAHGRQ001'),('BZAHGNA001'),('BZAHGGH001'),('BZAHGRS001'),('BZAHGRP001'),('BZAHGNB001'),('BZAHGMD001'),('BZAHGR8001'),('BZAHGR8A01'),('BZAHGSW001'),('BZAHGSX001'),('BZAHGWM001'),('BZAHGWN001'),('BZAHGWL001'),('BZAHGWP001'),('BZAHHCL001'),('BZAHHKJ001'),('BZAHHCM001'),('BZAHHEC001'),('BZAHJ8S001'),('BZAHJ8G001'),('BZAHJ8QA01'),('BZAHJ8H001'),('BZAHJH9001'),('BZAHJ8K001'),('BZAHJHA001'),('BZAHJX2001'),('BZAHJSC001'),('BZAHKP8001'),('BZAHKP9001'),('BZAHKPA001'),('BZAHLGD001'),('BZAHLGG001'),('BZAHLA1001'),('BZAHLGB001'),('BZAHLGF001'),('BZAHM2W001'),('BZAHNRG001'),('BZAHNT7001'),('BZAHNYC001'),('BZAHNYA001'),('BZAHNYB001'),('BZAHNRH001'),('BZAHP6M001'),('BZAHP6L001'),('BZAHP6K001'),('BZAHP6F001'),('BZAHP95001'),('BZAHP4HA02'),('BZAHP71001'),('BZAHP4JA04'),('BZAHP72001'),('BZAHP4H001'),('BZAHP4K001'),('BZAHP4J001'),('BZAHC0L001'),('BZAHGMC001'),('DPAFAYQ001'),('BZAHPZ0001'),('BZAHPYZ001'),('BZAHPWL001'),('BZAHPZ1001'),('BZAHPWK001'),('BZAHR9T001'),('BZAHR9R001'),('BZAHR9W001'),('BZAHRKS001'),('BZAHRKA001'),('BZAHRK8001'),('BZAHRK9001'),('BZAHRKB001'),('BZAHRN0001'),('CQAHLJYA01'),('BZAHSTYA01'),('BZAHT1P001'),('BZAHT1N001'),('BZAHTF6001'),('BZAHTF5001'),('BZAHTJB001'),('BZAHTKX001'),('BZAHTKZ001'),('BZAHTKW001'),('BZAHTL0001'),('BZAHTET001'),('BZAHTKS001'),('BZAHTT4001'),('BZAHTT3001'),('BZAHTKT001'),('BZAHW0C001'),('BZAHW9N001'),('CQAHNKPA01'),('BZAHNT4A02'),('BZAHNT6A01'),('CQAHSHAA01'),('BZAHX5PA01'),('CQAHWHHA01'),('BZAHXPC001'),('DPAFNWP001'),('DPAFNWN001'),('BZAHXX7A02'),('BZAHYSEA01'),('BZAHYSC001'),('BZAHYSE001'),('BZAHYSD001'),('BZAHYSDA06'),('BZAHYHMA01'),('BZAHZ8D001'),('BZAHZ8G001'),('BZAHZGZ001'),('BZAHZLQ001'),('BZAHZYW001'),('BZAHZYX001'),('BZAJ07P001'),('BZAJ07N001'),('BZAJ0GS001'),('BZAJ0GT001'),('BZAJ0QG001'),('BZAJ0QF001'),('BZAJ0SQ003'),('BZAJ0SR003'),('BZAJ0SQ002'),('BZAJ0SR002'),('BZAJ185A01'),('BZAJ13EA04'),('BZAJ0NWA01'),('BZAJ1HE001'),('BZAJ1HB001'),('BZAJ1HG001'),('BZAJ1HC001'),('BZAJ1H9001'),('BZAJ1HP001'),('BZAJ1HA001'),('BZAJ1HJ001'),('BZAJ1HH001'),('BZAJ1HFA01'),('BZAJ2RA003'),('BZAHYHM001'),('BZAHZH5001'),('BZAHZ8F001'),('BZAHZ8DA02'),('BZAHZ8FA02'),('BZAHZH6A01'),('BZAHYHMA02'),('BZAJ2QH001'),('BZAJ2RAA08'),('BZAJ2RA001'),('BZAJ2YW001'),('BZAJ3L3001'),('BZAJ33PA01'),('BZAJ3L4001'),('BZAJ4AN001'),('BZAJ4AP001'),('BZAJ5LX001'),('BZAJ5LW001'),('BZAJ7TT001'),('BZAJ7TY001'),('BZAJ7W3001'),('BZAJ7TW001'),('BZAJ7W1001'),('BZAJA0D001'),('BZAJABQ001'),('BZAJET6001'),('BZAJDPC001'),('BZAJEWP001'),('BZAJEWN001'),('BZAJEWG001'),('BZAJEWF001'),('BZAJFQK001'),('BZAJFT9001'),('BZAJFT8001'),('BZAJGY7001'),('BZAJH0H001'),('BZAJJ2G001'),('BZAJL1S001'),('BZAJL0B001'),('BZAJNYY001'),('BZAJL0A001'),('BZAJL0AA03'),('BZAJPNE001'),('BZAJPNB001'),('BZAJPNC001'),('BZAJPNG001'),('BZAJPND001'),('BZAJPNF001'),('BZAJSM9001'),('BZAJST0001'),('BZAJWBC001'),('BZAJWBE001'),('BZAJWNB001'),('BZAJXAA001'),('BZAJWSD001'),('BZAJXEW001'),('BZAJXXL001'),('BZAJY4A001'),('BZAJYB7001'),('BZAJY4B001'),('BZAJYQL001'),('BZAJYQJ001'),('BZAJYQH001'),('BZAJYQF001'),('BZAJYQE001'),('BZAJYQG001'),('BZAJYQGA03'),('BZAJZS4A04'),('BZAK0XJ001'),('BZAK0KT001'),('BZAK0KX001'),('BZAK13F001'),('BZAK2Z3001'),('BZAK2N0001'),('BZAK2N1001'),('BZAK3LH001'),('BZAK3LK001'),('BZAK3LJ001'),('BZAK3LF001'),('BZAK3LE001'),('BZAK3LD001'),('BZAK3LB001'),('BZAK1WN001'),('BZAK1WP001'),('BZAK59X001'),('BZAK623A03'),('BZAHM76A03'),('BZAHM76A04'),('BZAHM76A05'),('BZAK6C5001'),('BZAK6LD001'),('BZAK6LE001'),('BZAK767001'),('DPAHY18A04'),('DPAHY18A0G'),('DPAHY1B001'),('DPAHY1E001'),('DPAHY1EA04'),('DPAHY1K001');

SELECT product_lot_mam FROM @mam WHERE not product_lot_mam in (
SELECT [product_lot_no]
  FROM [STARS_system_inventory].[dbo].[product_master])
ORDER BY product_lot_mam ASC;
```